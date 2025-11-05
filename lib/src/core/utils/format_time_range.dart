import 'package:intl/intl.dart';

String formatTimeRange(String from, String to) {
  try {
    final fromTime = DateFormat("HH:mm").parse(from);
    final toTime = DateFormat("HH:mm").parse(to);
    final formatter = DateFormat("h:mm a");
    return "From ${formatter.format(fromTime)} to ${formatter.format(toTime)}";
  } catch (e) {
    return "Invalid time";
  }
}
