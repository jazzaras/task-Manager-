import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager/Core/Constants/assetsConstants.dart';
import 'package:task_manager/Core/Constants/colorsConstants.dart';
import 'package:task_manager/Core/providers/AuthErrorProvider.dart';
import 'package:task_manager/features/auth/controller/authController.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  // to determine whether so sign in or up
  bool signin = true;

  // to indecate whether or not we are doing a requset or not
  bool _isLoading = false;

  // inputs
  String? email;
  String? username;
  String? password;

  void submit() async {
    setState(() {
      _isLoading = !_isLoading;
    });

    ref.read(authErrorProvider.notifier).clear();

    // VALIDATE THE INPUTS
    if (!_formKey.currentState!.validate()) {
      print("not valid");
      setState(() {
        _isLoading = !_isLoading;
      });
      return;
    }
    // this will invoke the onSave method in evey Form Field in the Form Widget
    _formKey.currentState!.save();

    if (signin) {
      await ref.read(authControllerProvider).signIn(
            email: email!,
            password: password!,
          );
    } else {
      await ref.read(authControllerProvider).signUp(
            email: email!,
            password: password!,
            username: username!,
          );
    }

    // GET (ALL) USER INFORMATION (appointments, info, etc)
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _isLoading = !_isLoading;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(ref.read(authErrorProvider));

    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Stack(
        children: [
          const Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Image(
              image: AssetImage(AssetsConstants.authBottumRight),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Image(
              image: AssetImage(AssetsConstants.authTopLeft),
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                    width: double.infinity,
                  ),
                  const Image(
                    image: AssetImage(AssetsConstants.authMainPic),
                    width: 400,
                  ),
                  SizedBox(
                    width: 300,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              onSaved: (newValue) => email = newValue,
                              validator: (value) {
                                if (value == "" ||
                                    value == null ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return "Not a Valid Email";
                                }
                              },
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                label: Text(
                                  "Examle@yahoo.com",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          if (!signin)
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                onSaved: (newValue) => username = newValue,
                                validator: (value) => value!.length < 4
                                    ? "username should be at least 4 characters"
                                    : null,
                                style: const TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  label: Text(
                                    "Username",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          const Gap(5),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              onSaved: (newValue) => password = newValue,
                              style: const TextStyle(fontSize: 16),
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                label: Text(
                                  "Password",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          // if an error occurred... display it to the screen
                          if (ref.watch(authErrorProvider) != null)
                            Center(
                              child: Text(
                                ref.watch(authErrorProvider)!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 146, 10, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          const Gap(15),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.transparent,
                                backgroundColor: MyColors.mainBlue,
                                // backgroundColor: Color.fromARGB(255, 0, 110, 255),
                              ),
                              onPressed: submit,
                              child: _isLoading
                                  ? LoadingAnimationWidget.halfTriangleDot(
                                      color: Colors.white, size: 30)
                                  : const Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  (signin)
                                      ? "Not in the family yet? "
                                      : "already have an account",
                                  style: const TextStyle(fontSize: 15)),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    signin = (signin) ? false : true;
                                  });
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.transparent),
                                ),
                                child: Text(signin ? "Sign Up" : "Sign in"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
