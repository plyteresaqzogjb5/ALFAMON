import 'package:google_fonts/google_fonts.dart';
import 'package:alfamon/common/styles/const_theme/colors.dart';
import 'package:alfamon/common/styles/const_theme/size.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(BuildContext context, bool selectTheme) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: selectTheme ? Brightness.light : Brightness.dark,
        primary: const Color.fromRGBO(19, 124, 248, 1),
        onPrimary:
            selectTheme ? AppColors.whitebackground : AppColors.blackbackground,
        secondary:
            selectTheme ? AppColors.cardColor : AppColors.textColorDarker,
        onSecondary:
            selectTheme ? AppColors.whitebackground : AppColors.blackbackground,
        surface: AppColors.whitebackground,
        onSurface: AppColors.blackbackground,
        background:
            selectTheme ? AppColors.whitebackground : AppColors.blackbackground,
        onBackground:
            selectTheme ? AppColors.blackbackground : AppColors.whitebackground,
        error: const Color.fromRGBO(244, 67, 54, 0.867),
        onError: const Color.fromRGBO(244, 67, 54, 0.867),
        shadow: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.darkShadowColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor:
          selectTheme ? AppColors.whitebackground : AppColors.blackbackground,
      textTheme: TextThemes.textTheme(context, selectTheme),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor:
            selectTheme ? AppColors.whitebackground : AppColors.blackbackground,
        elevation: 0,
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: selectTheme
              ? AppColors.whitebackground
              : AppColors.blackbackground,
          labelTextStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            fontFamily: 'SFPRO',
            color: selectTheme
                ? AppColors.textColorDarker
                : AppColors.whitebackground,
          )),
          iconTheme: MaterialStateProperty.all<IconThemeData>(
            IconThemeData(
                color: selectTheme
                    ? AppColors.blackbackground
                    : AppColors.whitebackground),
          )),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.32,
              color: Theme.of(context).colorScheme.shadow,
            ),
        suffixIconColor: Theme.of(context).colorScheme.shadow,
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.firstDefaultBorderRadius)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.firstDefaultBorderRadius)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.firstDefaultBorderRadius)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.firstDefaultBorderRadius)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
              Radius.circular(SizeConfig.firstDefaultBorderRadius)),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class TextThemes {
  static TextTheme textTheme(BuildContext context, bool selectTheme) {
    return GoogleFonts.redHatDisplayTextTheme(
      Theme.of(context).textTheme,
    ).copyWith(
      displayLarge: GoogleFonts.mulish(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.textColorDarker,
      ),
      displayMedium: GoogleFonts.mulish(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.textColorDarker,
      ),
      displaySmall: GoogleFonts.mulish(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.textColorDarker,
      ),
      headlineMedium: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.textColorDarker,
      ),
      headlineSmall: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.textColorDarker,
      ),
      titleLarge: GoogleFonts.mulish(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: selectTheme
            ? AppColors.darkShadowColor
            : AppColors.ligthShadowColor,
      ),
      titleSmall: GoogleFonts.mulish(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: selectTheme
            ? AppColors.ligthShadowColor
            : AppColors.textColorDarker,
      ),
    );
  }
}
