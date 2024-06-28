import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword() async {
    try {
        print("Logando com o email: ${emailController.text.trim()}");
        final UserCredential userCredencial = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
        );
        final User? user = userCredencial.user;
        print("Usuádio logado em -> ${user!.email}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${user.email} Logado'),)
        )
    } catch (e) {
      print("Falha ao logar apontado em $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha , verifique o Email e a palavra passe $e'))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}