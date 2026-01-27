import 'package:flutter/material.dart';
import 'update_dialoge.dart';

void showAppUpdateDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AppUpdateDialog(),
  );
}
