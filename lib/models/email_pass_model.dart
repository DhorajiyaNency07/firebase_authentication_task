class UserModel {
  String? name;
  String? birthDate;
  String? email;
  String? password;
  // String? uid;

  UserModel({
    this.name,
    this.birthDate,
    this.email,
    this.password,
    // this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthDate': birthDate,
      'email': email,
      'password': password,
      // 'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      birthDate: map['birthDate'],
      email: map['email'],
      password: map['password'],
      // uid: map['uid'],
    );
  }
}
