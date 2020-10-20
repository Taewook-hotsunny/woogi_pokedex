import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/utility/theme_controller.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(PokeDexApp());
}

class PokeDexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.get.getThemeModeFromPreferences();
    return GetMaterialApp(
      title: 'PokeDex',
      theme: ThemeData.light().copyWith(primaryColor: Colors.green),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple),
      themeMode: ThemeController.get.themeMode,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _themeMode;

  @override
  Widget build(BuildContext context) {
    _themeMode = ThemeController.get.themeMode;
    print('${MediaQuery.of(context).platformBrightness}');
    print('${Theme.of(context).brightness}');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              'System Brightness: ${Get.mediaQuery.platformBrightness.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'Theme Brightness: ${Get.theme.brightness.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'ThemeMode',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          RadioListTile(
            title: Text('system'),
            value: ThemeMode.system,
            groupValue: _themeMode,
            onChanged: (value) {
              setState(() {
                _themeMode = value;
                ThemeController.get.setThemeMode(_themeMode); //STEP 8 - change this line
              });
            },
          ),
          RadioListTile(
            title: Text('dark'),
            value: ThemeMode.dark,
            groupValue: _themeMode,
            onChanged: (value) {
              setState(() {
                _themeMode = value;
                ThemeController.get.setThemeMode(_themeMode);
              });
            },
          ),
          RadioListTile(
            title: Text('light'),
            value: ThemeMode.light,
            groupValue: _themeMode,
            onChanged: (value) {
              setState(() {
                _themeMode = value;
                ThemeController.get.setThemeMode(_themeMode);
              });
            },
          ),
        ],
      ),
    );
  }
}
