import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/number_translator/data/models/general_users_response.dart';
import 'package:ia_final_project_front/number_translator/data/models/user_score_model.dart';

import '../../../../config/config_data/configuration_data.dart';
import '../../../../config/connection/connection_helper.dart';
import '../../../../config/service_locator/service_locator.dart';

abstract class ScoreDatasource {
  Future<bool> save(UserScoreModel userModel);

  Future<List<UserScoreModel>> getAll();
}

class ScoreDatasourceImpl extends ScoreDatasource {

  final ConnectionHelper connectionHelper;

  ScoreDatasourceImpl({required this.connectionHelper});

  @override
  Future<List<UserScoreModel>> getAll() async{
    var response = <String, dynamic>{};
    try {
      if (serviceLocator.get<ConfigurationData>().DEBUGGING) {
        response = {
          "version": "0",
          "response": {
            "status": "200",
            "message": "",
            "data": [
              {
                "username": "pepe",
                "score": "123123"
              }
            ]
          }
        };
        return GeneralUsersResponse<UserScoreResponse>.fromJson(response).response.data.map((e) => UserScoreModel(
          username: e.username,
          score: e.score,
        )).toList();
      }
      debugPrint('baseUrl: ${connectionHelper.dio.options.baseUrl}');
      response = (await connectionHelper.dio.get(
        '/user/score/getAll',
      ))
          .data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return [];
    }

    return GeneralUsersResponse<UserScoreResponse>.fromJson(response).response.data.map((e) => UserScoreModel(
      username: e.username,
      score: e.score,
    )).toList();
  }

  @override
  Future<bool> save(UserScoreModel userModel) async{
    var response = <String, dynamic>{};
    try {
      if (serviceLocator.get<ConfigurationData>().DEBUGGING) {
        response = {
          "version": "0",
          "response": {
            "status": "200",
            "message": "",
            "data": [
              {
                "username": "pepe",
                "score": "123123"
              }
            ]
          }
        };
        debugPrint('response: $response');
        return response['response']['status'] == '200';
      }
      debugPrint('baseUrl: ${connectionHelper.dio.options.baseUrl}');
      response = (await connectionHelper.dio.post(
        '/user/score/store',
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