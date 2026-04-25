class Model {
  final String id;
  final String name;
  final String avatar;
  final String details;
  final String phone;
  final String role;

  Model({
    required this.id,
    required this.name,
    required this.avatar,
    required this.details,
    required this.phone,
    required this.role,
  });

  factory Model.fromJson(Map<String, dynamic> data) {
    return Model(
      id: data["id"]?.toString() ?? '',
      name: data["name"]?.toString() ?? '',
      avatar: data["avatar"]?.toString() ?? '',
      details: data["details"]?.toString() ?? '',
      phone: data["phone"]?.toString() ?? '',
      role: data["role"]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['avatar'] = avatar;
    data['details'] = details;
    data['phone'] = phone;
    data['role'] = role;
    data['id'] = id;

    return data;
  }
}