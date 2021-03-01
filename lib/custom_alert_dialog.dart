import 'package:flutter/material.dart';

class CustomAlertDialog{

  showWarningDialog( BuildContext context, Function onYesTap, Function onNoTap, {String title = "Warning", String content = "Are you sure you want to quit this simulation"}) {
    showDialog(
      context: context,
      builder: (context){
         return AlertDialog(
           backgroundColor: Colors.black45.withOpacity(0.5),
           title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6,),
           titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
           contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                       padding: EdgeInsets.symmetric(vertical: 12.0),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8.0)
                       ),
                       color: Colors.grey[200],
                       onPressed: (){
                         Navigator.of(context).pop();
                         onYesTap();
                       },
                       child: Text("Yes", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold  ),),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 5.0),
                   ),
                   Expanded(
                     flex: 1,
                     child: MaterialButton(
                       padding: EdgeInsets.symmetric(vertical: 12.0),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8.0)
                       ),
                       color: Colors.lightBlueAccent,
                       onPressed: (){
                         Navigator.of(context).pop();
                         onNoTap();
                       },
                       child: Text("No", style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.bold )),
                     ),
                   ),
                 ],
               )
             ],
           ),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0)
           ),
         );
      }
    );
  }

  showInstructionAlert( BuildContext context, Function onOkTap, {String title = "Start drilling operation and detect a kick warning sign"}) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.black45.withOpacity(0.5),
            title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4,),
            titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
            contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        color: Colors.grey[200],
                        onPressed: (){
                          Navigator.of(context).pop();
                          onOkTap();
                        },
                        child: Text("Ok", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold ),),
                      ),
                    ),
                  ],
                )
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
          );
        }
    );
  }

  showSuccessfulActionAlert( BuildContext context, Function onOkTap, {String title = "Congratulations!", String content = "You have successfully recorded SIDPP"}) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.black45.withOpacity(0.5),
            title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
            titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
            contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        color: Colors.grey[200],
                        onPressed: (){
                          Navigator.of(context).pop();
                          onOkTap();
                        },
                        child: Text("Ok", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold ),),
                      ),
                    ),
                  ],
                )
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
          );
        }
    );
  }

  showSaveDataAlert( BuildContext context, List<Function> clickActions, { List<String> actions = const ["Email Score", "Quit", "Go Back"], String title = "Save Your Data", String content = "Would you like to email your score report before you quit"}) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.black45.withOpacity(0.5),
            title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
            titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
            contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(content, style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center,),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(actions.length, (index){
                    return MaterialButton(
                      minWidth: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      color: Colors.grey[200],
                      onPressed: (){
                        Navigator.of(context).pop();
                        clickActions[index]();
                      },
                      child: Text(actions[index], style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold ),),
                    );
                  }),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
          );
        }
    );
  }

  showNumericDataAlert( BuildContext context, Function(int value) onValidateTap, {String title = "Enter a suitable value"}) {

    String content = "";
    TextEditingController textEditingController = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context, dialogState){
              return AlertDialog(
                backgroundColor: Colors.black45.withOpacity(0.5),
                title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
                titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    content != "" ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(content, style: Theme.of(context).textTheme.headline3,),
                    ) : SizedBox(),
                    TextFormField(
                      controller: textEditingController,
                      style: Theme.of(context).textTheme.headline2,
                      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: true),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0
                          )
                        ),
                        hintText: "Enter a value",
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
                            color: Colors.grey[200],
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
                            child: Text("Validate", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold ),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
              );
            },
          );
        }
    );
  }

  showStringAlert( BuildContext context, Function(String value) onSubmitTap, Function onCancelTap, {String title = "Enter Full Name", String hintText = "Enter Your Name"}) {

    String content = "";
    TextEditingController textEditingController = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context, dialogState){
              return AlertDialog(
                backgroundColor: Colors.black45.withOpacity(0.5),
                title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
                titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    content != "" ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(content, style: Theme.of(context).textTheme.headline3,),
                    ) : SizedBox(),
                    TextFormField(
                      controller: textEditingController,
                      style: Theme.of(context).textTheme.headline2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2.0
                              )
                          ),
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
                            color: Colors.grey[200],
                            onPressed: (){
                              Navigator.of(context).pop();
                              onCancelTap();
                            },
                            child: Text("Cancel", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black45, fontWeight: FontWeight.bold ),),
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
                                Navigator.of(context).pop();
                                onSubmitTap(textEditingController.text);
                              }
                            },
                            child: Text("Submit", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold ),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
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
        String title = "Enter Details",
        String content = "Enter your assessor email for requesting assessment",
        List<String> hintText = const ["Enter Your Name", "Enter your assessor email"]
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
                backgroundColor: Colors.black45.withOpacity(0.5),
                title: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
                titlePadding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                      style: Theme.of(context).textTheme.headline2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2.0
                              )
                          ),
                          hintText: hintText[0],
                          hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)
                      ),
                    ),
                    TextFormField(
                      controller: emailTextEditingController,
                      style: Theme.of(context).textTheme.headline2,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.0,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2.0
                              )
                          ),
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
                            color: Colors.grey[200],
                            onPressed: (){
                              Navigator.of(context).pop();
                              onCancelTap();
                            },
                            child: Text("Cancel", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black45, fontWeight: FontWeight.bold ),),
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
                                  Navigator.of(context).pop();
                                  onSubmitTap(nameTextEditingController.text,
                                      emailTextEditingController.text);
                                }
                                else {
                                  dialogState((){
                                    errorString = "Wrong Email Input";
                                  });
                                }
                              }
                            },
                            child: Text("Submit", style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold ),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
              );
            },
          );
        }
    );
  }


}