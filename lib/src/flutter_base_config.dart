import 'package:flutter/material.dart';

import 'widget/default_error_dialog.dart';
import 'widget/default_loading_dialog.dart';

class FlutterBaseConfig {
  FlutterBaseConfig._();

  static final FlutterBaseConfig _instance = FlutterBaseConfig._();

  static FlutterBaseConfig get instance => _instance;

  Widget? _loadingDialogWidget;
  Widget? _errorDialogWidget;
  String? _apiBaseUrl;
  String? _accessToken;

  Widget get loadingDialogWidget =>
      _loadingDialogWidget ?? const DefaultLoadingDialog();

  Widget get errorDialogWidget =>
      _errorDialogWidget ?? const DefaultErrorDialog();

  String get accessToken => _accessToken ?? '';

  String get apiBaseUrl => _apiBaseUrl ?? '';

  set loadingDialogWidget(Widget widget) => _loadingDialogWidget = widget;

  set errorDialogWidget(Widget widget) => _errorDialogWidget = widget;

  set accessToken(String? token) => _accessToken = token;

  set apiBaseUrl(String? url) => _apiBaseUrl = url;
}
