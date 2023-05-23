// my screens
import 'package:flutter_authentication/screens/Splash/splash.dart';
import "../DashBoard/dashboard.dart";
import '../SignIn/sign_in.dart';

import "../../bloc/bloc_auth/auth_bloc.dart";
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationpasswordController = TextEditingController();

  bool valueCheckBox = false;

  @override
  void dispose() {
    _emailController.dispose();
    _fullnameController.dispose();
    _phonenumberController.dispose();
    _passwordController.dispose();
    _confirmationpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SingUp"),
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // navagendo para a tela de dashboard
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          }

          if (state is AuthError) {
            // mostrando a mensagem de erro
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // mostrando o loading
            return Center(
              child: Lottie.asset('assets/loading/loading.json'),
            );
          }

          if (state is UnAuthenticaded) {
            // mostrando o form de sign up(register) se o usuario nao estiver autenticado
            return Center(
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      // reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // fazendo o header
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFF272f32),
                                ),
                                width: double.infinity,
                                height: 200,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFe5e1de),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(50)),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                          style: BorderStyle.solid)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: IconButton(
                                            iconSize: 30,
                                            icon: const Icon(
                                              Icons.arrow_back_outlined,
                                              color: Color(0xFF272f32),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Splash()));
                                            },
                                          )),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 25.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Create',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF272f32)),
                                            ),
                                            Text(
                                              'Account',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF272f32)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // fazendo o form
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(0),
                              children: [
                                Container(
                                  // height: 460,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 0.0),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF272f32)),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 0),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.name,
                                                controller: _fullnameController,
                                                style: const TextStyle(
                                                    color: Color(0xFFe5e1de)),
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: '  Full name',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white30),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xFFe5e1de)),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFFe5e1de))),
                                                ),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return value != ''
                                                      ? null
                                                      : 'Enter a valid full name';
                                                },
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                controller: _emailController,
                                                style: const TextStyle(
                                                    color: Color(0xFFe5e1de)),
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: '  Email',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white30),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFFe5e1de))),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFFe5e1de))),
                                                ),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return value != null &&
                                                          !EmailValidator
                                                              .validate(value)
                                                      ? 'Enter a valid email'
                                                      : null;
                                                },
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller:
                                                    _phonenumberController,
                                                style: const TextStyle(
                                                    color: Color(0xFFe5e1de)),
                                                decoration: const InputDecoration(
                                                    hintText: '  Phone',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white30),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFe5e1de))),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFe5e1de)))),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return value != null &&
                                                          value.length < 9
                                                      ? 'Enter a validade number of the phone'
                                                      : null;
                                                },
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: true,
                                                controller: _passwordController,
                                                style: const TextStyle(
                                                    color: Color(0xFFe5e1de)),
                                                decoration: const InputDecoration(
                                                    hintText: '  Password',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white30),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFe5e1de))),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFe5e1de)))),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return value != null &&
                                                          value.length < 6
                                                      ? 'Enter a validade password'
                                                      : null;
                                                },
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: true,
                                                controller:
                                                    _confirmationpasswordController,
                                                style: const TextStyle(
                                                    color: Color(0xFFe5e1de)),
                                                decoration: const InputDecoration(
                                                    hintText:
                                                        '  Confirm Password',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white30),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFe5e1de))),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFe5e1de)))),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return value !=
                                                          _passwordController
                                                              .text
                                                      ? 'different passwords'
                                                      : null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CheckboxListTile(
                                          activeColor: const Color(0xFFe5e1de),
                                          checkColor: const Color(0xFF272f32),
                                          side: const BorderSide(
                                              color: Color(0xFFe5e1de)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0,
                                                  horizontal: 17.0),
                                          title: const Text(
                                            'Agree to terms and conditions',
                                            style: TextStyle(
                                                color: Color(0xFFe5e1de),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          value: valueCheckBox,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              valueCheckBox = newValue ?? false;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 25.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              valueCheckBox
                                                  ? _createAccount(context)
                                                  : null;
                                            },
                                            style: ButtonStyle(
                                                backgroundColor: valueCheckBox
                                                    ? const MaterialStatePropertyAll(
                                                        Color(0xFFe5e1de))
                                                    : MaterialStatePropertyAll(
                                                        const Color(0xFFe5e1de)
                                                            .withOpacity(0.4)),
                                                foregroundColor:
                                                    const MaterialStatePropertyAll(
                                                        Color(0xFF272f32)),
                                                shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      side: const BorderSide(
                                                          color: Color(
                                                              0xFF272F32))),
                                                ),
                                                textStyle:
                                                    const MaterialStatePropertyAll(
                                                        TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                            child: const Text('Sign Up'),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                child: const Text(
                                                  'Already have an account ?',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SignIn()));
                                                },
                                                child: const Text(
                                                  'Sign In',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            );
          }

          return Container();
        },
      ),
    );
  }

  void _createAccount(BuildContext context) {
    // if (_confirmationpasswordController == _passwordController) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(SignUpRequested(
        _emailController.text,
        _passwordController.text,
        _fullnameController.text,
        _phonenumberController.text,
      ));
    }
    // }
  }
}
