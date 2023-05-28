import 'package:flutter/material.dart';
import 'package:show_runner/models/show_models/show.dart';

class ShowListTile extends StatelessWidget {
  const ShowListTile({
    required this.show,
    super.key,
  });

  final Show show;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (value) {},
        value: false,
      ),
      title: Text(show.name),
      subtitle: const Text('Date/Location'),
    );
  }
}
