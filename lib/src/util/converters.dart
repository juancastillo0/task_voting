import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

class ObservableSetStringConverter
    implements JsonConverter<ObservableSet<String>, List<Object?>> {
  const ObservableSetStringConverter();
  @override
  ObservableSet<String> fromJson(List<Object?> json) =>
      ObservableSet<String>.of(json.cast());

  @override
  List<Object?> toJson(ObservableSet<String> object) => object.toList();
}
