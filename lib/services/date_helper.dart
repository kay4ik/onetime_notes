class DateHelper {
  static String writeDate(DateTime date) {
    return "${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}";
  }
}