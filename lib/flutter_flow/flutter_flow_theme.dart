// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color hint;
  late Color divider;
  late Color isChat;
  late Color outline;
  late Color onPrimary;
  late Color onSecondary;
  late Color onSurface;
  late Color onError;
  late Color transparent;
  late Color accent30;
  late Color primary10;
  late Color primary20;
  late Color secondary20;
  late Color accent40;
  late Color success20;
  late Color onPrimary20;
  late Color onSurface90;
  late Color secondary10;

  FFDesignTokens get designToken => FFDesignTokens(this);

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFA8B5A0);
  late Color secondary = const Color(0xFFD4A5A5);
  late Color tertiary = const Color(0xFFE8DCC4);
  late Color alternate = const Color(0xFFE8E2D9);
  late Color primaryText = const Color(0xFF4A443F);
  late Color secondaryText = const Color(0xFF7D746D);
  late Color primaryBackground = const Color(0xFFFAF7F2);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF2ECC71);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0xFFBDB6AF);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF81C784);
  late Color warning = const Color(0xFFFACC15);
  late Color error = const Color(0xFFE57373);
  late Color info = const Color(0xFFFFFFFF);

  late Color hint = const Color(0xFF94A3B8);
  late Color divider = const Color(0xFFE2E8F0);
  late Color isChat = const Color(0xFFCDE9FE);
  late Color outline = const Color(0xFFE2E8F0);
  late Color onPrimary = const Color(0xFFFAF7F2);
  late Color onSecondary = const Color(0xFFFAF7F2);
  late Color onSurface = const Color(0xFF4A443F);
  late Color onError = const Color(0xFFFFFFFF);
  late Color transparent = const Color(0x00000000);
  late Color accent30 = const Color(0x4DE8DCC4);
  late Color primary10 = const Color(0x1AA8B5A0);
  late Color primary20 = const Color(0x33A8B5A0);
  late Color secondary20 = const Color(0x33D4A5A5);
  late Color accent40 = const Color(0x66E8DCC4);
  late Color success20 = const Color(0x3381C784);
  late Color onPrimary20 = const Color(0x33FAF7F2);
  late Color onSurface90 = const Color(0xE64A443F);
  late Color secondary10 = const Color(0x1AD4A5A5);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Inter';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Nunito';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.nunito(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
        height: 1.2,
      );
  String get headlineMediumFamily => 'Nunito';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.nunito(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 26.0,
        height: 1.25,
      );
  String get headlineSmallFamily => 'Inter';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Nunito';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.nunito(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        height: 1.3,
      );
  String get titleMediumFamily => 'DM Sans';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.dmSans(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 17.0,
        height: 1.4,
      );
  String get titleSmallFamily => 'Inter';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Nunito';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.nunito(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        height: 1.3,
      );
  String get labelMediumFamily => 'Nunito';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.nunito(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        height: 1.3,
      );
  String get labelSmallFamily => 'Nunito';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.nunito(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 10.0,
        height: 1.2,
      );
  String get bodyLargeFamily => 'DM Sans';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.dmSans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.5,
      );
  String get bodyMediumFamily => 'DM Sans';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.dmSans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.5,
      );
  String get bodySmallFamily => 'DM Sans';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.dmSans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        height: 1.4,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFA8B5A0);
  late Color secondary = const Color(0xFFD4A5A5);
  late Color tertiary = const Color(0xFFE8DCC4);
  late Color alternate = const Color(0xFF4A443F);
  late Color primaryText = const Color(0xFFFAF7F2);
  late Color secondaryText = const Color(0xFFBDB6AF);
  late Color primaryBackground = const Color(0xFF2D2A26);
  late Color secondaryBackground = const Color(0xFF3D3934);
  late Color accent1 = const Color(0xFF4ADE80);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0xFF7D746D);
  late Color accent4 = const Color(0xB2262D34);
  late Color success = const Color(0xFFA5D6A7);
  late Color warning = const Color(0xFFFACC15);
  late Color error = const Color(0xFFEF9A9A);
  late Color info = const Color(0xFFFFFFFF);

  late Color hint = const Color(0xFF475569);
  late Color divider = const Color(0xFF334155);
  late Color isChat = const Color(0xFFCDE9FE);
  late Color outline = const Color(0xFF334155);
  late Color onPrimary = const Color(0xFF2D2A26);
  late Color onSecondary = const Color(0xFF2D2A26);
  late Color onSurface = const Color(0xFFFAF7F2);
  late Color onError = const Color(0xFF2D2A26);
  late Color transparent = const Color(0x00000000);
  late Color accent30 = const Color(0x4DE8DCC4);
  late Color primary10 = const Color(0x1AA8B5A0);
  late Color primary20 = const Color(0x33A8B5A0);
  late Color secondary20 = const Color(0x33D4A5A5);
  late Color accent40 = const Color(0x66E8DCC4);
  late Color success20 = const Color(0x33A5D6A7);
  late Color onPrimary20 = const Color(0x332D2A26);
  late Color onSurface90 = const Color(0xE6FAF7F2);
  late Color secondary10 = const Color(0x1AD4A5A5);
}

class FFDesignTokens {
  const FFDesignTokens(this.theme);
  final FlutterFlowTheme theme;
  FFSpacing get spacing => const FFSpacing();
  FFRadius get radius => const FFRadius();
  FFShadows get shadow => FFShadows(theme);
}

class FFSpacing {
  const FFSpacing();
  double get none => 0.0;
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
  double get xxl => 48.0;
  double get xxxl => 64.0;
}

class FFRadius {
  const FFRadius();
  double get none => 0.0;
  double get xs => 2.0;
  double get sm => 12.0;
  double get md => 20.0;
  double get lg => 32.0;
  double get xl => 24.0;
  double get xxl => 32.0;
  double get full => 9999.0;
}

class FFShadows {
  const FFShadows(this.theme);
  final FlutterFlowTheme theme;
  BoxShadow get sm => const BoxShadow(
      blurRadius: 12.0,
      color: const Color(0x0D4A443F),
      offset: const Offset(0.0, 4.0),
      spreadRadius: 0.0);
  BoxShadow get md => const BoxShadow(
      blurRadius: 24.0,
      color: const Color(0x144A443F),
      offset: const Offset(0.0, 8.0),
      spreadRadius: 0.0);
  BoxShadow get lg => const BoxShadow(
      blurRadius: 32.0,
      color: const Color(0x1A4A443F),
      offset: const Offset(0.0, 12.0),
      spreadRadius: 0.0);
  BoxShadow get xl => const BoxShadow(
      blurRadius: 48.0,
      color: const Color(0x264A443F),
      offset: const Offset(0.0, 16.0),
      spreadRadius: 0.0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
