import 'package:flutter/material.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/domain/blocs/auth_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.person, text: 'Profile', onTap: () {}),
          Divider(),
          _createDrawerItem(
              icon: Icons.account_box, text: 'Tài khoản', onTap: () {}),
          _createDrawerItem(icon: Icons.stars, text: 'Trợ giúp', onTap: () {}),
          _createDrawerItem(
              icon: Icons.logout,
              text: 'Đăng xuất',
              onTap: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.bug_report, text: 'Báo cáo', onTap: () {}),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/profile.jpg'))),
        child: Stack(children: const <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text('Nguyễn Văn A',
                  style: TextStyle(
                      color: MyAppColors.gray700,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600))),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Colors.black87.withOpacity(0.65)),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
