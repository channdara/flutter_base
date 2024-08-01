import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/base_bloc_exception.dart';
import 'base_bloc_state.dart';

abstract class BaseBloc extends BlocBase<BaseBlocState> {
  BaseBloc() : super(BaseBlocStateInit());

  bool get isLoading => _isLoading;

  bool _isLoading = false;
  bool _asDialog = false;

  void dispose() {}

  void emitLoading({bool asDialog = false}) {
    if (_isLoading) return;
    _isLoading = true;
    _asDialog = asDialog;
    asDialog
        ? emit(BaseBlocStateLoadingDialog())
        : emit(BaseBlocStateLoading());
  }

  void emitLoaded() {
    if (!_isLoading) return;
    _isLoading = false;
    _asDialog ? emit(BaseBlocStateLoadedDialog()) : emit(BaseBlocStateLoaded());
  }

  void emitEmpty() => emit(BaseBlocStateEmpty());

  void callEmit(BaseBlocState state) => emit(state);

  Future<void> execute({
    required Future<void> Function() requesting,
    Function(BaseBlocException exception)? onError,
  }) async {
    try {
      if (_isLoading) return;
      await requesting();
    } catch (exception) {
      emitLoaded();
      if (onError != null) {
        final error = _handleErrorException(exception);
        onError(error);
      } else {
        emitError(exception);
      }
    }
  }

  void emitError(dynamic exception, {bool? forceDialog}) {
    final error = _handleErrorException(exception);
    if (error.isUnauthorized) {
      emit(BaseBlocStateErrorDialog(error));
      return;
    }
    (forceDialog ?? _asDialog)
        ? emit(BaseBlocStateErrorDialog(error))
        : emit(BaseBlocStateError(error));
  }

  BaseBlocException _handleErrorException(dynamic exception) {
    if (exception is BaseBlocException) return exception;
    if (exception is DioException) {
      final code = exception.response?.statusCode ?? 0;
      final message = exception.response.toString();
      return BaseBlocException(code, message);
    }
    return BaseBlocException(0, exception.toString());
  }
}
