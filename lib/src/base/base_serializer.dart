abstract class BaseSerializer<T> {
  T fromJson(dynamic json);

  T? fromJsonOrNull(dynamic json) {
    try {
      return fromJson(json);
    } catch (exception) {
      return null;
    }
  }

  List<T> fromJsonList(dynamic json) {
    try {
      return (json as List<dynamic>)
          .map((e) => fromJsonOrNull(e))
          .whereType<T>()
          .toList();
    } catch (exception) {
      return [];
    }
  }

  List<T>? fromJsonListOrNull(dynamic json) {
    try {
      return (json as List<dynamic>)
          .map((e) => fromJsonOrNull(e))
          .whereType<T>()
          .toList();
    } catch (exception) {
      return null;
    }
  }
}
