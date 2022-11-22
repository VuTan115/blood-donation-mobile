import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/components/images/my_images.dart';
import 'package:personal_financial_management/app/components/widgets/ListViewTitle.dart';
import 'package:personal_financial_management/app/utils/assets.dart';
import 'package:personal_financial_management/app/utils/extentsions.dart';
import 'package:personal_financial_management/domain/models/wallet.dart';

class WalletProfile extends StatefulWidget {
  const WalletProfile({Key? key, required this.walletInfo}) : super(key: key);
  final Wallet walletInfo;

  @override
  State<WalletProfile> createState() => _WalletProfileState();
}

class _WalletProfileState extends State<WalletProfile> {
  @override
  Widget build(BuildContext context) {
    print(widget.walletInfo);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyAppColors.gray050,
        iconTheme: IconThemeData.fallback(),
        titleSpacing: 0.0,
        elevation: 5,
        title: const Text("THÔNG TIN CHI TIẾT",
            style: const TextStyle(
              fontSize: 20,
              color: MyAppColors.gray700,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // wallet info
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Image.asset(ProfileImage.walletProfile),
                    title: Text(
                      widget.walletInfo.name,
                      style: const TextStyle(
                        color: MyAppColors.gray700,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: InkWell(
                        onTap: () {},
                        child: Text(widget.walletInfo.description)),
                    trailing: MyAppIcons.setting,
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Số dư',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${numberFormat.format(widget.walletInfo.amount).toString()}VNĐ",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: MyAppColors.gray800,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            _buildWalletHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletHistory() {
    return Container(
      child: Column(
        children: [
          BuildListViewTitle(
            leftTitle: 'Tháng 5',
            rightTitle: '',
          )
        ],
      ),
    );
  }
}
