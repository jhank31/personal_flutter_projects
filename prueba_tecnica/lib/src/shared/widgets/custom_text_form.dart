import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/src/provider/provider.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyDataProvider>(context);
    return Column(
      children: [
        TextField(
          style: textStyle(),
          onChanged: (newText) {
            myData.originCC = newText;
          },
          decoration: const InputDecoration(
              icon: Icon(Icons.person),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelStyle: TextStyle(fontSize: 13),
              labelText: 'Cédula de ciudadanía del remitente'),
        ),
        const SizedBox(height: 15),
        TextField(
          enabled: myData.originCC == '' ? false : true,
          onChanged: (newText) {
            myData.destinationCC = newText;
          },
          decoration: const InputDecoration(
              icon: Icon(Icons.supervised_user_circle),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelStyle: TextStyle(fontSize: 13),
              labelText: 'Cédula de ciudadanía del destinatario'),
        ),
        const SizedBox(height: 15),
        TextField(
          enabled: myData.originCC == '' ? false : true,
          onChanged: (newText) {
            myData.originAccount = newText;
          },
          decoration: const InputDecoration(
              icon: Icon(Icons.arrow_circle_up_rounded),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelStyle: TextStyle(fontSize: 13),
              labelText: 'Número de cuenta del remitente'),
        ),
        const SizedBox(height: 15),
        TextField(
          enabled: myData.originCC == '' ? false : true,
          onChanged: (newText) {
            myData.destinationAccount = newText;
          },
          decoration: const InputDecoration(
              icon: Icon(Icons.arrow_circle_down_rounded),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelStyle: TextStyle(fontSize: 13),
              labelText: 'Número de cuenta del destinatario'),
        ),
        const SizedBox(height: 15),
        TextField(
          enabled: myData.originCC == '' ? false : true,
          onChanged: (newText) {
            myData.amountTransferred = newText;
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Permite solo dígitos
          ],
          keyboardType:
              TextInputType.number, // Indica que el teclado debe ser numérico
          decoration: const InputDecoration(
            icon: Icon(Icons.attach_money_rounded),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            labelStyle: TextStyle(
              fontSize: 13,
            ),
            labelText: 'Monto a transferir',
          ),
        ),
      ],
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 15,
    );
  }
}
