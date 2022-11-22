import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';

class AddWallet extends StatelessWidget {
  const AddWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData.fallback(),
        backgroundColor: Colors.white,
        title: const Text(
          'Liên kết ví',
          style: TextStyle(color: MyAppColors.gray700),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: MyAppColors.gray400)),
            ),
            child: ListTile(
              onTap: () {},
              leading: MyAppIcons.bank,
              title: Text('Tài khoản ngân hàng'),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: MyAppColors.gray400)),
            ),
            child: ListTile(
              onTap: () {},
              leading: MyAppIcons.creditCard,
              title: Text('Thẻ tín dụng'),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: MyAppColors.gray400)),
            ),
            child: ListTile(
              onTap: () {},
              leading: MyAppIcons.smartPhone,
              title: Text('Ví điện tử'),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: MyAppColors.gray400)),
            ),
            child: ListTile(
              onTap: () {},
              leading: MyAppIcons.development,
              title: Text('Chứng khoán'),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildListItem() {
    return Container(
      decoration: const BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1.0, color: MyAppColors.gray400)),
      ),
      child: ListTile(
        onTap: () {},
        leading: MyAppIcons.bank,
        title: Text('Tài khoản ngân hàng'),
      ),
    );
  }
}
