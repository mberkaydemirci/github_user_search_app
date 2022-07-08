import 'package:dio/dio.dart';
import 'package:github_user_search_app/core/constant/api.dart';
import 'package:github_user_search_app/core/model/user/user_model.dart';

class UserSearchService{

  getUser(String name) async {
    Dio dio = Dio();
    Response response = await dio.get(ApiCostant.apiUrl+'search/users?q='+name);
    print('${ApiCostant.apiUrl+'search/users?q='+name}');
    print(' getUser working ${response}');
    return UserModel.fromJson(response.data);
  }

}