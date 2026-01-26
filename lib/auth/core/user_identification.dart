enum UserType { patient, doctor, admin }

class UserIdentification {
  static UserType? _currentUserType;

  /// Set the current user type from backend response
  static void setUserType(String userTypeFromBackend) {
    switch (userTypeFromBackend.toLowerCase()) {
      case 'user' || 'USER':
      case 'patient' || 'PATIENT':
        _currentUserType = UserType.patient;
        break;
      case 'doctor' || 'DOCTOR':
        _currentUserType = UserType.doctor;
        break;
      case 'admin' || 'ADMIN':
        _currentUserType = UserType.admin;
        break;
      default:
        _currentUserType = UserType.patient; // Default fallback
    }
  }

  /// Get the current user type
  static UserType get currentUserType {
    return _currentUserType ??
        UserType.patient; // Default to patient if not set
  }

  /// Check if current user is a patient
  static bool get isPatient => currentUserType == UserType.patient;

  /// Check if current user is a doctor
  static bool get isDoctor => currentUserType == UserType.doctor;

  /// Check if current user is an admin
  static bool get isAdmin => currentUserType == UserType.admin;

  /// Clear user type (for logout)
  static void clearUserType() {
    _currentUserType = null;
  }

  /// Get the home route based on user type
  static String getHomeRoute() {
    switch (currentUserType) {
      case UserType.patient:
        return '/home';
      case UserType.doctor:
        return '/doctor-home';
      case UserType.admin:
        return '/admin-home';
    }
  }
}
