// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search/news_search_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/statue.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context ,state) {},
      builder: (context , state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text( "News App",),
              actions: [
            IconButton(
              icon: const Icon(Icons.search),
            onPressed: (){
                navigateTo(context, SearchScreen(),);


            },
        ),
                IconButton(
                  icon: const Icon(Icons.brightness_2_outlined),
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                ),
        ],

          ),

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:  BottomNavigationBar(items: cubit.bottomItems,
          currentIndex: cubit.currentIndex,
          onTap: (index)
          {
           cubit.changeBottomNavBar(index);
          },
          ),



        );
      },

    );
  }
}
