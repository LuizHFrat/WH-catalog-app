enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Armie {
  const Armie({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.power,
    required this.history,
    required this.complexity,
    required this.affordability,
    required this.armielist,
    required this.isXenos,
    required this.isImperium,
    required this.isChaos,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int power;
  final List<String> history;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> armielist;
  final bool isChaos;
  final bool isXenos;
  final bool isImperium;
}
