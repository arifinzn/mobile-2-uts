import 'package:equatable/equatable.dart';
import 'package:kel7/models/user.dart';

class Post extends Equatable {
  final String? id;
  final User? user;
  final String? image;
  final DateTime? time;
  final String? location;
  final int? likes;

  const Post(
    this.id,
    this.user,
    this.image,
    this.time,
    this.location,
    this.likes,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = user!.id;
    data['image'] = image;
    data['time'] = time;
    data['location'] = location;
    data['likes'] = likes;

    return data;
  }

  static Post fromMap(Map<String, dynamic> data) {
    return Post(
      data['id'] as String?,
      data['user'] as User?,
      data['image'] as String?,
      data['time'] as DateTime?,
      data['location'] as String?,
      data['likes'] as int?,
    );
  }

  @override
  List<Object?> get props => [id, user, image, time, location, likes];
}
