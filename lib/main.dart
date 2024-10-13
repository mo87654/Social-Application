import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/layout/social_layout.dart';
import 'package:social_application/modules/login/login_screen.dart';
import 'package:social_application/shared/components/colors.dart';
import 'package:social_application/shared/components/constants.dart';
import 'package:social_application/shared/cubit/bloc_observer.dart';
import 'package:social_application/shared/network/local/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  uid = CacheHelper.getData(key: 'uid');
  Widget startWidget;
  if (uid != null) {
    startWidget = LayoutScreen();
  } else {
    startWidget = LoginScreen();
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  MyApp(this.startScreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getUserData()..getPosts(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(  
                appBarTheme: AppBarTheme(
                    titleTextStyle:Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    titleSpacing: 5,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    )),
                // inputDecorationTheme: InputDecorationTheme(
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: Colors.grey,
                //       width: 1.5,
                //     ), // Color when not focused
                //   ),
                //   focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //         color: defaultColor, width: 2.0), // Color when focused
                //   ),
                // ),
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: defaultColor,
                primaryColor: defaultColor,
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: defaultColor,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: defaultColor,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(size: 25),
                  selectedLabelStyle: TextStyle(fontSize: 12),
                  unselectedIconTheme: IconThemeData(size: 25),
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                )),
            home: startScreen,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
