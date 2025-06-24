class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: "${data['name']['firstname']} ${data['name']['lastname']}",
      email: data['email'],
      phone: data['phone'],
    );
  }
}
