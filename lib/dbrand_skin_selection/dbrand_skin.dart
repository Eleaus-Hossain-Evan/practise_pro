class DbrandSkin {
  final String name;
  final String image;
  final int color;

  DbrandSkin({
    required this.name,
    required this.image,
    required this.color,
  });
}

final skin = [
  DbrandSkin(
    name: "Sunset Red",
    color: 0xFFE96B6A,
    image: "assets/dbrand_skin_selection/red.jpg",
  ),
  DbrandSkin(
    name: "Sunrise Orange",
    color: 0xFFFE9968,
    image: "assets/dbrand_skin_selection/orange.jpg",
  ),
  DbrandSkin(
    name: "Mellow Yellow",
    color: 0xFFFFD387,
    image: "assets/dbrand_skin_selection/yellow.jpg",
  ),
  DbrandSkin(
    name: "Seafoam Green",
    color: 0xFF6CE5B1,
    image: "assets/dbrand_skin_selection/green.jpg",
  ),
  DbrandSkin(
    name: "Sky Blue",
    color: 0xFF7FE0EB,
    image: "assets/dbrand_skin_selection/blue.jpg",
  ),
  DbrandSkin(
    name: "Kind of Purple",
    color: 0xFF98A2DF,
    image: 'assets/dbrand_skin_selection/purple.jpg',
  ),
  DbrandSkin(
    name: "Off Pink",
    color: 0xFFEBB9D2,
    image: "assets/dbrand_skin_selection/pink.jpg",
  ), // DbrandSkin
  DbrandSkin(
    name: "Pastel Black",
    color: 0xFFD6D9D2,
    image: "assets/dbrand_skin_selection/pastle.jpg",
  ),
];
