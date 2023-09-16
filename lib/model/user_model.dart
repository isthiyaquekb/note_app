class UserModel {
  final String? id;
  final String firstname;
  final String lastname;
  final String email;

  UserModel({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.email
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id : json['uid'],
      firstname :json['firstname'],
      lastname :json['lastname'],
      email : json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
  };

}