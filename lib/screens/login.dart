import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secondapp/screens/introduction_screen.dart';
import 'package:secondapp/widget/home_page.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;
  final Box _boxLogin = Hive.box("login");
  final Box _boxAccounts = Hive.box("accounts");

  @override
  Widget build(BuildContext context) {
    if (_boxLogin.get("loginStatus") ?? false) {
      return HomePage();
    }

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                  color: Colors.black,
                  style: ButtonStyle(iconSize: MaterialStatePropertyAll(30))),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            body: Column(children: [
              Image.asset(
                'assets/images/logo-black.png',
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
                        controller: _controllerUsername,
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
                            return "يرجى إدخال اسم المستخدم";
                          } else if (!_boxAccounts.containsKey(value)) {
                            return "اسم المستخدم مطلوب";
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
                          } else if (value !=
                              _boxAccounts.get(_controllerUsername.text)) {
                            return "كلمة المرور خاطئة";
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
                              if (_formKey.currentState?.validate() ?? false) {
                                _boxLogin.put("loginStatus", true);
                                _boxLogin.put(
                                    "userName", _controllerUsername.text);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage();
                                    },
                                  ),
                                );
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
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
