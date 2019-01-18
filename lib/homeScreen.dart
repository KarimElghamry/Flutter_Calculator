import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';

//global variables
String equationText = "";
double result;

//begining of homescreen class
class HomeScreen extends StatefulWidget{

  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  // end of charactercell function 



  Widget build(BuildContext context){
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body:Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: screenHeight/3,
                  width: screenWidth,
                  alignment: Alignment(1.0, 0),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                  ),
                  child: AutoSizeText(equationText,maxLines: 1,style:TextStyle(fontSize: 70.0,fontWeight: FontWeight.w500,color: Colors.white,)),
                  ),

                Container(
                  color: Colors.transparent,
                  height: (screenHeight/3)-10.0,
                  padding: EdgeInsets.only(right: 10.0),
                  alignment: Alignment(1.0, 1.0),
                  child: FloatingActionButton(
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.delete,color: Colors.red[300]),
                        onPressed: () => setState(
                            (){
                              equationText = "";
                            }
                          ),
                  ),
                ),
              ],
            ),

            Divider(
              color: Colors.transparent,
              height: 20.0,
            ),

            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      makeCell(context,"7",Colors.red[300]),
                      makeCell(context,"8",Colors.red[300]),
                      makeCell(context,"9",Colors.red[300]),
                      makeCell(context,"/",Colors.red[300])
                    ],                 
                  ),
                  Row(
                    children: <Widget>[
                      makeCell(context,"4",Colors.red[300]),
                      makeCell(context,"5",Colors.red[300]),
                      makeCell(context,"6",Colors.red[300]),
                      makeCell(context,"*",Colors.red[300])
                    ],                 
                  ),
                  Row(
                    children: <Widget>[
                      makeCell(context,"1",Colors.red[300]),
                      makeCell(context,"2",Colors.red[300]),
                      makeCell(context,"3",Colors.red[300]),
                      makeCell(context,"-",Colors.red[300])
                    ],                 
                  ),
                  Row(
                    children: <Widget>[
                      makeCell(context,"0",Colors.red[300]),
                      makeCell(context,".",Colors.red[300]),
                      makeCell(context,"=",Colors.red[300]),
                      makeCell(context,"+",Colors.red[300])
                    ],                 
                  ),                                                  
                ],
              ),
            )
          ],
        ),
    );
  }

  //beginning of charactercell function
  Widget makeCell(BuildContext context,String cellCharacter,Color inputColor){
      final double screenWidth = MediaQuery.of(context).size.width;
      return InkWell(
        borderRadius: BorderRadius.circular(50.0),
        splashColor: Colors.white,
        highlightColor: Colors.white,
        onTap: () => setState(
          (){
            if(cellCharacter == "=")
            {
              Parser p = new Parser();
              Expression exp = p.parse(equationText);
              ContextModel cm = new ContextModel();
              result = exp.evaluate(EvaluationType.REAL,cm);
              equationText = result.toString();
            }
            else equationText += cellCharacter;
          }
        ),
        child: Container(
          height: screenWidth/4,
          width: screenWidth/4,
          child: Center(
            child: Text(cellCharacter,style:TextStyle(fontWeight: FontWeight.w700,fontSize: 50.0,color: inputColor)),
          ),
        ),
      );
    }
}
//end of homescreen class


