// ignore_for_file: must_be_immutable

import 'package:crud/util/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String dialog;
  dynamic Function()? onClickSave;
  DialogBox({
    super.key,
    required this.dialog,
    required this.onClickSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text(dialog)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  buttonName: 'Confirm',
                  onPressed: onClickSave,
                ),
                const SizedBox(width: 10),
                Button(
                  buttonName: 'Cancel',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
