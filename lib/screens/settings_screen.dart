import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.settings, this.onSettingsChanged);
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget creatSwich(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView(
              children: [
                creatSwich(
                  'No Glutten',
                  'No Glutten Meals',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                creatSwich(
                  'No Lactose',
                  'No Lactose Meals',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                creatSwich(
                  'Is Vegan',
                  'Is Vegan',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                creatSwich(
                  'Is Vegetarian',
                  'Is Vegetarian',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            )),
          ],
        ));
  }
}
