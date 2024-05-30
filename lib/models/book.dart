class Book {
  final int id;
  final String name;
  final String description;
  final String url;
  final String image;
  final int bookCategoryId;

  Book({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.bookCategoryId,
    required this.image,
  });

  // Factory constructor to create a Book from a map
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      bookCategoryId: map['videoCategoryId'],
      image: map['image'],
    );
  }
}
