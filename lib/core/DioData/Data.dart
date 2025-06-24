import 'package:dio/dio.dart';

import '../../features/DataModels/UsersModel.dart';

class UserData {
  final Dio dio;

  UserData(this.dio);

  Future<List<UserModel>> getAllUsers() async {
    final response = await dio.get("https://fakestoreapi.com/users");
    return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
  }
}
