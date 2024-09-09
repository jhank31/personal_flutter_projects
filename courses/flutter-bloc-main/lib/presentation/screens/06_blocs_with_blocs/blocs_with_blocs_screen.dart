import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final locationState = historicLocationBloc.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones guardadas: ${locationState.howManyLocation}'),
      ),
      body: ListView.builder(
        itemCount: locationState.howManyLocation,
        itemBuilder: (BuildContext context, int index) {
          final location = locationState.locations[index];
          final (lat, lng) = location;
          return ListTile(
            title: Text('Lat: $lat - Lng: $lng'),
          );
        },
      ),
    );
  }
}
