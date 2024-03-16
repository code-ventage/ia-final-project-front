import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/number_translator/data/models/user_model.dart';

import '../../../../config/config_data/configuration_data.dart';
import '../../../../config/connection/connection_helper.dart';
import '../../../../config/service_locator/service_locator.dart';

abstract class AuthDatasource {
  Future<bool> signUp(UserModel userModel);

  Future<bool> logIn(UserModel userModel);
}

class AuthDatasourceImpl extends AuthDatasource {

  final ConnectionHelper connectionHelper;

  AuthDatasourceImpl({required this.connectionHelper});

  @override
  Future<bool> logIn(UserModel userModel) async{
    var response = <String, dynamic>{};
    try {
      if (serviceLocator.get<ConfigurationData>().DEBUGING) {
        response = {
          "version": "0",
          "response": {
            "status": "200",
            "message": "",
            "data": [
              {
                "username": "pepe",
                "password": "123123"
              }
            ]
          }
        };
        return response['response']['status'] == '200';
      }
      response = (await connectionHelper.dio.post(
        '/user/login',
        data: userModel.toJson(),
      ))
          .data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return response['response']['status'] == '200';
  }

  @override
  Future<bool> signUp(UserModel userModel) async{
    var response = <String, dynamic>{};
    try {
      if (serviceLocator.get<ConfigurationData>().DEBUGING) {
        response = {
          "version": "0",
          "response": {
            "status": "200",
            "message": "",
            "data": [
              {
                "username": "pepe",
                "password": "123123"
              }
            ]
          }
        };
        return response['response']['status'] == '200';
      }
      response = (await connectionHelper.dio.post(
        '/user/signUp',
        data: userModel.toJson(),
      ))
          .data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return response['response']['status'] == '200';
  }
}