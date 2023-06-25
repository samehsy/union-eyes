import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const routeName = '/signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerFirstname = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();

  final Box _boxAccounts = Hive.box("accounts");
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
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
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 140,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Text(
                        'إنشاء حساب',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      // first name
                      const SizedBox(height: 35),
                      TextFormField(
                        controller: _controllerFirstname,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'الاسم الاول',
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال الاسم الاول";
                          }

                          return null;
                        },
                        onEditingComplete: () => _focusNodeEmail.requestFocus(),
                      ),
                      // last name
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _controllerLastname,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'الاسم الاخير',
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال الاسم الاخير";
                          }

                          return null;
                        },
                        onEditingComplete: () => _focusNodeEmail.requestFocus(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _controllerEmail,
                        focusNode: _focusNodeEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "البريد الإلكتروني",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "البريد الإلكتروني";
                          } else if (!(value.contains('@') &&
                              value.contains('.'))) {
                            return "بريد غير صالح";
                          }
                          return null;
                        },
                        onEditingComplete: () =>
                            _focusNodePassword.requestFocus(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _controllerPassword,
                        obscureText: _obscurePassword,
                        focusNode: _focusNodePassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "كلمة المرور",
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
                            return "يرجى إدخال كلمة المرور";
                          } else if (value.length < 8) {
                            return "كلمة المرور يجب ان تحوي على الأقل 8 محارف";
                          }
                          return null;
                        },
                        onEditingComplete: () =>
                            _focusNodeConfirmPassword.requestFocus(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _controllerConFirmPassword,
                        obscureText: _obscurePassword,
                        focusNode: _focusNodeConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "تأكيد كلمة المرور",
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
                            return "يرجى إدخال تأكيد كلمة المرور";
                          } else if (value != _controllerPassword.text) {
                            return "كلمتا المرور غير متطابقتين";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),
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
                                _boxAccounts.put(
                                  _controllerFirstname.text,
                                  _controllerConFirmPassword.text,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    width: 200,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    content: const Text("تم إنشاء الحساب"),
                                  ),
                                );

                                _formKey.currentState?.reset();

                                context.go('/verify');
                              }
                            },
                            child: const Text("تسجيل"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("تملك بالفعل حساب؟"),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("تسجيل الدخول"),
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
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerFirstname.dispose();
    _controllerLastname.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
