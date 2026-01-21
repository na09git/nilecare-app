enum UserRole { USER, ADMIN, DOCTOR }

class UserModel {
  final String id;
  final String name;
  final String slug;
  final String email;
  final String phone;
  final DateTime? emailVerified;
  final String? image;
  final UserRole role;
  final String? plan;
  final String password;
  final List<String> symptomIds;
  final int? resetToken;
  final DateTime? resetTokenExpiry;
  final String? serviceId;
  final String? specialityId;
  final bool isVerified;
  final int token;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.email,
    required this.phone,
    this.emailVerified,
    this.image,
    required this.role,
    this.plan,
    required this.password,
    required this.symptomIds,
    this.resetToken,
    this.resetTokenExpiry,
    this.serviceId,
    this.specialityId,
    required this.isVerified,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      slug: json['slug'],
      email: json['email'],
      phone: json['phone'] ?? '',
      emailVerified: json['emailVerified'] != null
          ? DateTime.parse(json['emailVerified'])
          : null,
      image: json['image'],
      role: UserRole.values.firstWhere(
        (e) => e.toString().split('.').last == json['role'],
        orElse: () => UserRole.USER,
      ),
      plan: json['plan'],
      password: json['password'] ?? '',
      symptomIds: List<String>.from(json['symptomIds'] ?? []),
      resetToken: json['resetToken'],
      resetTokenExpiry: json['resetTokenExpiry'] != null
          ? DateTime.parse(json['resetTokenExpiry'])
          : null,
      serviceId: json['serviceId'],
      specialityId: json['specialityId'],
      isVerified: json['isVerfied'] ?? false,
      token: json['token'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'email': email,
      'phone': phone,
      'emailVerified': emailVerified?.toIso8601String(),
      'image': image,
      'role': role.toString().split('.').last,
      'plan': plan,
      'password': password,
      'symptomIds': symptomIds,
      'resetToken': resetToken,
      'resetTokenExpiry': resetTokenExpiry?.toIso8601String(),
      'serviceId': serviceId,
      'specialityId': specialityId,
      'isVerfied': isVerified,
      'token': token,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
