class UserModel {
  final String? userId;
  final String? fullName;
  final String email;
  final String? phoneNumber;
  final String password;
  final Enum? userType;
  final String? socialMediaLink;
  final String? aboutYourself;

  UserModel({
    this.userId,
    this.fullName,
    required this.email,
    this.phoneNumber,
    required this.password,
    this.userType,
    this.socialMediaLink,
    this.aboutYourself,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      fullName: json["fullName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
      userType: json["userType"],
      socialMediaLink: json["socialMediaLink"],
      aboutYourself: json["aboutYourself"],
    );
  }
  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
        "userId": userId
      };
}
