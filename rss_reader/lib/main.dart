import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';

void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (context) => AppState(),
            child: MaterialApp(
                title: 'Namer App',
                theme: ThemeData(
                    useMaterial3: true,
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                    ),
                initialRoute: HomePage.route,
                routes: {
                    HomePage.route: (BuildContext context) => HomePage(),
                    SettingsPage.route: (BuildContext context) => SettingsPage(),
                }
            ),
        );
    }
}


class AppState extends ChangeNotifier {
    // TODO: DATABASE
    // TODO: FETCH
}

class HomePage extends StatelessWidget {
   static const String route = '/';

    @override 
    Widget build(BuildContext context) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ 
                    Text("HomePage"),
                ],
            ),
        );
    }
}

class SettingsPage extends StatelessWidget {
    static const String route = '/settings';

    @override 
    Widget build(BuildContext context) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ Text("Settings"),],
            ),
        );
    }
}

