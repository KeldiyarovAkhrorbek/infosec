class BookCategory {
  final int id;
  final String name;
  final String image;
  final String description;

  BookCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  // Factory constructor to create a BookCategory from a map
  factory BookCategory.fromMap(Map<String, dynamic> map) {
    return BookCategory(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
    );
  }

  // Method to convert a BookCategory to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'BookCategory{id: $id, name: $name, image: $image, description: $description}';
  }
}
