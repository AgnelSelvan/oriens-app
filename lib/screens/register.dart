import 'package:flutter/material.dart';
import 'package:oriens/widgets/rounded.dart';
import 'package:oriens/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  showSuccessDialog() {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text(
                "Congratulations, your account has been successfully created"),
            actions: [
              RoundedPrimaryButton(
                title: "Continue",
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          );
        }));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!(isValid ?? true)) {
      return;
    }
    _formKey.currentState?.save();
    if (isValid ?? false) {
      showSuccessDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset("assets/images/logo.jpeg"),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  OriensTextField(
                    labelText: "Email / Mobile No.",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if ((value ?? "").isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value ?? "")) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OriensTextField(
                    labelText: "Password",
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: RoundedPrimaryButton(
                      title: "Register",
                      onPressed: () {
                        _submit();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
