class Usermodel {
  String? userid;
  String? name;
  String? email;
  String? password;
  String? mnumber;

  Usermodel({
    required this.name,
    required this.email,
    required this.password,
    required this.mnumber,
    required this.userid,
  });

  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'name': name,
      'email': email,
      'password': password,
      'mnumber': mnumber,
    };
  }

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      mnumber: json['mnumber'],
      userid: json['userid'],
    );
  }
}

List<Usermodel> signinlist = [];
