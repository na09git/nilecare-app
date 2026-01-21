enum DoctorStatus { PENDING, APPROVED, REJECTED }

class Availability {
  final String id;
  final String doctorProfileId;
  final List<String> monday;
  final List<String> tuesday;
  final List<String> wednesday;
  final List<String> thursday;
  final List<String> friday;
  final List<String> saturday;
  final List<String> sunday;
  final DateTime createdAt;
  final DateTime updatedAt;

  Availability({
    required this.id,
    required this.doctorProfileId,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      id: json['_id'] ?? json['id'],
      doctorProfileId: json['doctorProfileId'],
      monday: List<String>.from(json['monday'] ?? []),
      tuesday: List<String>.from(json['tuesday'] ?? []),
      wednesday: List<String>.from(json['wednesday'] ?? []),
      thursday: List<String>.from(json['thursday'] ?? []),
      friday: List<String>.from(json['friday'] ?? []),
      saturday: List<String>.from(json['saturday'] ?? []),
      sunday: List<String>.from(json['sunday'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorProfileId': doctorProfileId,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class DoctorProfile {
  final String id;
  final String userId;
  final DoctorStatus status;
  final String trackingNumber;
  final String firstName;
  final String lastName;
  final String? middleName;
  final DateTime? dob;
  final String? gender;
  final String? page;
  final Availability? availability;
  final String? profilePicture;
  final String? bio;
  final String? medicalLicense;
  final DateTime? medicalLicenseExpiry;
  final int? yearsOfExperience;
  final String? email;
  final String? phone;
  final String? country;
  final String? city;
  final String? state;
  final String? medicalSchool;
  final String? graduationYear;
  final String? primarySpecialization;
  final List<String> otherSpecialties;
  final List<String> boardCertificates;
  final String? hospitalName;
  final String? hospitalAddress;
  final String? hospitalContactNumber;
  final String? hospitalEmailAddress;
  final String? hospitalWebsite;
  final int? hospitalHoursOfOperation;
  final List<String> servicesOffered;
  final String? insuranceAccepted;
  final String? educationHistory;
  final String? research;
  final String? accomplishments;
  final List<String> additionalDocs;
  final String operationMode;
  final int hourlyWage;
  final String? serviceId;
  final String? specialtyId;
  final List<String> symptomIds;
  final DateTime createdAt;
  final DateTime? updatedAt;

  DoctorProfile({
    required this.id,
    required this.userId,
    required this.status,
    required this.trackingNumber,
    required this.firstName,
    required this.lastName,
    this.middleName,
    this.dob,
    this.gender,
    this.page,
    this.availability,
    this.profilePicture,
    this.bio,
    this.medicalLicense,
    this.medicalLicenseExpiry,
    this.yearsOfExperience,
    this.email,
    this.phone,
    this.country,
    this.city,
    this.state,
    this.medicalSchool,
    this.graduationYear,
    this.primarySpecialization,
    required this.otherSpecialties,
    required this.boardCertificates,
    this.hospitalName,
    this.hospitalAddress,
    this.hospitalContactNumber,
    this.hospitalEmailAddress,
    this.hospitalWebsite,
    this.hospitalHoursOfOperation,
    required this.servicesOffered,
    this.insuranceAccepted,
    this.educationHistory,
    this.research,
    this.accomplishments,
    required this.additionalDocs,
    required this.operationMode,
    required this.hourlyWage,
    this.serviceId,
    this.specialtyId,
    required this.symptomIds,
    required this.createdAt,
    this.updatedAt,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) {
    return DoctorProfile(
      id: json['_id'] ?? json['id'],
      userId: json['userId'],
      status: DoctorStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => DoctorStatus.PENDING,
      ),
      trackingNumber: json['trackingNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      gender: json['gender'],
      page: json['page'],
      availability: json['availability'] != null
          ? Availability.fromJson(json['availability'])
          : null,
      profilePicture: json['profilePicture'],
      bio: json['bio'],
      medicalLicense: json['medicalLicense'],
      medicalLicenseExpiry: json['medicalLicenseExpiry'] != null
          ? DateTime.parse(json['medicalLicenseExpiry'])
          : null,
      yearsOfExperience: json['yearsOfExperience'],
      email: json['email'],
      phone: json['phone'],
      country: json['country'],
      city: json['city'],
      state: json['state'],
      medicalSchool: json['medicalSchool'],
      graduationYear: json['graduationYear'],
      primarySpecialization: json['primarySpecialization'],
      otherSpecialties: List<String>.from(json['otherSpecialties'] ?? []),
      boardCertificates: List<String>.from(json['boardCertificates'] ?? []),
      hospitalName: json['hospitalName'],
      hospitalAddress: json['hospitalAddress'],
      hospitalContactNumber: json['hospitalContactNumber'],
      hospitalEmailAddress: json['hospitalEmailAddress'],
      hospitalWebsite: json['hospitalWebsite'],
      hospitalHoursOfOperation: json['hospitalHoursOfOperation'],
      servicesOffered: List<String>.from(json['servicesOffered'] ?? []),
      insuranceAccepted: json['insuranceAccepted'],
      educationHistory: json['educationHistory'],
      research: json['research'],
      accomplishments: json['accomplishments'],
      additionalDocs: List<String>.from(json['additionalDocs'] ?? []),
      operationMode: json['operationMode'] ?? 'Telehealth visit',
      hourlyWage: json['hourlyWage'] ?? 100,
      serviceId: json['serviceId'],
      specialtyId: json['specialtyId'],
      symptomIds: List<String>.from(json['symptomIds'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString().split('.').last,
      'trackingNumber': trackingNumber,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'dob': dob?.toIso8601String(),
      'gender': gender,
      'page': page,
      'availability': availability?.toJson(),
      'profilePicture': profilePicture,
      'bio': bio,
      'medicalLicense': medicalLicense,
      'medicalLicenseExpiry': medicalLicenseExpiry?.toIso8601String(),
      'yearsOfExperience': yearsOfExperience,
      'email': email,
      'phone': phone,
      'country': country,
      'city': city,
      'state': state,
      'medicalSchool': medicalSchool,
      'graduationYear': graduationYear,
      'primarySpecialization': primarySpecialization,
      'otherSpecialties': otherSpecialties,
      'boardCertificates': boardCertificates,
      'hospitalName': hospitalName,
      'hospitalAddress': hospitalAddress,
      'hospitalContactNumber': hospitalContactNumber,
      'hospitalEmailAddress': hospitalEmailAddress,
      'hospitalWebsite': hospitalWebsite,
      'hospitalHoursOfOperation': hospitalHoursOfOperation,
      'servicesOffered': servicesOffered,
      'insuranceAccepted': insuranceAccepted,
      'educationHistory': educationHistory,
      'research': research,
      'accomplishments': accomplishments,
      'additionalDocs': additionalDocs,
      'operationMode': operationMode,
      'hourlyWage': hourlyWage,
      'serviceId': serviceId,
      'specialtyId': specialtyId,
      'symptomIds': symptomIds,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
