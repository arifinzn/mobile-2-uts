import 'package:timeago/timeago.dart' as timeago;

class timeAgo {
  static String stringTimeToTimeago(String timeString) {
    DateTime fromString = DateTime.parse(timeString);

    return timeago.format(fromString, locale: 'id');
  }
}
