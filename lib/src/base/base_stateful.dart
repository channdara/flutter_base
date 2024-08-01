import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class BaseStateful<T extends StatefulWidget> extends State<T> {
  void initStatePostFrameCallback() {}

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 100), () {
        initStatePostFrameCallback();
      });
    });
    super.initState();
  }
}
