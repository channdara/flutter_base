import 'package:flutter/material.dart';

import 'src/widget/default_error_dialog.dart';
import 'src/widget/default_loading_dialog.dart';

export 'package:collection/collection.dart';
export 'package:dio/dio.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_localization/flutter_localization.dart';
export 'package:intl/intl.dart';
export 'package:pretty_dio_logger/pretty_dio_logger.dart';
export 'package:shared_preferences/shared_preferences.dart';

export 'src/base/base_bloc.dart';
export 'src/base/base_bloc_state.dart';
export 'src/base/base_model.dart';
export 'src/base/base_repository.dart';
export 'src/base/base_request.dart';
export 'src/base/base_response.dart';
export 'src/base/base_serializer.dart';
export 'src/base/base_service.dart';
export 'src/base/base_stateful.dart';
export 'src/base/base_stateful_bloc.dart';
export 'src/controller/pagination_scroll_controller.dart';
export 'src/extension/base_context_extension.dart';
export 'src/extension/base_string_extension.dart';
export 'src/focus_node/always_disabled_focus_node.dart';
export 'src/input_formatter/no_first_zero_formatter.dart';
export 'src/model/base_bloc_exception.dart';
export 'src/model/base_pagination_item.dart';
export 'src/utility/common_util.dart';
export 'src/utility/material_color_util.dart';

class FlutterBase {
  FlutterBase._();

  static final FlutterBase _instance = FlutterBase._();

  static FlutterBase get instance => _instance;

  Widget? _loadingDialogWidget;
  Widget? _errorDialogWidget;

  Widget get loadingDialogWidget =>
      _loadingDialogWidget ?? const DefaultLoadingDialog();

  Widget get errorDialogWidget =>
      _errorDialogWidget ?? const DefaultErrorDialog();

  set loadingDialogWidget(Widget widget) => _loadingDialogWidget = widget;

  set errorDialogWidget(Widget widget) => _errorDialogWidget = widget;
}
