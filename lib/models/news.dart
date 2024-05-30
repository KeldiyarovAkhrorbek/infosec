class News {
  final int id;
  final String name;
  final String description;
  final String url;
  final String image;

  News({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.image,
  });

  // Factory constructor to create a News from a map
  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      image: map['image'],
    );
  }
}
