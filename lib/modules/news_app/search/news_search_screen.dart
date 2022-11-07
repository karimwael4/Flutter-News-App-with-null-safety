import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/newsapp/cubit/cubit.dart';
import '../../../layout/newsapp/cubit/statue.dart';
import '../../../shared/components/components.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  get validator => null;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: defaultFormField(
                      context: context,
                      controller: searchController,
                      keyboardType: TextInputType.text,
                       onChange: (value) {
                         NewsCubit.get(context).getSearch(value);
                       },
                      type: TextInputType.text,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Search must not be Empty !!';
                        }
                        return null;
                      },
                      style: (const TextStyle( fontSize:20,color: Colors.red )),
                      prefix: Icons.search,
                      labelText: "Search",
                      labelStyle: (const TextStyle(fontSize:18, color: Colors.red)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide( width: 2.0),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                    ),
                  ),
                  defaultButton(
                    labelText: ('Search'),

                    function: () {
                      if (formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print(searchController.text);
                        }
                      }
                    },
                    width: 200,
                  ),
                  Expanded(
                      child: articleBuilder(
                    list,
                    context,
                    isSearch: true,
                  )),
                ],
              ),
            ));
      },
    );
  }
}
