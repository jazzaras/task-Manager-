import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;

  // to determine whether so sign in or up
  bool signin = true;

  // inputs
  String? email;
  String? username;
  String? password;

  void submit() async {
    // VALIDATE THE INPUTS
    // ...

    // this will invoke the onSave method in evey Form Field in the Form Widget
    _formKey.currentState!.save();

    await supabase.auth.signUp(
        email: email, password: password!, data: {"username": username});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Image(
            image: AssetImage("assets/images/login_bottom.png"),
          ),
        ),
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Image(
            image: AssetImage("assets/images/main_top.png"),
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
                  image: AssetImage("assets/images/login.png"),
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
                            // validator: (value) {
                            //   if (value != "") {
                            //     return value;
                            //   }
                            // },
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
                              style: const TextStyle(fontSize: 16),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
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
                                      BorderSide(color: Colors.transparent)),
                              label: Text(
                                "Password",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const Gap(25),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 96, 163, 252),
                              // backgroundColor: Color.fromARGB(255, 0, 110, 255),
                            ),
                            onPressed: submit,
                            child: const Text(
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
                                style: TextStyle(fontSize: 15)),
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
    );
  }
}
