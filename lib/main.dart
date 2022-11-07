



import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';


import 'layout/newsapp/cubit/cubit.dart';
import 'layout/newsapp/newslayout.dart';

import 'shared/bloc_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';



void main() async
{// be sure all methods finished  to run the app
  SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();


   if(Platform.isWindows)
  await DesktopWindow.setMinWindowSize(Size(500,650));

  DioHelper.init();
  await CacheHelper.init();

  bool ? isDarkMode = CacheHelper.getData(key: 'isDarkMode');





  runApp(MyApp(isDarkMode));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

    bool ? isDarkMode;
    late final Widget startWidget;
    String? token;



  MyApp(this.isDarkMode, {Key? key}) : super(key: key) ;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => NewsCubit()..getBusiness()..getSports()..getScience(),
        ),
        BlocProvider( create: (BuildContext context)  => AppCubit()..changeAppMode(fromShared: isDarkMode,),

        ),


    ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context ,state){
          return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode:  AppCubit.get(context).isDarkMode ? ThemeMode.dark: ThemeMode.light,
            home:NewsLayout(),
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
                 builder: BotToastInit(),
                 navigatorObservers: [BotToastNavigatorObserver()],


              );
            },




      ),
    );
  }
}
