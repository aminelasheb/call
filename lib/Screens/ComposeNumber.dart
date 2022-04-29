import 'dart:io';
import 'dart:ui';

import 'package:call/Screens/ContactUI.dart';
import 'package:flutter/material.dart';
import 'package:call/globals.dart' as globals;
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../Providers/Infos.dart';
class ComposeNumber extends StatefulWidget {
  const ComposeNumber({Key? key}) : super(key: key);

  @override
  State<ComposeNumber> createState() => _ComposeNumberState();
}

class _ComposeNumberState extends State<ComposeNumber> {
  @override
  Widget build(BuildContext context) {
    final sizee = MediaQuery.of(context).size;
    String Number = "+213 65 88 50 774" ;
    return Scaffold(
      backgroundColor: globals.primaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: sizee.height*0.04 , horizontal: sizee.width*0.04),
        padding: EdgeInsets.symmetric(vertical: sizee.height*0.02 , horizontal: sizee.width*0.02),
        color: globals.primaryColor,
        child: Center(child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                    onTap : () {
                      exit(0) ;
                  } ,


                    child: Text('Exit' , style: TextStyle(color: globals.secondlyColor),)) ,
                Text('Messages' , style: TextStyle(color: globals.secondlyColor),)

              ],),

            ) ,
            Container(
              padding: EdgeInsets.only(

                  top: sizee.height*0.08 ,
                  bottom: sizee.height*0.008 ,

                left: sizee.width*0.02 ,
                  right: sizee.width*0.02 ,

              ),
              child: Center(child: Text(Provider.of<Infos>(context,
                  listen: false)
                    .Number , style: TextStyle(color: globals.thirdlyColor  , fontSize: sizee.width*0.08 , fontWeight: FontWeight.bold), ),),
            ),
            Provider.of<Infos>(context,
                listen: false)
                .Number==""? Container(
              height : sizee.height*0.06) :
            Container(
              height: sizee.height*0.06,
              child: TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                  color: globals.fourthColor,
                ),
                label: Text('Add to contact' , style: TextStyle(  color: globals.fourthColor,
                ),),
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sizee.width*0.06),
            margin: EdgeInsets.only(top: sizee.height*0.04),
            height: sizee.height*0.11,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 num(sizee, "1", "") ,
                 num(sizee, "2", "ABC") ,
                 num(sizee, "3", "DEF") ,
               ],
             ) ,
          ) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: sizee.width*0.06),

              height: sizee.height*0.11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  num(sizee, "4", "") ,
                  num(sizee, "5", "ABC") ,
                  num(sizee, "6", "DEF") ,
                ],
              ) ,
            ) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: sizee.width*0.06),

              height: sizee.height*0.11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  num(sizee, "7", "") ,
                  num(sizee, "8", "ABC") ,
                  num(sizee, "9", "DEF") ,
                ],
              ) ,
            ) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: sizee.width*0.06),

              height: sizee.height*0.11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  num(sizee, "*", "") ,
                  num(sizee, "0", "+") ,
                  num(sizee, "#", "") ,
                ],
              ) ,
            ) ,

            Container(
              padding: EdgeInsets.symmetric(horizontal: sizee.width*0.06),
              margin: EdgeInsets.only(top: sizee.height*0.03),
              height: sizee.height*0.11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ContactUI()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(80)),
                      ),

                      child: Container(

                        child: Icon( Icons.group_outlined , color: globals.thirdlyColor, size: sizee.height*0.05,),
                        decoration: BoxDecoration(
                          color: globals.primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: sizee.height * 0.09,
                        width: sizee.height * 0.09,
                      ),
                    ),
                  ) ,
                  InkWell(
                    onTap: () async {
                       await FlutterPhoneDirectCaller.callNumber(Provider.of<Infos>(context,
                          listen: false)
                          .Number);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: globals.fourthColor,

                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(80)),
                      ),

                      child: Container(

                        child: Icon( Icons.call , color: Colors.white, size: sizee.height*0.05,),
                        decoration: BoxDecoration(
                          color: globals.fourthColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: sizee.height * 0.09,
                        width: sizee.height * 0.09,
                      ),
                    ),
                  ) ,
                  InkWell(
                    onTap: () {
                  setState(() {
                    Provider.of<Infos>(context,
                        listen: false)
                        .DelNum() ;
                  });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(80)),
                      ),

                      child: Container(

                        child: Icon( Icons.backspace_outlined , color: globals.thirdlyColor, size: sizee.height*0.04,),
                        decoration: BoxDecoration(
                          color: globals.primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: sizee.height * 0.09,
                        width: sizee.height * 0.09,
                      ),
                    ),
                  ) ,
                ],
              ) ,
            ) ,

          //  num(sizee , "1" , "ABC"),
          ],
        ),),
      ),
    );
  }

  GestureDetector num(Size sizee , String numb , String ABC) {
    return GestureDetector(
            onTap: () {
            setState(() {
              Provider.of<Infos>(context,
                  listen: false)
                  .AddNum(numb)    ;
            });
            },
      onLongPressUp: (){
        if (numb=="0") {
          setState(() {
            Provider.of<Infos>(context,
                listen: false)
                .AddNum("+")    ;
          });
        }
      },
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(
                    Radius.circular(300)),
              ),

              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // icon
                    Text(
                      numb,
                      style: TextStyle(color: globals.thirdlyColor ,fontFamily: 'myfont-Thin',fontWeight: FontWeight.bold,
                      fontSize: sizee.width*0.06),
                    ),
                    Text(
                      ABC,
                      style: TextStyle(color: globals.secondlyColor),
                    ),
                    // text
                  ],
                ),
                decoration: BoxDecoration(
                  color: globals.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(300),
                  ),
                ),
                height: sizee.height * 0.095,
                width: sizee.height * 0.095,
              ),
            ),
          );
  }
}
