extension FormatNumber on String {
  String formatNumber() {
    return replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ');
  }
}