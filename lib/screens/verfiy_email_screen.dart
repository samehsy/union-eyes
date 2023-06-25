////////////////////////////////////////////
///follor For more ig: @Countrol4offical
///@countrolfour@gmail.com
////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Verificatoin extends StatefulWidget {
  const Verificatoin({Key? key}) : super(key: key);

  @override
  _VerificatoinState createState() => _VerificatoinState();
}

class _VerificatoinState extends State<Verificatoin> {
  bool _onEditing = true;
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  @override
  void initState() {
    super.initState();
  }

  late Timer _timer;
  int _start = 60;

  void startTimer() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_start == 0) {
            _start = 60;
            _isResendAgain = false;
            timer.cancel();
          } else {
            _start--;
          }
        });
      },
    );
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _isLoading = false;
          _isVerified = true;
          _timer.cancel();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              behavior: SnackBarBehavior.floating,
              content: const Text("تم تأكيد الحساب"),
              duration: const Duration(seconds: 2),
            ),
          );

          context.go('/login');
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 100,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          actions: [
            IconButton(
              color: Colors.black45,
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black26),
                  child: SvgPicture.asset('assets/icons/email_verify.svg'),
                ),
                SizedBox(height: 80),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "  لقد تم إرسال رمز تحقق الى بريدك ",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16, height: 1.5, color: Colors.grey),
                ),
                Text(
                  "user@email.com ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: VerificationCode(
                    textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    underlineColor: Colors.amber,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    fullBorder: true,
                    fillColor: Colors.black26,
                    length: 6,
                    onCompleted: (String value) {
                      setState(() {
                        _code = value;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لم تتلق رمز التحقق؟",
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.grey.shade500),
                    ),
                    TextButton(
                        onPressed: () {
                          if (_isResendAgain) return;
                          startTimer();
                        },
                        child: Text(
                          _isResendAgain
                              ? 'حاول ثانية' + _start.toString()
                              : "أعد الإرسال",
                          style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.blueAccent),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _code.length < 6
                        ? null
                        : () {
                            verify();
                          },
                    child: _isLoading
                        ? Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          )
                        : _isVerified
                            ? Icon(
                                Icons.check_circle,
                                size: 30,
                              )
                            : Text(
                                'تأكيد',
                              )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
