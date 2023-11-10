import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../model/complete_model.dart';
import '../model/login_data.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final CompleteModel completeModel = CompleteModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nunca jogou antes?',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff1D1617),
                    fontSize: size.height * 0.02,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Text(
                    'Você vai amar o BlackJapp!',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff1D1617),
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: nameFormField(),
                ),
                usernameFormField(),
                emailFormField(),
                passwordFormField(),
                confirmPasswordFormField(),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      myCheckbox(),
                      SizedBox(
                        width: size.width * 0.7,
                        child: Center(
                          child: Text(
                            "Ao criar a minha conta, eu concordo com todos os termos e condições",
                            style: TextStyle(
                              color: const Color(0xffADA4A5),
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                submitButton(),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  height: size.height * 0.15,
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
                      child: Image.asset('../assets/images/BlackJackApp.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Já tem uma conta? ",
                          style: TextStyle(
                            color: const Color(0xff1D1617),
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Login",
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
                                  Navigator.pop(context);
                                }),
                        ),
                      ]),
                ),
              ],
            ),
          )),
    );
  }

  Widget nameFormField() {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: TextFormField(
        keyboardType: TextInputType.name,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.isEmpty) {
              return "Insira um nome válido";
            }
          }
          return null;
        },
        onSaved: (String? inValue) {
          loginData.email = inValue ?? "";
        },
        decoration: const InputDecoration(
          hintText: "Fulano Ciclano Beltrano",
          labelText: "Nome Completo",
        ),
      ),
    );
  }

  Widget usernameFormField() {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: TextFormField(
        keyboardType: TextInputType.name,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.isEmpty) {
              return "Insira um nome de usuário válido";
            }
          }
          return null;
        },
        onSaved: (String? inValue) {
          loginData.email = inValue ?? "";
        },
        decoration: const InputDecoration(
          hintText: "Fulano123",
          labelText: "Nome de Usuário",
        ),
      ),
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

  Widget confirmPasswordFormField() {
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
          labelText: "Confirme sua Senha",
        ),
      ),
    );
  }

  Widget submitButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
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
              "Cadastrar",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: size.height * 0.02,
                  fontStyle: FontStyle.normal),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              loginData.doSomething();
              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 5),
                  content: const Text("Cadastro realizado com sucesso!"),
                  action: SnackBarAction(
                      label: "Faça Login! ${completeModel.radioValue}",
                      onPressed: () {})));
            }
          },
        ),
      ),
    );
  }

  Widget myCheckbox() {
    return Checkbox(
      value: completeModel.checkboxValue,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.checkboxValue = inValue;
          });
        }
      },
    );
  }
}
