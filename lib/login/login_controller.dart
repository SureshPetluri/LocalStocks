import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> scaleAnimation;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  bool showLoading = false;

  @override
  void onInit() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    scaleAnimation =
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);

    _controller?.addListener(() {
      update();
    });

    _controller?.forward();
    super.onInit();
  }

  phoneNumberVerification(String text) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: text,
      verificationCompleted: (phoneAuthCredential) async {
        // setState(() {
        //   showLoading = false;
        // });
        print("phoneAuthCredential $phoneAuthCredential");
        //signInWithPhoneAuthCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {
        print("verificationFailed $verificationFailed");
        // setState(() {
        //   showLoading = false;
        // });
        // _scaffoldKey.currentState!.showSnackBar(
        //     SnackBar(content: Text(verificationFailed.message??"")));
      },
      codeSent: (verificationId, resendingToken) async {
        // setState(() {
        //   showLoading = false;
        print("to verify code sent $verificationId $resendingToken");
        // currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
        this.verificationId = verificationId;
        // });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  void signInWithPhoneAuthCredential(String code) async {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: code);
    // setState(() {
    showLoading = true;
    // });
    update();
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      // setState(() {
      showLoading = false;
      // });
      update();
      if (authCredential.user != null) {
        Get.back();
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> FirebasePhHomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      // setState(() {
      showLoading = false;
      // });
      update();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message??"")));
    }
  }
}
