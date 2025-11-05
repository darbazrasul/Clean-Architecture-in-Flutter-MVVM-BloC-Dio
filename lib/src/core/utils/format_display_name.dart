String formatDisplayName(String formName) {
  return formName
      .split('_')
      .map(
        (word) => word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
      )
      .join(' ');
}
