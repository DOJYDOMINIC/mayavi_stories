import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mayavi_stories/view/homepage.dart';
import 'package:provider/provider.dart';

import 'control/providerone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
        Locale('ml', 'IN')
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderOne(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Consumer(builder: (context, value, child) => HomePage()),
      ),
    );
  }
}
