import 'package:flutter/material.dart';

import '../model/complete_model.dart';
import '../model/login_data.dart';

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
    return Form(
        key: formKey,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  FractionallySizedBox(
                    child: emailFormField(),
                    widthFactor: 0.4,
                  ),
                  FractionallySizedBox(
                    child: passwordFormField(),
                    widthFactor: 0.4,
                  ),
                  const Divider(),
                  submitButton(),
                ],
              ),
            ),
            Row(children: [myCheckbox(), const Text("Checkbox")]),
            Row(children: [mySwitch(), const Text("Switch")]),
            Row(children: [const Text("Slider"), mySlider()]),
            Row(children: [myRadio(1), const Text("Radio 1")]),
            Row(children: [myRadio(2), const Text("Radio 2")]),
            Row(children: [myRadio(3), const Text("Radio 3")]),
            Row(children: [myRadio(4), const Text("Radio 4")]),
            const Divider(),
            myButtonSnackBar(),
            const Divider(),
            myButtonBottomSheet(),
          ],
        ));
  }

  Widget emailFormField() {
    return TextFormField(
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
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 10) {
            return "Mínimo de 10 letras";
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
    );
  }

  Widget submitButton() {
    return FractionallySizedBox(
      child: ElevatedButton(
        child: const Text("Login"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            loginData.doSomething();
          }
        },
      ),
      widthFactor: 0.4,
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

  Widget mySwitch() {
    return Switch(
      value: completeModel.switchValue,
      onChanged: (bool inValue) {
        setState(() {
          completeModel.switchValue = inValue;
        });
      },
    );
  }

  Widget mySlider() {
    return Slider(
      min: 0,
      max: 20,
      value: completeModel.sliderValue,
      onChanged: (double inValue) {
        setState(() => completeModel.sliderValue = inValue);
      },
    );
  }

  Widget myRadio(int value) {
    return Radio(
      value: value, // Valor deste botão
      groupValue: completeModel.radioValue, // Valor do grupo
      onChanged: (int? inValue) {
        if (inValue != null) {
          setState(() {
            completeModel.radioValue = inValue;
          });
        }
      },
    );
  }

  Widget myButtonSnackBar() {
    return ElevatedButton(
      child: const Text("Mostrar SnackBar!"),
      onPressed: () {
        completeModel.doSomething();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
            content: const Text("Obrigado"),
            action: SnackBarAction(
                label: "Volte Sempre! ${completeModel.radioValue}",
                onPressed: () {})));
      },
    );
  }

  Widget myButtonBottomSheet() {
    return ElevatedButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            backgroundColor: Colors.green,
            builder: (_) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Quem é o seu professor favorito:"),
                        TextButton(
                            child: const Text("Guilherme Coelho"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: const Text("Celmar Guimarães"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: const Text("Ulisses Martins Dias"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        child: const Text("Vote no Professor Favorito"));
  }
}
