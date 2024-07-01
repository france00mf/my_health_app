import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app/core/app_constants/theme/theme.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle subtitleTextStyle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.kWhite)
              .copyWith(
                  color: AppColor.kGrayscale40,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
          children: <TextSpan>[
            TextSpan(
              text: subtitle,
              style: subtitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}