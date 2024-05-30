class VideoCourse {
  final int id;
  final String name;
  final String description;
  final String url;
  final String image;
  final int videoCategoryId;

  VideoCourse({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.image,
    required this.videoCategoryId,
  });

  // Factory constructor to create a VideoCourse from a map
  factory VideoCourse.fromMap(Map<String, dynamic> map) {
    return VideoCourse(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
      url: map['url'],
      videoCategoryId: map['videoCategoryId'],
    );
  }
}
