import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String phoneNumber;
  final String? name;

  const UserModel({required this.phoneNumber, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['phoneNumber'] as String,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'name': name};
  }

  @override
  List<Object?> get props => [phoneNumber, name];

  UserModel copyWith({String? phoneNumber, String? name}) {
    return UserModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
    );
  }
}
