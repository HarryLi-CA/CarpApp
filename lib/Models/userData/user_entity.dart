import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.handle,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  final String handle;
  final String name;
  final String email;
  final String imageUrl;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        handle: json['id'] ?? "",
        name: json['firstName'] ?? "",
        email: json['email'] ?? "",
        imageUrl: json['imageUrl'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': handle,
        'firstName': name,
        'email': email,
        'imageUrl': imageUrl,
      };
  factory UserEntity.empty() => const UserEntity(
        handle: "",
        name: "",
        email: "",
        imageUrl: "",
      );
  @override
  List<Object?> get props => [handle, name, email, imageUrl];
}