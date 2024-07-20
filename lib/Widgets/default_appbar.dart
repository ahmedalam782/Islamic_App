import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "إسلامي",
        style: GoogleFonts.elMessiri(
          fontSize: 30,
          color: const Color(0xff242424),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
