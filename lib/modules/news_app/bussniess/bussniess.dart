// ignore: unused_import
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../layout/newsapp/cubit/cubit.dart';
import '../../../layout/newsapp/cubit/statue.dart';
import '../../../shared/components/components.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,statue){},
        builder: (context,state){
          var list = NewsCubit.get(context).business;
          return ScreenTypeLayout(mobile:Builder(
            builder: (context) {
              NewsCubit.get(context).setDesktop(false);
              return articleBuilder(list,context);
            }
          ),
            desktop:Builder(
              builder: (context) {
                NewsCubit.get(context).setDesktop(true);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                    child: articleBuilder(list,context)
                      ,),
                    if(list.length>0)
                    Expanded(
                      child:Container(
                        height: double.infinity,
                        color: Colors.blue[300],
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text('${list[NewsCubit.get(context).businessSelectedItem]['description']}',style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
            breakpoints: ScreenBreakpoints(desktop: 850,
              tablet: 300, watch: 100,
            ),);
        },


      ),
    );

    }
}
