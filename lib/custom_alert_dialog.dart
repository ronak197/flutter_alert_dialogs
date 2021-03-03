import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog{

  final alertShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
          color: Colors.grey
      )
  );

  final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)
  );

  final bgColor = Colors.black45.withOpacity(0.5);

  final titlePadding = const EdgeInsets.only(top: 15.0, bottom: 10.0, left: 10.0, right: 10.0);

  final contentPadding = const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0);

  final buttonPadding = const EdgeInsets.symmetric(vertical: 8.0);

  final buttonColor = Colors.lightBlueAccent;

  showWarningDialog( BuildContext context, Function onYesTap, Function onNoTap, {String title = "Warning", String content = "Are you sure you want to quit this simulation?"}) {
    showDialog(
      context: context,
      builder: (context){
         return AlertDialog(
           backgroundColor: bgColor,
           title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6,),
           titlePadding: titlePadding,
           contentPadding: contentPadding,
           shape: alertShape,
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text(content, style: Theme.of(context).textTheme.headline3,),
               SizedBox(
                 height: 15.0,
               ),
               Row(
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Expanded(
                     flex: 1,
                     child: MaterialButton(
                       padding: buttonPadding,
                       shape: buttonShape,
                       color: buttonColor,
                       onPressed: (){
                         Navigator.of(context).pop();
                         onYesTap();
                       },
                       child: Text("YES", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,   ),),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 5.0),
                   ),
                   Expanded(
                     flex: 1,
                     child: MaterialButton(
                       padding: buttonPadding,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8.0)
                       ),
                       color: buttonColor,
                       onPressed: (){
                         Navigator.of(context).pop();
                         onNoTap();
                       },
                       child: Text("NO", style: Theme.of(context).textTheme.headline3.copyWith( )),
                     ),
                   ),
                 ],
               )
             ],
           ),
         );
      }
    );
  }

  showInstructionAlert( BuildContext context, Function onOkTap, {String title = "Start drilling operation and detect a kick warning sign."}) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: bgColor,
            title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4,),
            titlePadding: titlePadding,
            contentPadding: contentPadding,
            shape: alertShape,
            actionsPadding: EdgeInsets.only(right: 5.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                padding: buttonPadding.copyWith(top: 5.0, bottom: 5.0),
                shape: buttonShape,
                color: buttonColor,
                onPressed: (){
                  Navigator.of(context).pop();
                  onOkTap();
                },
                child: Text("OK", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
              )
            ],
          )
          );
        }
    );
  }

  showSuccessfulActionAlert( BuildContext context, Function onOkTap, {String title = "Congratulations!", String content = "You have successfully recorded SIDPP."}) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: bgColor,
            title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(),),
            titlePadding: titlePadding,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Padding(
                padding: contentPadding,
                child: Text(content, style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center,),
              ),
              MaterialButton(
                padding: buttonPadding,
                shape: buttonShape,
                color: buttonColor,
                onPressed: (){
                  Navigator.of(context).pop();
                  onOkTap();
                },
                child: Text("OK", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
              )
            ],
          ),
            shape: alertShape,
          );
        }
    );
  }

  showSaveDataAlert( BuildContext context, List<Function> clickActions, { List<String> actions = const ["Email Score", "Quit", "Go Back"], String title = "Save Your Data", String content = "Would you like to email your score report before you quit?"}) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: bgColor,
            title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(),),
            titlePadding: titlePadding,
            contentPadding: contentPadding,
            shape: alertShape,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(content, style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center,),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(actions.length, (index){
                    return Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 5.0),
                        child: MaterialButton(
                          padding: buttonPadding,
                          shape: buttonShape,
                          color: buttonColor,
                          onPressed: (){
                            Navigator.of(context).pop();
                            clickActions[index]();
                          },
                          child: Text(actions[index].toUpperCase(), style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white, fontSize: 13.0 ), textAlign: TextAlign.center, maxLines: 1,),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          );
        }
    );
  }

  showNumericDataAlert( BuildContext context, Function(int value) onValidateTap, {String title = "Enter a suitable value."}) {

    String content = "";
    TextEditingController textEditingController = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context, dialogState){
              return AlertDialog(
                backgroundColor: bgColor,
                contentPadding: contentPadding,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: titlePadding,
                        child: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(),),
                      ),
                      content != "" ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(content, style: Theme.of(context).textTheme.headline3,),
                      ) : SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: textEditingController,
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
                        keyboardType: TextInputType.numberWithOptions(decimal: false, signed: true),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                          hintText: "Enter a value",
                          hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            padding: buttonPadding.copyWith(left: 15.0, right: 15.0),
                            shape: buttonShape,
                            color: buttonColor,
                            onPressed: (){
                              if(textEditingController.text.isEmpty){
                                dialogState((){
                                  content = "Sorry! try again";
                                });
                              } else {
                                try {
                                  int value = int.parse(textEditingController.text);
                                  Navigator.of(context).pop();
                                  onValidateTap(value);
                                } catch (e){
                                  dialogState((){
                                    content = "Sorry! try again";
                                  });
                                }
                              }
                            },
                            child: Text("VALIDATE", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                shape: alertShape,
              );
            },
          );
        }
    );
  }

  showStringAlert( BuildContext context, Function(String value) onSubmitTap, Function onCancelTap, {String title = "Enter full name", String hintText = "Enter your name"}) {

    String content = "";
    TextEditingController textEditingController = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context, dialogState){
              return AlertDialog(
                backgroundColor: bgColor,
                contentPadding: contentPadding,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: titlePadding,
                        child: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(),),
                      ),
                      content != "" ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(content, style: Theme.of(context).textTheme.headline3,),
                      ) : SizedBox(),
                      TextFormField(
                        controller: textEditingController,
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintText: hintText,
                            hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              color: buttonColor,
                              onPressed: (){
                                Navigator.of(context).pop();
                                onCancelTap();
                              },
                              child: Text("Cancel".toUpperCase(), style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              color: Colors.lightBlue[300],
                              onPressed: (){
                                if(textEditingController.text.isEmpty){
                                  dialogState((){
                                    content = "Sorry! try again";
                                  });
                                } else {
                                  if(textEditingController.text.contains(RegExp("[0-9]")) || textEditingController.text.length < 3){
                                    dialogState((){
                                      content = "Sorry! try again";
                                    });
                                  } else {
                                    Navigator.of(context).pop();
                                    onSubmitTap(textEditingController.text);
                                  }
                                }
                              },
                              child: Text("Submit".toUpperCase(), style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                shape: alertShape,
              );
            },
          );
        }
    );
  }

  showStringEmailAlert( BuildContext context,
      Function(String name, String email) onSubmitTap,
      Function onCancelTap,
      {
        String title = "Enter details",
        String content = "Enter your assessor email for requesting assessment",
        List<String> hintText = const ["Enter your name", "Enter your assessor email"]
      }) {

    String errorString = "";
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context, dialogState){
              return AlertDialog(
                backgroundColor: bgColor,
                // titlePadding: titlePadding,
                contentPadding: contentPadding,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: titlePadding,
                        child: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(content, style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center,),
                      ),
                      errorString != "" ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(errorString, style: Theme.of(context).textTheme.headline3,),
                      ) : SizedBox(),
                      TextFormField(
                        controller: nameTextEditingController,
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                            hintText: hintText[0],
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0), bottom: Radius.zero),
                            ),
                            filled: true,
                            hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)
                        ),
                      ),
                      TextFormField(
                        controller: emailTextEditingController,
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0), top: Radius.zero),
                            ),
                            filled: true,
                            hintText: hintText[1],
                            hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              color: buttonColor,
                              onPressed: (){
                                Navigator.of(context).pop();
                                onCancelTap();
                              },
                              child: Text("Cancel".toUpperCase(), style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              color: Colors.lightBlue[300],
                              onPressed: (){
                                if(nameTextEditingController.text.isEmpty || emailTextEditingController.text.isEmpty){
                                  dialogState((){
                                    errorString = "Sorry! try again";
                                  });
                                } else {

                                  if(emailTextEditingController.text.contains(RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\$"))) {

                                    if(!nameTextEditingController.text.contains(RegExp("[0-9]"))  && nameTextEditingController.text.length >= 3){
                                      Navigator.of(context).pop();
                                      onSubmitTap(nameTextEditingController.text,
                                          emailTextEditingController.text);
                                    } else {
                                      dialogState((){
                                        errorString = "Sorry! try again";
                                      });
                                    }
                                  }
                                  else {
                                    dialogState((){
                                      errorString = "Wrong Email Input";
                                    });
                                  }
                                }
                              },
                              child: Text("Submit".toUpperCase(), style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,  ),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                shape: alertShape,
              );
            },
          );
        }
    );
  }


}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}