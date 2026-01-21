class Video {
  final String title;
  final String url;
  final String specialty;
  final String language;

  Video({
    required this.title,
    required this.url,
    required this.specialty,
    required this.language,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title'],
      url: json['url'],
      specialty: json['specialty'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'specialty': specialty,
      'language': language,
    };
  }
}

class DoctorVideoModel {
  final String id;
  final String doctorId;
  final List<Video> videos;
  final DateTime createdAt;
  final DateTime updatedAt;

  DoctorVideoModel({
    required this.id,
    required this.doctorId,
    required this.videos,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorVideoModel.fromJson(Map<String, dynamic> json) {
    return DoctorVideoModel(
      id: json['_id'] ?? json['id'],
      doctorId: json['doctorId'],
      videos:
          (json['videos'] as List<dynamic>?)
              ?.map((v) => Video.fromJson(v))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'videos': videos.map((v) => v.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
