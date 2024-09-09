import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //! cuando se usa el watch, el widget se redibuja cuando el estado cambia
    //! se valida cada uno de los componentes del widget
    //final usernameCubit = context.watch<UsernameCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit'),
        ),
        body: Center(
          //! cuando se usa el BlocBuilder, solo se redibuja o evalua el widget hijo 
          child: BlocBuilder<UsernameCubit, String>(
            //* se puede usar el buildWhen para validar si se redibuja el widget
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Text(
                state,
                style: const TextStyle(fontSize: 24),
              );
            },
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //! cuando se usa el read no es para estar pendiente de nuevos cambios del estado, 
            //! solo se usa para obtener el estado actual o emitir nuevos estados
            context.read<UsernameCubit>().setUsername(
              RandomGenerator.getRandomName(),
            );
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
