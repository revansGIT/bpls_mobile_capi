// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// // import 'app_colors.dart';
// import 'text.styles.dart';
//
// class AppTheme {
//
//
//   static ThemeData getLightModeTheme({String fontFamily = "Poppins"}) {
//
//     return ThemeData(
//       scaffoldBackgroundColor: scaffoldBackgroundColor,
//       appBarTheme: AppBarTheme(backgroundColor: scaffoldBackgroundColor, systemOverlayStyle: SystemUiOverlayStyle.light),
//       bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
//       buttonTheme: ButtonThemeData(buttonColor: Color(0xFF5b7284)),
//       badgeTheme: BadgeThemeData(backgroundColor: Color(0xFFFFFFFF)),
//       chipTheme: ChipThemeData(backgroundColor: Color(0xFF1f2630)),
//       iconTheme: IconThemeData(color: Color(0xFF000000)),
//       primaryColor: kPrimaryColor,
//       fontFamily: fontFamily,
//       // canvasColor: AppColors.lightThemeColors['backgroundColor'],
//       // primaryColorDark: AppColors.primaryColorDark,
//       cardColor: Color(0xFFFFFFFF),
//       dialogTheme: DialogTheme(backgroundColor: Color(0xFFFFFFFF), titleTextStyle: TextStyle(color: Color(0xFF000000))),
//       // canvasColor: AppColors.lightThemeColors['backgroundColor'],
//       shadowColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       // disabledColor: AppColors.grey,
//       // hintColor: AppColors.lightGrey,
//       brightness: Brightness.light,
//       // bottomAppBarColor: AppColors.lightThemeColors['backgroundColor'],
//       // dialogBackgroundColor: AppColors.lightThemeColors['backgroundColor'],
//       // dividerColor: AppColors.lightThemeColors['backgroundColor'],
//       //   cupertinoOverrideTheme: const CupertinoThemeData(),
//       inputDecorationTheme: InputDecorationTheme(
//           contentPadding: const EdgeInsets.all(10),
//           focusedBorder: const UnderlineInputBorder(),
//           errorStyle: subtitle2.copyWith(color: Colors.red),
//           fillColor: Color(0xFFFFFFFF),
//           filled: true,
//           isDense: true),
//       textTheme: TextTheme(
//         labelMedium: displaySmall.copyWith(color: Colors.black),
//         displayLarge: displayLarge.copyWith(color: Color(0xFF000000)),
//         displayMedium: displayMedium.copyWith(color: Colors.white),
//         // displaySmall: displaySmall.copyWith(color: AppColors.mediumBlueColor),
//         // headlineMedium: headlineMedium.copyWith(color: AppColors.lightThemeColors['textColor']),
//         // headlineSmall: headlineSmall.copyWith(color: AppColors.lightThemeColors['textColor']),
//         // titleLarge: titleLarge.copyWith(color: AppColors.lightThemeColors['textColor']),
//         // labelLarge: button.copyWith(color: AppColors.lightThemeColors['textColor']),
//         // bodySmall: caption.copyWith(color: AppColors.lightThemeColors['textColor']),
//         bodyLarge: bodyText1.copyWith(color: Color(0xff29313c)),
//         bodyMedium: bodyText2.copyWith(color: Color(0xFFf5f5f5)),
//         titleMedium: input.copyWith(color: Colors.black),
//         //Color(0xFFe5eef5)),
//         titleSmall: subtitle2.copyWith(color: Colors.grey.shade100),
//       ),
//     );
//   }
//
//   static ThemeData getDarkModeTheme({String fontFamily = "Poppins"}) {
//     return ThemeData(
//       scaffoldBackgroundColor: Color(0xFF000000),
//       appBarTheme: AppBarTheme(backgroundColor: Color(0xFF000000), systemOverlayStyle: SystemUiOverlayStyle.light),
//       bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF000000)),
//       // bottomAppBarColor: Color(0xFF000000),
//       iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
//       chipTheme: ChipThemeData(backgroundColor: Color(0xFF000000)),
//       dialogTheme: DialogTheme(
//           backgroundColor: Color(0xFF000000),
//           titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
//           contentTextStyle: TextStyle(color: Color(0xFFFFFFFF))),
//
//       badgeTheme: BadgeThemeData(backgroundColor: Color(0xFF5b7284)),
//       // buttonColor: Color(0xFF5b7284),
//       // primaryColor: AppColors.primaryColorDark,
//       //accentColor: AppColors.primaryColorDark,
//       fontFamily: fontFamily,
//       // canvasColor: Color(0xFF1f2630),
//       // primaryColorDark: AppColors.primaryColorDark,
//       cardColor: Color(0xff201d1d),
//       // canvasColor: AppColors.black,
//       shadowColor: Color(0xFF757575),
//       highlightColor: Colors.grey.shade100,
//       // disabledColor: AppColors.grey,
//       // hintColor: AppColors.lightGrey,
//       brightness: Brightness.dark,
//       // dividerColor: AppColors.black,
//       cupertinoOverrideTheme: const CupertinoThemeData(),
//       inputDecorationTheme: InputDecorationTheme(
//           contentPadding: const EdgeInsets.all(10),
//           focusedBorder: const UnderlineInputBorder(),
//           errorStyle: subtitle2.copyWith(color: Colors.red),
//           fillColor: Color(0xFF1f2630),
//           filled: true),
//       textTheme: TextTheme(
//         // labelMedium: title1.copyWith(color: AppColors.white),
//         displayLarge: displayLarge.copyWith(color: Color(0xFFFFFFFF)),
//         // displayMedium: displayMedium.copyWith(color: AppColors.black),
//         // displaySmall: displaySmall.copyWith(color: AppColors.black),
//         // headlineMedium: headlineMedium.copyWith(color: AppColors.darkThemeColors['textColor']),
//         // headlineSmall: headlineSmall.copyWith(color: AppColors.darkThemeColors['textColor']),
//         // titleLarge: titleLarge.copyWith(color: AppColors.darkThemeColors['textColor']),
//         // labelLarge: button.copyWith(color: AppColors.darkThemeColors['textColor']),
//         // bodySmall: caption.copyWith(color: AppColors.darkThemeColors['textColor']),
//         bodyLarge: bodyText1.copyWith(color: Color(0xFFFFFFFF)),
//         bodyMedium: bodyText2.copyWith(color: Color(0xff29313c)),
//         titleMedium: input.copyWith(color: Color(0xFF1f2630)),
//         titleSmall: subtitle2.copyWith(color: Color(0xFF757575)),
//       ),
//     );
//   }
// }
