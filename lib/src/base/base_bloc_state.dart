import '../model/base_bloc_exception.dart';

abstract class BaseBlocState {}

class BaseBlocStateInit extends BaseBlocState {}

class BaseBlocStateEmpty extends BaseBlocState {}

class BaseBlocStateLoading extends BaseBlocState {}

class BaseBlocStateLoaded extends BaseBlocState {}

class BaseBlocStateError extends BaseBlocState {
  BaseBlocStateError(this.exception);

  final BaseBlocException exception;
}

class BaseBlocStateLoadingDialog extends BaseBlocState {}

class BaseBlocStateLoadedDialog extends BaseBlocState {}

class BaseBlocStateErrorDialog extends BaseBlocState {
  BaseBlocStateErrorDialog(this.exception);

  final BaseBlocException exception;
}
