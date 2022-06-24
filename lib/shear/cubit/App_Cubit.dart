


import 'dart:math';

import 'package:bmi_calculator/shear/cubit/App_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App_Cubit extends Cubit<App_State>{
  App_Cubit():super(App_InatualState());
  static App_Cubit git(context)=>BlocProvider.of(context);

  bool isprssto_m_f=false;

  double slider_value=180.0;
  int weight=40;
  int age=20;



  void slider_value_cange(index){
    slider_value=index;
    emit(slider_value_cange_State());

  }
  void male_female_change(index){
    isprssto_m_f=index;
    emit(male_female_change_State());
  }

  void weight_change({bool isadd = false}){
    isadd?weight++:weight--;
    emit(weight_change_State());
  }
  void age_change({bool isadd = false}){
    isadd?age++:age--;
    emit(age_change_State());
  }


}