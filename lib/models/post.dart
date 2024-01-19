import 'package:equatable/equatable.dart';
import 'package:kel7/models/user.dart';

class Post extends Equatable {
  final String? id;
  final User? user;
  final String? img;
  final String? desc;
  final String? time;
  final String? location;
  final String? likes;

  const Post(
    this.id,
    this.user,
    this.desc,
    this.img,
    this.time,
    this.location,
    this.likes,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = user!.id;
    data['desc'] = desc;
    data['img'] = img;
    data['time'] = time;
    data['location'] = location;
    data['likes'] = likes;

    return data;
  }

  static Post fromMap(Map<String, dynamic> data) {
    return Post(
      data['id'] as String?,
      User.fromMap(data['user']) as User?,
      data['desc'] as String?,
      data['img'] as String?,
      data['time'] as String?,
      data['location'] as String?,
      data['likes'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, user, desc, img, time, location, likes];
}
