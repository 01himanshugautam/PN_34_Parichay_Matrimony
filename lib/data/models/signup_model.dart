class SignUp {
  String? name;
  String? email;
  String? password;
  String? profileFor;
  String? phone;
  String? gender;
  String? birthDate;
  String? birthMonth;
  String? birthYear;

  SignUp({
    this.name,
    this.email,
    this.password,
    this.profileFor,
    this.phone,
    this.gender,
    this.birthDate,
    this.birthMonth,
    this.birthYear,
  });

  // SignUp.fromJson(Map<String, dynamic> json) {
  //   code = json['code'];
  //   name = json['name'];
  //   status = json['status'];
  // }

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    // final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = name;
    data['email'] = email;
    data['password'] = email;
    data['profile_for'] = email;
    data['phone'] = email;
    data['gender'] = email;
    data['birth_date'] = birthDate;
    data['birth_month'] = birthMonth;
    data['birth_year'] = birthYear;
    return data;
  }
}
