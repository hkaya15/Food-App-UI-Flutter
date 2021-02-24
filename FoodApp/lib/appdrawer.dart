import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home_rounded,
            text: 'Ana Sayfa',
          ),
          _createDrawerItem(
            icon: Icons.wallet_travel_rounded,
            text: 'Cüzdan',
          ),
          _createDrawerItem(
            icon: Icons.history_toggle_off_rounded,
            text: 'Sipariş Detayı',
          ),
          _createDrawerItem(icon: Icons.code_rounded, text: 'Promosyon Kodu'),
          _createDrawerItem(icon: Icons.favorite_rounded, text: 'Favoriler'),
          _createDrawerItem(
              icon: Icons.question_answer_rounded, text: 'S.S.S.'),
          _createDrawerItem(icon: Icons.phone, text: 'Destek'),
          _createDrawerItem(icon: Icons.settings, text: 'Ayarlar'),
          Divider(),
          _createDrawerItem(icon: Icons.logout, text: 'Çıkış'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            profilePhoto(),
            Divider(
              indent: 20,
            ),
            profileDescription(),
          ],
        ),
      ),
    );
  }

  Text profileDescription() => Text(
        "Merhaba,\n Hüseyin",
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      );

  Container profilePhoto() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/img/profile.jpg'),
          )),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
