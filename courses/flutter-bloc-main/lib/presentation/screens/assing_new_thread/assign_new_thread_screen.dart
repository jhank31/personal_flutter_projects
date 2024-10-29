import 'dart:isolate';

import 'package:blocs_app/config/helpers/hardest_sum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AssignNewThreadScreen extends StatefulWidget {
  const AssignNewThreadScreen({super.key});

  @override
  State<AssignNewThreadScreen> createState() => _AssignNewThreadScreenState();
}

class _AssignNewThreadScreenState extends State<AssignNewThreadScreen> {
  //? step 1 = creamos el ReceivePort
  ReceivePort receivePort = ReceivePort();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //? step 2 = creamos el nuevo hilo
      await Isolate.spawn(hardestSum, receivePort.sendPort);
      //? step 3 = escuchamos el puerto a que nos retorne algo
      receivePort.listen((message) {
        //? step 4 = recibimos el mensaje
        if (kDebugMode) {
          print('Message: $message');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignNewThreadScreen'),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
        child: Text('AssignNewThreadPage'),
      ),
    );
  }
}
