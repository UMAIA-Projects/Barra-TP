class Discount {
  final int id;
  final String title;
  final bool isSmall;

  Discount({
    required this.id,
    required this.title,
    this.isSmall = false,
  });
}
