import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/create_show/bloc/create_show_bloc.dart';
import 'package:show_runner/navigation/routes.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';
import 'package:show_runner/widgets/input_widgets/custom_text_form_field.dart';

class CreateShowPage extends StatelessWidget {
  const CreateShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateShowBloc(
        databaseRepository: context.read<AbstractDatabaseRepository>(),
      ),
      child: const CreateShowListener(),
    );
  }
}

class CreateShowListener extends StatelessWidget {
  const CreateShowListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateShowBloc, CreateShowState>(
      listener: (context, state) {
        if (state is CreateShowSuccess) {
          context.go(kMainPath);
        }
      },
      child: const CreateShowBuilder(),
    );
  }
}

class CreateShowBuilder extends StatelessWidget {
  const CreateShowBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CreateShowBloc, CreateShowState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (state is CreateShowInitial ||
                  state is CreateShowInProgress) ...<Widget>[
                CustomTextFormField(
                  hintText: 'Show Name',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(ShowNameChanged(showName: value));
                  },
                ),
                CustomTextFormField(
                  hintText: 'Show Description',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(ShowDescriptionChanged(showDescription: value));
                  },
                ),
                CustomTextFormField(
                  hintText: 'Show Location',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(ShowLocationChanged(showLocation: value));
                  },
                ),
                CustomTextFormField(
                  hintText: 'Show Dates',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(ShowDatesChanged(showDates: value));
                  },
                ),
                CustomTextFormField(
                  hintText: 'Show Times',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(ShowTimesChanged(showTimes: value));
                  },
                ),
                CustomTextFormField(
                  hintText: 'Other Owners',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(OtherOwnersChanged(otherOwners: value));
                  },
                ),
                CustomTextFormField(
                  hintText: 'Other Staff',
                  onChanged: (value) {
                    context
                        .read<CreateShowBloc>()
                        .add(OtherStaffChanged(otherStaff: value));
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CreateShowBloc>()
                        .add(CreateShowSubmitButtonPressed());
                  },
                  child: const Text('Create Show'),
                ),
              ] else ...<Widget>[
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
