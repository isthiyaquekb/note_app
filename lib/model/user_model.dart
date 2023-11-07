class UserModel {
  final String? userId;
  final String firstname;
  final String lastname;
  final String email;

  UserModel({
    this.userId,
    required this.firstname,
    required this.lastname,
    required this.email
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      userId : json['userId'],
      firstname :json['firstname'],
      lastname :json['lastname'],
      email : json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
  };

}