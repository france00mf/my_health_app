import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app/core/app_constants/theme/theme.dart';

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
        );
    } catch (e) {
      print("Falha ao logar apontado em $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha , verifique o Email e a palavra passe $e'))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: 330,
          child: Column(
            children: [
              Text('Olá, Bemvindo de volta',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ).copyWith(color: AppColor.kGrayscaleDark100, fontSize: 24)
              ),
              const SizedBox(height: 8),
              Text("Gostamos de lhe receber novamente, Faça o login",
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.kWhite)
                    .copyWith(color: AppColor.kGrayscale40, fontSize: 14),
              ),
              const SizedBox(height: 36,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              )
            ],
          ),
        ),
      )
    );
  }
}