import 'package:flutter/material.dart';
import 'package:receitas/components/main_drawer.dart';
import 'package:receitas/models/setting.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingdChange, this.setting, {super.key});
  final Setting setting;

  final Function(Setting) onSettingdChange;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Setting? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.setting;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) recepitor,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        recepitor(value);
        widget.onSettingdChange(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          title: const Text('configuraçoes'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'configuraçoes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutem',
                  'Só exibe refeiçoes sem glutem',
                  settings!.isGlutenFree,
                  (value) => setState(
                    () {
                      settings!.isGlutenFree = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Sem lactose',
                  'Só exibe refeiçoes sem lactose',
                  settings!.isLactoseFree,
                  (value) => setState(
                    () {
                      settings!.isLactoseFree = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeiçoes Vegana',
                  settings!.isVegan,
                  (value) => setState(
                    () {
                      settings!.isVegan = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeiçoes Vegetariana',
                  settings!.isVegetarian,
                  (value) => setState(
                    () {
                      settings!.isVegetarian = value;
                    },
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
