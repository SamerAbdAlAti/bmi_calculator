import 'package:bmi_calculator/Layout/home_layout.dart';
import 'package:bmi_calculator/shear/cubit/App_Cubit.dart';
import 'package:bmi_calculator/shear/cubit/blocobserver.dart';
import 'package:bmi_calculator/shear/style/app_color.dart';
import 'package:bmi_calculator/shear/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {


  BlocOverrides.runZoned(
        () {
      // Use cubits...

          App_Cubit();
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color scffoldc=App_Colors.Scaffoldbacgroundcolor;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: App_Colors.Scaffoldbacgroundcolor,
        statusBarIconBrightness: scffoldc==Colors.white?Brightness.dark:Brightness.light,
      systemNavigationBarColor: scffoldc,systemNavigationBarDividerColor: scffoldc,systemStatusBarContrastEnforced:true

    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>App_Cubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: App_Style.light_theme,
        darkTheme: App_Style.Dark_theme,
        home: const Home_Layout(),

      ),
    );
  }
}

