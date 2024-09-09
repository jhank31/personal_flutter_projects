import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guestBloc = context.read<GuestBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          guestBloc.createNewGuest(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestBloc = context.watch<GuestBloc>();
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),
        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestFilter.invited, icon: Text('Invitados')),
            ButtonSegment(
                value: GuestFilter.noInvited, icon: Text('No invitados')),
          ],
          selected: <GuestFilter>{guestBloc.state.currentFilter},
          onSelectionChanged: (value) {
            guestBloc.changeFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestBloc.state.totalGuest,
            itemBuilder: (context, index) {
              final guest = guestBloc.state.filteredGuest[index];
              return SwitchListTile(
                  title: Text(guest.description),
                  value: guest.done,
                  onChanged: (value) {
                    guestBloc.updateToggle(guest.id);
                  });
            },
          ),
        )
      ],
    );
  }
}
