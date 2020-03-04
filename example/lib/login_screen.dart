import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sk_numberpad/sk_numberpad.dart';
import 'package:sk_numberpad_example/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String text = '1';
  final mobileNoController = TextEditingController();
  final FocusNode _mobileNoFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
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
                          Text('Mobile Verification',
                              style: new TextStyle(
                                  fontFamily: 'HKGrotesk',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                  color: ColorsUtils.black)),
                          SizedBox(height: 20),
                          Text('We will send you an OTP on this mobile number',
                              style: new TextStyle(
                                  fontFamily: 'HKGrotesk',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: ColorsUtils.grey)),
                          SizedBox(height: 40),
                          Text('Enter Mobile Number',
                              style: new TextStyle(
                                  fontFamily: 'HKGrotesk',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: ColorsUtils.grey)),
                          _ShowMobileNoTextField()
                        ],
                      ))),
              SkNumberpad(
                bgColor: Color(0xffFD7A54),
                textColor: Colors.white,
                selectedNo: (value) {
                  print(value);
                  setState(() {
                    mobileNoController.text = value;
                  });
                },
                doneSelected: (value) {
                  print('Done Selected');
                  Navigator.pushNamed(
                    context,
                    '/OTPScreen',
                  ).then((value) {
                    mobileNoController.text = '';
                  });
                },
              )
            ],
          )),
    );
  }

  Widget _ShowMobileNoTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: new TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        cursorColor: Theme.of(context).primaryColor,
        controller: mobileNoController,
        maxLines: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        focusNode: _mobileNoFocus,
        textInputAction: TextInputAction.done,
        onSubmitted: (term) {
          _mobileNoFocus.unfocus();
        },
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: ColorsUtils.black),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff8C8C8C)),
            ),
            labelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: ColorsUtils.grey),
            hintStyle: TextStyle(
              color: ColorsUtils.grey,
            ),
            border: new UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
