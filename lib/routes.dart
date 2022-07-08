import 'package:flutter/material.dart';
import 'package:github_user_search_app/view/searchuser/searchuserpage.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userSearchPage:
        return MaterialPageRoute(builder: (_) => UserSearchPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
// iki de basketpagegift tanımlanmıştı
const String userSearchPage = '/userSearchPage';

