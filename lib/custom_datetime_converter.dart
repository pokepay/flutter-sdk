import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

DateFormat customDateFormatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String utcStringDate) {
    if (utcStringDate == null) {
      return null;
    } else {
      int microsecond = 0;
      utcStringDate =
          utcStringDate.replaceAllMapped(new RegExp(r'([0-9]{3})Z$'), (match) {
        microsecond = int.parse(match.group(1));
        return '';
      });
      return customDateFormatter
          .parse(utcStringDate, true)
          .add(Duration(microseconds: microsecond))
          .toLocal();
    }
  }

  @override
  String toJson(DateTime localDateTime) {
    if (localDateTime == null) {
      return null;
    } else {
      return customDateFormatter.format(localDateTime.toUtc()) +
          localDateTime.microsecond.toString().padLeft(3, '0') +
          'Z';
    }
  }
}
