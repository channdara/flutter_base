import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioLoggerInterceptor = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
);
