import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app/core/app_constants/app_strings/app_string.dart';
import 'package:my_health_app/core/app_constants/images/images_constants.dart';
import 'package:my_health_app/core/app_constants/theme/theme.dart';
import 'package:my_health_app/core/presenters/components/divider_widget.dart';
import 'package:my_health_app/core/presenters/components/password_text_field.dart';
import 'package:my_health_app/core/presenters/components/primary_text_form_field.dart';
import 'package:my_health_app/presenter/view/auth/login/login_view.dart';

import '../../../../core/presenters/components/secondary_button.dart';
import '../../../../core/presenters/components/terms_and_privacy_text.dart';
import '../../../../onboard/presenter/component/primary_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController firstName = TextEditingController();
  TextEditingController listName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  
  @override
  Widget build(BuildContext context) {
    String name;

    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text('Criar Conta',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
                  fontWeight: FontWeight.w600,
                ).copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 24)
            ),
            const SizedBox(height: 8),
            Text('Feliz por te ver, regista-se e use a app',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.kWhite)
                    .copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Primeiro Nome',
                    style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.kWhite)
                            .copyWith(
                                color: AppColor.kGrayscaleDark100,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                    ),
                    const SizedBox(height: 8,),
                    PrimaryTextFormField(
                      borderRadius: BorderRadius.circular(24),
                      hintText: 'Primeiro',
                      controller: firstName,
                      width: 155,
                      height: 52
                    )
                  ]
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ultimo Nome',
                           style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.kWhite)
                            .copyWith(
                                color: AppColor.kGrayscaleDark100,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                    ),

                  const SizedBox(
                    height: 8,
                  ),
                  PrimaryTextFormField(
                    borderRadius: BorderRadius.circular(24),
                    hintText: 'Ultimo',
                    controller: listName,
                    width: 155,
                    height: 52
                  )
                  ]
                )
              ]
            ),

            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Email",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kWhite)
                        .copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                  ),
                  const SizedBox(height: 7,),
                   PrimaryTextFormField(
                      borderRadius: BorderRadius.circular(24),
                      hintText: 'francisco.jose@gmail.com',
                      controller: emailController,
                      width: 327,
                      height: 52),
              ],
            ),
            const SizedBox(height: 7,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Palavra Passe',
                 style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kWhite)
                        .copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                ),
                const SizedBox(height: 8,),

                PasswordTextField(
                  borderRadius: BorderRadius.circular(24),
                      hintText: 'Palavra Passe',
                      controller: passwordController,
                      width: 327,
                      height: 52
                )

              ],
            ),
            SizedBox(height: 8),

            Column(children: [
              PrimaryButton(
                onTap: ()async{
                  try {
                    UserCredencial userCredencial = await _auth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());

                    print('Esta é a resposta do metodo criar ${userCredencial.user!.uid}');

                    name = '${firstName.text} ${listName.text}';

                    print('Nome do Usuário $name');

                    if(userCredencial.user != null){
                      CollectionReference users = FirebaseFirestore.instance.collection;
                      await user.doc(userCredencial.user!.uid).set
                      ({
                          'id': userCredential.user!.uid,
                          'image': '',
                          'name': name,
                          'email': emailController.text.trim(),
                      });
                      print('$users ->Usuário adicionado no firestore');

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Registo feito com sucesso"))
                      );
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(e.toString()))
                    );
                  }

                  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()),
                      );
                },
                    text: AppStrings.createAccount,
                    bgColor: AppColor.bgColor,
                    borderRadius: 20,
                    height: 46,
                    width: 327,
                    textColor: AppColor.kWhite,
              ),
              const SizedBox(height: 20,),
              CustomRickText( 
                title: AppStrings.areadyAccount,
                subtitle: AppStrings.singIn,
                onTap: (){},
                subtitleTextStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kWhite)
                        .copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
              )
            ],),

             const SizedBox(height: 30),
             Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: DividerRow(title: AppStrings.singUpWidth),
                ),
                const SizedBox(height: 24),
                
                SecondaryButton(
                        height: 56,
                        textColor: AppColor.kGrayscaleDark100,
                        width: 260,
                        onTap: () {},
                        borderRadius: 24,
                        bgColor: AppColor.kBackground.withOpacity(0.3),
                        text: 'Continuar com Google',
                        icons: ImagesPath.kGoogleIcon),

                const SizedBox(height: 20,),

                const Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                child: TermsAndPrivacyText(
                    title1: '  Ao Logar-se voce aceita com os',
                  title2: ' Termos ',
                  title3: '  e',
                  title4: ' Condições de Uso',
                ),
                )
              ],
            ), 
            )

          ],
        ),
      ),
    );
  }
}