// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, strict_raw_type, use_super_parameters, lines_longer_than_80_chars

import 'dart:async';
import 'package:flutter/widgets.dart';

/// se usan generics para definir el tipo de estado
/// que manejará el Bloc
abstract class BlocBase<State> {
  /// Constructor de la clase
  BlocBase(this._state);

  /// Estado inicial
  /// el state es el valor dinamico que se
  /// le asigna al estado puede ser cualquier valor, un entero, un string,
  /// un objeto, etc.
  State _state;

  /// StreamController para los eventos
  /// que se emiten al Bloc
  /// Se usa broadcast para que varios
  /// widgets puedan escuchar los eventos
  final _stateController = StreamController<State>.broadcast();

  State get state => _state;
  Stream<State> get stream => _stateController.stream;

  void emit(State newState) {
    /// ejemplo: si el state actual es un int 0 y el nuevo state es un int 1
    /// entonces se emite el nuevo state
    if (_state != newState) {
      _state = newState;
      _stateController.add(_state);
    }
  }

  void close() {
    /// se cierra el stream
    _stateController.close();
  }
}

/// Implementación de Bloc con eventos
abstract class Bloc<Event, State> extends BlocBase<State> {
  /// este es un constructor que usa las {} para ejecutar acciones al momento
  /// en el que se crea la instancia de la clase
  Bloc(super.initialState) {
    // ignore: unnecessary_lambdas
    /// se escuchan los eventos que se emiten
    /// al Bloc y se mapean a un estado
    _eventController.stream.listen(mapEventToState);
  }

  /// definimos un streamController para los eventos
  final _eventController = StreamController<Event>();

  /// definimos el metodo que va a mapear los eventos
  void add(Event event) {
    _eventController.add(event);
  }

  /// este metodo de mapEventToState es abstracto y se debe implementar
  /// en las clases que hereden de esta clase
  /// por ejemplo en el archivo counter_bloc.dart
  void mapEventToState(Event event);

  @override
  void close() {
    _eventController.close();
    super.close();
  }
}

/// Widget para proporcionar un Bloc
class BlocProvider<T extends BlocBase> extends InheritedWidget {
  const BlocProvider({
    required this.bloc,
    required Widget child,
    super.key,
  }) : super(child: child);
  /// los : se usan en un constructor para asignar valores a las variables
  /// de la clase
  
  /// el bloc que se va a proporcionar y tiene que se una instancia de BlocBase
  /// o una clase que herede de BlocBase
  final T bloc;

  /// este metodo se usa para obtener el Bloc de un widget
  /// y se usa el T of<T extends BlocBase> para definir el tipo de Bloc
  /// que se va a obtener, ademas es una funcion estatica
  /// esta funcion se llama o se ejecuta cuando se llama a la funcion of
  static T of<T extends BlocBase>(BuildContext context) {
    /// se obtiene el proveedor de Bloc que se encuentra en el arbol de widgets
    /// y se asigna a la variable provider
    final provider =
        context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>();
    assert(provider != null, 'No BlocProvider found for $T');
    /// retornamos el bloc que se encuentra en el provider
    return provider!.bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

/// Widget que reconstruye la UI cuando el estado cambia
/// usamos los generics para definir el tipo de Bloc y el tipo de estado
class BlocBuilder<B extends BlocBase<S>, S> extends StatelessWidget {
  const BlocBuilder({
    required this.bloc,
    required this.builder,
    super.key,
  });
  /// el bloc que se va a usar
  final B bloc;
  /// el builder que se va a usar que recibe el context y el estado
  final Widget Function(BuildContext, S) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      stream: bloc.stream,
      initialData: bloc.state,
      builder: (context, snapshot) => builder(context, snapshot.data as S),
    );
  }
}

/// Widget que escucha cambios de estado sin reconstrucción
class BlocListener<B extends BlocBase<S>, S> extends StatefulWidget {
  const BlocListener({
    required this.bloc,
    required this.listener,
    required this.child,
    super.key,
  });
  final B bloc;
  final void Function(BuildContext, S) listener;
  final Widget child;

  @override
  _BlocListenerState<B, S> createState() => _BlocListenerState<B, S>();
}

class _BlocListenerState<B extends BlocBase<S>, S>
    extends State<BlocListener<B, S>> {
  @override
  void initState() {
    super.initState();
    widget.bloc.stream.listen((state) => widget.listener(context, state));
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
