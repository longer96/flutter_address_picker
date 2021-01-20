import 'package:flutter_pickers/time_picker/model/date_type.dart';

///   时间选择器  默认 时间设置
///
///
///    var s = PDuration.now();
///     print('longer1 >>> ${s.toString()}');
///    {year: 2021, month: 1, day: 5, hour: 17, minute: 17, second: 3}
///
///     var m = PDuration(year: 2011);
///     print('longer2 >>> ${m.toString()}');
///      {year: 2011, month: null, day: null, hour: null, minute: null, second: null}
///
///     var d = PDuration.parse(DateTime.parse('20200304'));
///     print('longer3 >>> ${d.toString()}');
///     {year: 2020, month: 3, day: 4, hour: 0, minute: 0, second: 0}
///
class PDuration {
  int year;
  int month;
  int day;
  int hour;
  int minute;
  int second;

  PDuration({this.year, this.month, this.day, this.hour, this.minute, this.second});

  // /// maxDate 会用上
  // void max() {
  //   // int maxInt = double.infinity.toInt();
  //   int maxInt = 9999;
  //   this.year = intEmpty(this.year) ? maxInt : this.year;
  //   this.month = intEmpty(this.month) ? maxInt : this.month;
  //   this.day = intEmpty(this.day) ? maxInt : this.day;
  //   this.hour = intEmpty(this.hour) ? maxInt : this.hour;
  //   this.minute = intEmpty(this.minute) ? maxInt : this.minute;
  //   this.second = intEmpty(this.second) ? maxInt : this.second;
  // }
  //
  // /// minDate 会用上
  // void min() {
  //   // int minInt = double.negativeInfinity.toInt();
  //   int minInt = -9999;
  //   this.year = intEmpty(this.year) ? minInt : this.year;
  //   this.month = intEmpty(this.month) ? minInt : this.month;
  //   this.day = intEmpty(this.day) ? minInt : this.day;
  //   this.hour = intEmpty(this.hour) ? minInt : this.hour;
  //   this.minute = intEmpty(this.minute) ? minInt : this.minute;
  //   this.second = intEmpty(this.second) ? minInt : this.second;
  // }

  static bool intEmpty(int value) {
    return (value == null || value == 0);
  }

  // 注意默认会设为0 不是null
  PDuration.parse(DateTime dateTime) {
    this.year = dateTime.year;
    this.month = dateTime.month;
    this.day = dateTime.day;
    this.hour = dateTime.hour;
    this.minute = dateTime.minute;
    this.second = dateTime.second;
  }

  PDuration.now() {
    var thisInstant = new DateTime.now();
    this.year = thisInstant.year;
    this.month = thisInstant.month;
    this.day = thisInstant.day;
    this.hour = thisInstant.hour;
    this.minute = thisInstant.minute;
    this.second = thisInstant.second;
  }

  void setSingle(DateType dateType, var value) {
    switch (dateType) {
      case DateType.Year:
        this.year = value;
        break;
      case DateType.Month:
        this.month = value;
        break;
      case DateType.Day:
        this.day = value;
        break;
      case DateType.Hour:
        this.hour = value;
        break;
      case DateType.Minute:
        this.minute = value;
        break;
      case DateType.Second:
        this.second = value;
        break;
    }
  }

  // 若为null 返回0
  int getSingle(DateType dateType) {
    switch (dateType) {
      case DateType.Year:
        return this.year ?? 0;
      case DateType.Month:
        return this.month ?? 0;
      case DateType.Day:
        return this.day ?? 0;
      case DateType.Hour:
        return this.hour ?? 0;
      case DateType.Minute:
        return this.minute ?? 0;
      case DateType.Second:
        return this.second ?? 0;
    }
    return 0;
  }

  @override
  String toString() {
    return 'PDuration{year: $year, month: $month, day: $day, hour: $hour, minute: $minute, second: $second}';
  }
}