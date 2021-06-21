import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _creatItem(IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Lets Go Kitchen',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          _creatItem(Icons.restaurant, 'Meals',
              () => Navigator.of(context).pushNamed(AppRoutes.Home)),
          _creatItem(
              Icons.settings,
              'Settings',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.Settings)),
        ],
      ),
    );
  }
}
