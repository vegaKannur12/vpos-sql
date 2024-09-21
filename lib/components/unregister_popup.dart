import 'package:flutter/material.dart';
import 'package:sqlorder24/screen/NEWPAGES/nextscreen.dart';
import 'package:sqlorder24/screen/ORDER/1_companyRegistrationScreen.dart';
import 'package:sqlorder24/screen/ORDER/externalDir.dart';

class Unreg {
  ExternalDir externalDir = ExternalDir();
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        // Map<String, dynamic>? temp = await externalDir.fileRead();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NextPage(
              // temp: temp!,
            ),
          ),
        );
      },
    );
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Do you want to unregister!!"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
