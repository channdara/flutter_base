import 'package:flutter/material.dart';

class DefaultLoadingDialog extends StatelessWidget {
  const DefaultLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
