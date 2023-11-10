import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../model/complete_model.dart';
import '../model/login_data.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final CompleteModel completeModel = CompleteModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Impossível Logar"),
                  content: Text(state.message),
                );
              });
        } else if (state is Authenticated) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text(
              "Página de Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'E aí!',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff1D1617),
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: Text(
                      'Pronto para Jogar Novamente?',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff1D1617),
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: emailFormField(),
                  ),
                  passwordFormField(),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.025),
                    child: Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                        color: const Color(0xffADA4A5),
                        decoration: TextDecoration.underline,
                        fontSize: size.height * 0.018,
                      ),
                    ),
                  ),
                  submitButton(),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.04),
                    height: size.height * 0.2,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                        ),
                      ],
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Colors.black,
                        Colors.red,
                      ]),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child:
                            Image.asset('../assets/images/BlackJackApp.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Não tem uma conta ainda? ",
                          style: TextStyle(
                            color: const Color(0xff1D1617),
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Cadastrar",
                            style: TextStyle(
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: <Color>[
                                    Color(0xffEEA4CE),
                                    Color(0xffC58BF2),
                                  ],
                                ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                ),
                              // color: const Color(0xffC58BF2),
                              fontSize: size.height * 0.018,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterForm()),
                                );
                              },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget emailFormField() {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.isEmpty) {
              return "Insira um email válido";
            }
          }
          return null;
        },
        onSaved: (String? inValue) {
          loginData.email = inValue ?? "";
        },
        decoration: const InputDecoration(
          hintText: "user@domain.br",
          labelText: "Email",
        ),
      ),
    );
  }

  Widget passwordFormField() {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: TextFormField(
        obscureText: true,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.length < 8) {
              return "Mínimo de 8 caracteres";
            }
          }
          return null;
        },
        onSaved: (String? inValue) {
          loginData.password = inValue ?? "";
        },
        decoration: const InputDecoration(
          labelText: "Senha",
        ),
      ),
    );
  }

  Widget submitButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.09),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 0, 38),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02, bottom: size.height * 0.02),
            child: Text(
              "Login",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: size.height * 0.02,
                  fontStyle: FontStyle.normal),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<AuthBloc>(context).add(
                LoginUser(
                  email: loginData.email,
                  password: loginData.password,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
