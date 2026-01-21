class MedicalService {
  final String id;
  final String title;
  final String slug;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalService({
    required this.id,
    required this.title,
    required this.slug,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalService.fromJson(Map<String, dynamic> json) {
    return MedicalService(
      id: json['_id'] ?? json['id'],
      title: json['title'],
      slug: json['slug'],
      imageUrl: json['imageUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
