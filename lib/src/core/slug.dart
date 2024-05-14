class Slug {
  static String generate(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'[\s-]+'), ' ')
        .replaceAll(RegExp(r'^\s+|\s+$'), '')
        .replaceAll(RegExp(r'\s'), '-');
  }
}
