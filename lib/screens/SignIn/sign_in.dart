// my screens
import '../DashBoard/dashboard.dart';
import '../Splash/splash.dart';

import '../../bloc/bloc_auth/auth_bloc.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool showPassword;
  bool valueCheckBox = false;

  @override
  void initState() {
    showPassword = true;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("SignIn"),
          toolbarHeight: 0),
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
        if (state is Authenticated) {
          // Navegando para a tela dashboard quando o usuario ja esta autenticado
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const Dashboard())));
        }

        if (state is AuthError) {
          // mostrando a mensagem de erro
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      }, child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            // mostrando o loading
            return Center(
              child: Lottie.asset('assets/loading/loading.json'),
            );
            // return const Center(child: CircularProgressIndicator());
          }

          if (state is UnAuthenticaded) {
            // mostrando o form de sign in (login) quando o usuario nao esta autenticado
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: SingleChildScrollView(
                  reverse: false,
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
                                    color: Color(0xFF272f32)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 25.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Welcome',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF272f32)),
                                              ),
                                              Text(
                                                'Back!',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF272f32)),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                ' Continue your adventure',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF272f32)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )))
                          ],
                        ),
                        // fazendo o form
                        Container(
                            height: 460,
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 0.0),
                            decoration:
                                const BoxDecoration(color: Color(0xFF272f32)),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 25.0),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: _emailController,
                                            style: const TextStyle(
                                                color: Color(0xFFe5e1de)),
                                            decoration: const InputDecoration(
                                                hintText: "  Email",
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
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              return value != null &&
                                                      !EmailValidator.validate(
                                                          value)
                                                  ? "Enter a valid email"
                                                  : null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          TextFormField(
                                            obscureText: showPassword,
                                            keyboardType: TextInputType.text,
                                            controller: _passwordController,
                                            style: const TextStyle(
                                                color: Color(0xFFe5e1de)),
                                            decoration: InputDecoration(
                                                hintText: "  Password",
                                                hintStyle: const TextStyle(
                                                  color: Colors.white30,
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: const Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: Color(0xFFe5e1de),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      showPassword =
                                                          !showPassword;
                                                    });
                                                  },
                                                ),
                                                enabledBorder:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xFFe5e1de))),
                                                focusedBorder:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xFFe5e1de)))),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              return value != null &&
                                                      value.length < 6
                                                  ? "Enter min. 6 charaters"
                                                  : null;
                                            },
                                          )
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
                                              vertical: 0.0, horizontal: 17.0),
                                      title: const Text(
                                        "Remember me",
                                        style:
                                            TextStyle(color: Color(0xFFe5e1de)),
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
                                          vertical: 0.0, horizontal: 25.0),
                                      width:
                                          MediaQuery.of(context).size.width * 2,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _authenticateWithEmailAndPassword(
                                              context);
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFe5e1de)),
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
                                                            0xFF272f32)))),
                                            textStyle:
                                                const MaterialStatePropertyAll(
                                                    TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                        child: const Text("Sign In"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                        child: Container(
                                      alignment: Alignment.centerRight,
                                      width: 360,
                                      child: const Text(
                                        'Forgot password ?',
                                        style: TextStyle(
                                          color: Color(0xFFe5e1de),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                                  ],
                                ))),
                      ]),
                ),
              ),
            );
          }

          return Container();
        },
      )),
    );
  }

// my functions
  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }
}
