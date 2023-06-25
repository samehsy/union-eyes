import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secondapp/widget/home_page.dart';
import '../di/service_locator.dart';

import '../services/auth_service.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authService = getIt<AuthService>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                  color: Colors.black,
                  style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)),
                  onPressed: () {
                    context.go('/home');
                  }),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            body: Column(children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 140,
              ),
              Text(
                "مرحباً بك",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      TextFormField(
                        controller: _controllerEmail,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "اسم المستخدم",
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onEditingComplete: () =>
                            _focusNodePassword.requestFocus(),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال بريدك الإلكتروني";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _controllerPassword,
                        focusNode: _focusNodePassword,
                        obscureText: _obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'كلمة السر',
                          prefixIcon: const Icon(Icons.password_outlined),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: _obscurePassword
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى  إدخال كلمة المرور";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 60),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            child: const Text("تسجيل الدخول"),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("لا تملك حساب؟"),
                              TextButton(
                                onPressed: () {
                                  _formKey.currentState?.reset();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const Signup();
                                      },
                                    ),
                                  );
                                },
                                child: const Text("إنشاء حساب"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  login() {
    authService.login(_controllerEmail.text, _controllerPassword.text).then(
      (value) {
        print(value);

        if (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
          );
          context.go('/profile');
        }
      },
    );
  }
}
