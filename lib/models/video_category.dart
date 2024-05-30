class VideoCategory {
  final int id;
  final String name;
  final String image;
  final String description;

  VideoCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  // Factory constructor to create a VideoCategory from a map
  factory VideoCategory.fromMap(Map<String, dynamic> map) {
    return VideoCategory(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
    );
  }

  // Method to convert a VideoCategory to a map
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
    return 'VideoCategory{id: $id, name: $name, image: $image, description: $description}';
  }
}
