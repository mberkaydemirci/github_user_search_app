import 'package:flutter/cupertino.dart';
import 'package:github_user_search_app/core/locator/get_it.dart';
import 'package:github_user_search_app/core/model/user/user_model.dart';
import 'package:github_user_search_app/core/service/usersearch/usersearchservice.dart';

class UserSearchViewModel extends ChangeNotifier{
  UserModel _userModel = UserModel();
  final UserSearchService _searchService = locator<UserSearchService>();
  TextEditingController _controller = TextEditingController();
  UserModel get userModel {
    return _userModel;
  }

  TextEditingController get controller => _controller;

  set controller(TextEditingController value) {
    _controller = value;
  }


  getUser(String name) async {
    _userModel = await _searchService.getUser(name);
    print('_usermodel ${_userModel.totalCount}');
    notifyListeners();
  }
}