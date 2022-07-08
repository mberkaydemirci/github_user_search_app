import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_search_app/core/locator/get_it.dart';
import 'package:github_user_search_app/core/viewmodel/usersearchviewmodel.dart';
import 'package:github_user_search_app/routes.dart';
import 'package:provider/provider.dart';

void main() {
  setuplocater();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserSearchViewModel>(
              create: (context) => UserSearchViewModel()),
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        // builder: (context, _) {
        return MaterialApp(
          title: 'User Search App',
          debugShowCheckedModeBanner: false,
          // themeMode: context.read<ThemeProvider>().themeMode,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          initialRoute: userSearchPage,
          onGenerateRoute: Routes.generateRoute,
          // theme: MyThemes.lightTheme,
          // darkTheme: MyThemes.darkTheme,
        );
      },
    );
  }
}