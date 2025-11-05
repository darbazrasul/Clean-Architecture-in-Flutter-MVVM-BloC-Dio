String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date).inDays;

  if (difference == 0) {
    return 'Today';
  } else if (difference == 1) {
    return 'Yesterday';
  } else if (difference < 7) {
    return '$difference days ago';
  } else {
    return '${date.day}/${date.month}/${date.year}';
  }
}
