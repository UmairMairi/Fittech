extension DateExtentions on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isDateAfterDuration(DateTime other, Duration duration) {
    return year == other.year &&
        month == other.month &&
        day == other.day + duration.inDays;
  }
  bool isDateBeforeDuration(DateTime other, Duration duration) {
    return year == other.year &&
        month == other.month &&
        day == other.day - duration.inDays;
  }
}
