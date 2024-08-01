import 'package:flutter/material.dart';

import '../extension/base_context_extension.dart';
import '../flutter_base_config.dart';
import 'base_bloc.dart';
import 'base_bloc_state.dart';
import 'base_stateful.dart';

abstract class BaseStatefulBloc<T extends StatefulWidget, B extends BaseBloc>
    extends BaseStateful<T> {
  B get bloc;

  void setupObserver(BaseBlocState state) {}

  @override
  void initState() {
    bloc.stream.listen((event) {
      setupObserver(event);
      if (event is BaseBlocStateLoadingDialog) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: Center(
                child: FlutterBaseConfig.instance.loadingDialogWidget,
              ),
            );
          },
        );
        return;
      }
      if (event is BaseBlocStateLoadedDialog) {
        context.pop();
        return;
      }
      if (event is BaseBlocStateErrorDialog) {
        showDialog(
          context: context,
          builder: (context) {
            return FlutterBaseConfig.instance.errorDialogWidget;
          },
        );
        return;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    bloc.close();
    super.dispose();
  }
}
