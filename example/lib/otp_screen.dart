import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sk_numberpad/sk_number_pad.dart';

import 'colors.dart';

class OTPScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OTPScreenState();
  }
}

class OTPScreenState extends State<OTPScreen> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController currController = new TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currController = controller1;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Padding(
        padding: EdgeInsets.only(left: 0.0, right: 2.0),
        child: new Container(
          color: Colors.transparent,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
            //width: 10,
            alignment: Alignment.center,
            child: new TextField(
              //obscureText: true,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              enabled: false,
              controller: controller1,
              autofocus: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            //obscureText: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            controller: controller2,
            autofocus: false,
            enabled: false,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            //obscureText: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            controller: controller3,
            textAlign: TextAlign.center,
            autofocus: false,
            enabled: false,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            //obscureText: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            controller: controller4,
            autofocus: false,
            enabled: false,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 2.0, right: 0.0),
        child: new Container(
          color: Colors.transparent,
        ),
      ),
    ];

    return Scaffold(
        key: _globalKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(fit: StackFit.expand, children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 70),
                          Image.asset('assets/message.png',
                              width: 130, height: 130),
                          SizedBox(height: 20),
                          Text('OTP Verification',
                              style: new TextStyle(
                                  fontFamily: 'HKGrotesk',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                  color: ColorsUtils.black)),
                          SizedBox(height: 20),
                          Text('Enter the OTP sent to your mobile number',
                              style: new TextStyle(
                                  fontFamily: 'HKGrotesk',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: ColorsUtils.grey)),
                          SizedBox(height: 40),
                          GridView.count(
                              crossAxisCount: 6,
                              crossAxisSpacing: 10,
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              children: List<Container>.generate(
                                  6,
                                  (int index) => Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 20),
                                        child: widgetList[index],
                                      ))),
                        ]))),
            SkNumberPad(
              bgColor: ColorsUtils.orange,
              textColor: Colors.white,
              selectedNo: (value) {
                print(value);
                setState(() {
                  inputTextToField(value);
                });
              },
              doneSelected: (value) {
                print('Done Selected');

                _globalKey.currentState.showSnackBar(SnackBar(
                  content:
                      Text("Thanks! Your Mobile Number has been verified!"),
                ));

                Future.delayed(Duration(seconds: 2), () {
                  _globalKey.currentState.removeCurrentSnackBar();
                  Navigator.of(context).pop();
                });
              },
            )
          ]),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }

  void inputTextToField(String str) {
    //Edit first textField

    var otpAry = str.split('');
    if (otpAry.length > 0) {
      controller1.text = otpAry.length > 0 ? otpAry[0] : "";
      controller2.text = otpAry.length > 1 ? otpAry[1] : "";
      controller3.text = otpAry.length > 2 ? otpAry[2] : "";
      controller4.text = otpAry.length > 3 ? otpAry[3] : "";
    } else {
      controller1.text = '';
    }
  }
}
