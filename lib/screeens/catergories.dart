class Category {
  final String title;
  final String image;
  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "shoes", image: "assets/images/purpleHeels.png"),
  Category(title: "dress", image: "assets/images/orangeblouses.png"),
  Category(title: "neck", image: "assets/images/neckless.png"),
  Category(title: "jacket", image: "assets/images/Jacketgirl.png"),
  Category(title: "bags", image: "assets/images/ValentinoBag.png"),
];
