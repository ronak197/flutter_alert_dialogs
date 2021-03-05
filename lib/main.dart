import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert_dialogs/custom_alert_dialog.dart';

void main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String value = "Last callback values will be shown here";

  changeValue(String newValue){
    setState(() {
      value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialogs"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              color: Colors.green.withOpacity(0.3),
              child: Text(value)
            ),
            SizedBox(
              height: 15.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show Warning alert"),
              onPressed: (){
                CustomAlertDialog().showWarningDialog(context, () => changeValue("Warning Alert: Yes Tapped"), () => changeValue("Warning Alert: No Tapped"));
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show Instruction alert"),
              onPressed: (){
                CustomAlertDialog().showInstructionAlert(context, () => changeValue("Instruction Alert: Okay Tapped"));
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show Successful action alert"),
              onPressed: (){
                CustomAlertDialog().showSuccessfulActionAlert(context, () => changeValue("Successful Alert: Okay Tapped"));
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show Save Data Alert"),
              onPressed: (){
                CustomAlertDialog().showSaveDataAlert(
                    context,
                    [
                          () => changeValue("Save Data Alert: Email score tapped"),
                          () => changeValue("Save Data Alert: Quit tapped"),
                          () => changeValue("Save Data Alert: Go back tapped")
                    ]
                );
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show numeric data alert"),
              onPressed: (){
                CustomAlertDialog().showNumericDataAlert(context, (value) => changeValue("Numeric data alert: Validate Tapped, got value $value"));
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show String alert name"),
              onPressed: (){
                CustomAlertDialog().showStringAlert(context, (value) => changeValue("String alert: submit Tapped, got value $value"), (value) => changeValue("String alert: cancel Tapped"));
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Show String alert email"),
              onPressed: (){
                CustomAlertDialog().showStringEmailAlert(context, (name, email) => changeValue("String email alert: submit Tapped, got values $name $email"), (value) => changeValue("String alert email: cancel Tapped"));
              },
            )
          ],
        ),
      ),
    );
  }
}

