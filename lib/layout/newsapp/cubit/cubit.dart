

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/newsapp/cubit/statue.dart';

import '../../../modules/news_app/bussniess/bussniess.dart';
import '../../../modules/news_app/science/science.dart';
import '../../../modules/news_app/sports/sports.dart';
import '../../../shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business,),
        label: "Business"
    ),

    const BottomNavigationBarItem(icon: Icon(Icons.sports,),
        label: "Sports"
    ),

    const BottomNavigationBarItem(icon: Icon(Icons.science,),
        label: "Science"
    ),
    // BottomNavigationBarItem(icon: Icon(Icons.settings,),
    //     label: "settings"
    // ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    //SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    if (index ==1) {
      getSports();
    }
    if (index ==2) {
      getScience();
    }
      emit(NewBottomNavState());


  }

  List<dynamic> business = [];
 // List<bool> businessSelectedItem = [];
  int businessSelectedItem = 0;
  bool isDesktop = false;

  void setDesktop(bool value)
  {
    isDesktop =value;
  }




  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
        url:'v2/top-headlines',
        query: {'country':'eg',
          'category':'business',
          'apiKey':'9a7d2668745b4468aba9156f9b072fcc',
        }


      ).then((value) {

      business = value.data['articles'];
      // business.forEach((element) {
      //   businessSelectedItem.add(false);
      // });
      emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(NewsGetBusinessErrorState(error.toString()));
      });

    }

  void selectBussnessItem(index)
  {
    businessSelectedItem = index;
    emit(NewsSelectBusinessItemState());
}




  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());



        DioHelper.getData(
            url:'v2/top-headlines',
            query: {'country': 'eg',
              'category': 'sports',
              'apiKey':'9a7d2668745b4468aba9156f9b072fcc',
            }


        ).then((value) {

          sports = value.data['articles'];


          emit(NewsGeSportsSuccessState());
        }).catchError((error) {
          if (kDebugMode) {
            print(error.toString());
          }
          emit(NewsGetSportsErrorState(error.toString()));
        });

  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetSearchLoadingState());

        DioHelper.getData(
            url:'v2/top-headlines',
            query: {'country': 'eg',
              'category': 'science',
              'apiKey':'9a7d2668745b4468aba9156f9b072fcc',
            }


        ).then((value) {

          science = value.data['articles'];


          emit(NewsGetScienceSuccessState());
        }).catchError((error) {
          if (kDebugMode) {
            print(error.toString());
          }
          emit(NewsGetScienceErrorState(error.toString()));
        });


  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
        url:'v2/everything',
        query: {

          'q':value,
          'apiKey':'9a7d2668745b4468aba9156f9b072fcc',
        }
        ).then((value) {

      search = value.data['articles'];


      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetSearchErrorState(error.toString()));
    });


  }
}

