class UserModel {
  UserModel({
    this.email,
    this.lastname,
    this.name,
    this.password,
    this.userID,
  });

  final String email;
  final String lastname;
  final String name;
  final String password;
  final String userID;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      name: json["name"] ??
          'No Name', // ??: json["name"] == null bolup kalsa, anda 'No Name' degendi ber
      lastname: json["lastname"] ??
          'No Lastname', // ?? bul egerde null bolup kalsa janindagini ber
      password: json["password"],
      userID: json["userID"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
      };
}
