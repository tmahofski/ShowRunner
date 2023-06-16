import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/main/bloc/main_bloc.dart';
import 'package:show_runner/models/show_models/show.dart';
import 'package:show_runner/navigation/routes.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';
import 'package:show_runner/widgets/show_page_widgets/show_list_tile.dart';

Show tempShow = Show(
  name: 'Temp Name 1',
  description: 'Temp Description 1',
  startDate: DateTime.now(),
  startTime: TimeOfDay.now(),
  endDate: DateTime.now(),
  endTime: TimeOfDay.now(),
  staff: [],
  rings: [],
  events: [],
  attendees: [],
);

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(
        databaseRepository: context.read<AbstractDatabaseRepository>(),
      ),
      child: const MainPageListener(),
    );
  }
}

class MainPageListener extends StatelessWidget {
  const MainPageListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {},
      child: const MainPageBuilder(),
    );
  }
}

class MainPageBuilder extends StatelessWidget {
  const MainPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                },
                icon: const Icon(
                  Icons.logout_rounded,
                ),
              );
            },
          ),
          BlocBuilder<MainBloc, MainState>(builder: (context, state) {
            //Note: This is a test for database interations
            return IconButton(
              onPressed: () {
                context.read<MainBloc>().add(const GetAllShows());
              },
              icon: const Icon(Icons.read_more),
            );
          }),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _generateListView(upcomingShows: state.upcomingShows),
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return CustomFloatingActionButton(
            onTap: () {
              // context.read<MainBloc>().add(AddShow(
              //       show: tempShow,
              //     ));
              context.go(kCreatingShowPath);
            },
          );
        },
      ),
    );
  }

  Widget _generateListView({
    required List<Show> upcomingShows,
  }) {
    return ListView.builder(
      itemCount: upcomingShows.length,
      itemBuilder: (context, i) {
        final Show currentShow = upcomingShows[i];

        return ShowListTile(show: currentShow);
      },
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.lightBlue.shade400,
          ),
          child: SizedBox(
            width: 200,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Icon(Icons.add),
                  Text(
                    'Add Show',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
