import 'package:get_it/get_it.dart';
import 'package:github_user_search_app/core/service/usersearch/usersearchservice.dart';
GetIt locator = GetIt.instance;

void setuplocater() {
  locator.registerLazySingleton(() => UserSearchService());
}