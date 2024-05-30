class Site {
  final int id;
  final String name;
  final String description;
  final String url;
  final String type;
  final String image;

  Site({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.type,
    required this.image,
  });

  // Factory constructor to create a Site from a map
  factory Site.fromMap(Map<String, dynamic> map) {
    return Site(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      type: map['type'],
      image: map['image'],
    );
  }
}
