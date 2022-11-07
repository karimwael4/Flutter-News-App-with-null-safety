import 'package:flutter/material.dart';

import '../../cubit/cubit.dart';
import '../../network/local/cache_helper.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);


  @override

  SwitchWidgetClass createState() => SwitchWidgetClass();
}


class SwitchWidgetClass extends State {
  bool switchControl =  CacheHelper.getData(key: 'isDarkMode');
  void toggleSwitch(bool value) {
AppCubit.get(context).isDarkMode=!switchControl;
    if(switchControl == false )
    {
      setState(() {
        switchControl = true;

      });

      AppCubit.get(context).changeAppMode();

    }
    else
    {
      setState(() {
        switchControl = false;

      });

      AppCubit.get(context).changeAppMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 1,
            child: Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor:Colors.deepPurple[200],
              activeTrackColor: Colors.deepPurple[400],
              inactiveThumbColor: Colors.grey[300],
              inactiveTrackColor: Colors.grey,
            )
        ),



        ]);
  }
}