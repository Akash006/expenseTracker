import 'package:expense_tracker/database/createDatabase.dart';
import 'package:expense_tracker/modals/mythemeData.dart';
import 'package:expense_tracker/modals/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/appRouteConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.getInstance.getDB();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late RouterConfig<Object> _routerConfig;

  @override
  void initState() {
    super.initState();
    _routerConfig = MyAppRouter().router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            theme: MyThemeData().lightMode,
            // darkTheme: MyThemeData().darkMode,
            // themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: _routerConfig,
          );
        },
      ),
    );
  }
}
