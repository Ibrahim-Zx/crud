// ignore_for_file: must_be_immutable

import 'package:crud/util/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Colors.deepPurple[100],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dialog,
                style: GoogleFonts.merienda(),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
