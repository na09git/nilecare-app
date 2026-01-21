enum AppointmentStatus { pending, rejected, approved }

enum PaymentStatus { PENDING, SUCCESS, FAILED }

class Appointment {
  final String id;
  final DateTime? appointmentDate;
  final String appointmentFormattedDate;
  final String doctorId;
  final String? doctorName;
  final String patientId;
  final int charge;
  final String? appointmentTime;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? phone;
  final String? email;
  final DateTime? dob;
  final String? location;
  final String? appointmentReason;
  final List<String> medicalDocuments;
  final String? occupation;
  final AppointmentStatus status;
  final String meetingLink;
  final String meetingProvider;
  final String? transactionId;
  final String? reference;
  final PaymentStatus paymentStatus;
  final String? paymentMethod;
  final int? paidAmount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Appointment({
    required this.id,
    this.appointmentDate,
    required this.appointmentFormattedDate,
    required this.doctorId,
    this.doctorName,
    required this.patientId,
    required this.charge,
    this.appointmentTime,
    this.firstName,
    this.lastName,
    this.gender,
    this.phone,
    this.email,
    this.dob,
    this.location,
    this.appointmentReason,
    required this.medicalDocuments,
    this.occupation,
    required this.status,
    required this.meetingLink,
    required this.meetingProvider,
    this.transactionId,
    this.reference,
    required this.paymentStatus,
    this.paymentMethod,
    this.paidAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'] ?? json['id'],
      appointmentDate: json['appointmentDate'] != null
          ? DateTime.parse(json['appointmentDate'])
          : null,
      appointmentFormattedDate: json['appointmentFormattedDate'],
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      patientId: json['patientId'],
      charge: json['charge'] ?? 0,
      appointmentTime: json['appointmentTime'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      phone: json['phone'],
      email: json['email'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      location: json['location'],
      appointmentReason: json['appointmentReason'],
      medicalDocuments: List<String>.from(json['medicalDocuments'] ?? []),
      occupation: json['occupation'],
      status: AppointmentStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => AppointmentStatus.approved,
      ),
      meetingLink: json['meetingLink'] ?? '',
      meetingProvider: json['meetingProvider'] ?? 'Direct-Meeting',
      transactionId: json['transactionId'],
      reference: json['reference'],
      paymentStatus: PaymentStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['paymentStatus'],
        orElse: () => PaymentStatus.SUCCESS,
      ),
      paymentMethod: json['paymentMethod'],
      paidAmount: json['paidAmount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appointmentDate': appointmentDate?.toIso8601String(),
      'appointmentFormattedDate': appointmentFormattedDate,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'patientId': patientId,
      'charge': charge,
      'appointmentTime': appointmentTime,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'phone': phone,
      'email': email,
      'dob': dob?.toIso8601String(),
      'location': location,
      'appointmentReason': appointmentReason,
      'medicalDocuments': medicalDocuments,
      'occupation': occupation,
      'status': status.toString().split('.').last,
      'meetingLink': meetingLink,
      'meetingProvider': meetingProvider,
      'transactionId': transactionId,
      'reference': reference,
      'paymentStatus': paymentStatus.toString().split('.').last,
      'paymentMethod': paymentMethod,
      'paidAmount': paidAmount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
