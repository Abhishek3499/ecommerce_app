class UserModel {
  final String name;
  final String profileImage;

  /// Default placeholder asset when user has no uploaded image.
  static const String defaultProfileImage = 'assets/profile/default.png';

  UserModel({
    required this.name,
    required this.profileImage,
  });
}
