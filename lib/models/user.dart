import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? npm;
  final String? name;
  final String? email;
  final String? phone;

  const User(
    this.id,
    this.npm,
    this.name,
    this.email,
    this.phone,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['npm'] = npm;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;

    return data;
  }

  static User fromMap(Map<String, dynamic> data) {
    return User(
      data['id'] as String?,
      data['npm'] as String?,
      data['name'] as String?,
      data['email'] as String?,
      data['phone'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, npm, name, email, phone];
}
