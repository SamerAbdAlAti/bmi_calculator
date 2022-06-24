import 'dart:math';

import 'package:bmi_calculator/shear/cubit/App_Cubit.dart';
import 'package:bmi_calculator/shear/cubit/App_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMI_result_screen extends StatelessWidget {
  const BMI_result_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit,App_State>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit=App_Cubit.git(context);

        var result=cubit.weight/pow(cubit.slider_value/100,2);
        return Scaffold(

          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAlias,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: MaterialButton(onPressed: (){
              Navigator.pop(context);
            },

              child: const Center(
                child: Text("BACK",style: TextStyle(color: Colors.white,
                    fontSize: 25),),
              ),
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:  const Color(0xff312f57),
                borderRadius: BorderRadius.circular(40.0),
              ),

              child: Column(
                children: [
                  Expanded(child: Container(child: Center(child: Text("Gender : ${cubit.isprssto_m_f?"Male":"Female"}\nResult : ${result.round()}\n AGE : ${cubit.age} ",textAlign:TextAlign.center,style: const TextStyle(color: Colors.white,
                    fontSize: 30,),)))),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
