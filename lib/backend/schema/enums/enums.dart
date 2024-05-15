import 'package:collection/collection.dart';

enum GlowUpReportType {
  Politicalsensitivity,
  Violentpornography,
  Advertisingharassment,
  Infringement,
  Other,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (GlowUpReportType):
      return GlowUpReportType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
