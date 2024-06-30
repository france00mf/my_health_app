import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app/core/app_constants/theme/theme.dart';
import 'package:my_health_app/core/presenters/components/primary_text_form_field.dart';

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

                
              ],
            )

          ],
        ),
      ),
    );
  }
}