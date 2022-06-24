import 'package:bmi_calculator/moduols/BMI_result_screen.dart';
import 'package:bmi_calculator/shear/cubit/App_Cubit.dart';
import 'package:bmi_calculator/shear/cubit/App_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home_Layout extends StatelessWidget {
  const Home_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit,App_State>(

      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {

        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
        App_Cubit cubit=App_Cubit.git(context);

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BMI_result_screen()));
              },

              child: const Center(
                child: Text("CALCULATE",style: TextStyle(color: Colors.white,
                    fontSize: 25),),
              ),
            ),
          ),

          appBar: AppBar(
            centerTitle:true,
            title: const Text("BMI CALCULATOR",style: TextStyle(fontWeight: FontWeight.w400),),
          ),

          body: Padding(
            padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Home_componants.M_F(svgimageName: "male.svg",
                        con_color: cubit.isprssto_m_f?Colors.red:const Color(0xff312f57),
                        onTap: (){
                        cubit.male_female_change(true);
                        },
                      ),
                      const SizedBox(width: 20,),
                      Home_componants.M_F(svgimageName: "female.svg",
                        Box_text: "FEMALE",
                        con_color: !cubit.isprssto_m_f?Colors.red:const Color(0xff312f57),
                        onTap: (){
                        cubit.male_female_change(false);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                    child: Container(
                      width:double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff312f57),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Text("HEIGHT\n${cubit.slider_value.round()} CM",textAlign: TextAlign.center
                            ,style: const TextStyle(color: Colors.white,
                                fontSize: 30,fontWeight: FontWeight.w700),),
                          Slider(value: cubit.slider_value,
                            onChanged: (value){
                            cubit.slider_value_cange(value);
                            },
                            max: 220.0,
                            min: 120.0,
                            activeColor: Colors.red,
                            inactiveColor: Colors.white.withOpacity(0.7),
                          )

                        ],
                      ),
                    )
                ),
                const SizedBox(height: 20,),
                Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff312f57),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),

                                Text("AGE\n${cubit.age}",textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(onPressed: (){
                                      cubit.age_change();
                                      },
                                        heroTag: "btn1",
                                        child: const Text("-",style: TextStyle(fontSize: 50),)),
                                    const SizedBox(width: 12,),

                                    FloatingActionButton(onPressed: (){cubit.age_change(isadd: true);},
                                      heroTag: "btn2",
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff312f57),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                Text("WRIGHT\n${cubit.weight}",textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(onPressed: (){
                                      cubit.weight_change();
                                    },
                                        heroTag: "bnt3",
                                        child: const Text("-",style: TextStyle(fontSize: 50),)),
                                    const SizedBox(width: 12,),
                                    FloatingActionButton(onPressed: (){cubit.weight_change(isadd: true);},
                                      heroTag: "bnt4",
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),

                const SizedBox(height: 20,),

              ],
            ),
          ),


        );
      },

    );
  }
}


class Home_componants{


static  Widget M_F({Color iconColor=Colors.white,
String svgimageName="",
  GestureTapCallback ?onTap,
  int ?bottonindex,
  bool istap=false,
  Color ?con_color=const Color(0xff312f57),
  String Box_text="MALE",
})=>Expanded(

  child: GestureDetector(
    onTap:onTap,
    child: Container(
      decoration: BoxDecoration(
        color:con_color,
        borderRadius: BorderRadius.circular(40.0),
      ),

      child: Column(
        children: [
          const SizedBox(height: 20,),
          SvgPicture.asset("assets/images/$svgimageName",
            height: 100,
            width: 100,
            color: iconColor,),
          const SizedBox(height: 15,),
          Flexible(
            child: Text(Box_text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700
            ),

            ),
          ),
        ],

      ),

    ),

  ),

);


}