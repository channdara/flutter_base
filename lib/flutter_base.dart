/// Flutter Base library
library;

/// Expose the external resource from another packages
export 'package:collection/collection.dart';
export 'package:dio/dio.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_localization/flutter_localization.dart';
export 'package:intl/intl.dart';
export 'package:pretty_dio_logger/pretty_dio_logger.dart';
export 'package:shared_preferences/shared_preferences.dart';

/// Expose the internal resources
export 'src/base/export_base.dart';
export 'src/controller/export_controller.dart';
export 'src/extension/export_extension.dart';
export 'src/flutter_base_config.dart';
export 'src/focus_node/export_focus_node.dart';
export 'src/input_formatter/export_input_formatter.dart';
export 'src/model/export_model.dart';
export 'src/network/export_network.dart';
export 'src/utility/export_utility.dart';
export 'src/widget/export_widget.dart';
