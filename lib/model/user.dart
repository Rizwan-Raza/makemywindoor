class User {
  String name;
  String email;
  String phone;
  String? company;

  factory User.empty() => User(name: "", email: "", phone: "", company: null);

  User(
      {required this.name,
      required this.email,
      required this.phone,
      this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      company: json['company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'company': company,
    };
  }

  @override
  String toString() {
    return 'User{name: $name, email: $email, phone: $phone, company: $company}';
  }
}
