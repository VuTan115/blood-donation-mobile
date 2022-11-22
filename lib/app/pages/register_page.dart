import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/components/widgets/ChangeLoginMethod.dart';
import 'package:personal_financial_management/app/utils/assets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: MyAppColors.white000,
          elevation: 0,
          child: SizedBox(
            height: 111,
            child: SvgPicture.asset(
              BackgroundImages.foregroundImagesURL,
              fit: BoxFit.fill,
              width: 1000,
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _logo(),
                const Text(
                  'Đăng Ký',
                  style: TextStyle(
                      fontSize: 42,
                      color: Color.fromRGBO(34, 73, 87, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend Deca'),
                ),
                const SizedBox(
                  height: 34,
                ),
                const Text(
                  'Tạo tài khoản mới',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      wordSpacing: 1,
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(34, 73, 87, 1),
                      fontFamily: 'Lexend Deca'),
                ),
                Container(
                  width: 297,
                  height: 45,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    maxLength: 30,
                    smartQuotesType: SmartQuotesType.disabled,
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        counterText: '',
                        hoverColor: MyAppColors.gray300,
                        fillColor: MyAppColors.gray200,
                        labelText: "Số điện thoại hoặc email",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: MyAppColors.gray300,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 218, 24, 24)),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 218, 24, 24),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend Deca'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),
                Container(
                  width: 297,
                  height: 45,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    maxLength: 30,
                    smartQuotesType: SmartQuotesType.disabled,
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        counterText: '',
                        hoverColor: MyAppColors.gray300,
                        fillColor: MyAppColors.gray200,
                        labelText: "Mât khẩu",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: MyAppColors.gray300,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 218, 24, 24)),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 218, 24, 24),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend Deca'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),
                Container(
                  width: 297,
                  height: 45,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    maxLength: 30,
                    smartQuotesType: SmartQuotesType.disabled,
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        counterText: '',
                        hoverColor: MyAppColors.gray300,
                        fillColor: MyAppColors.gray200,
                        labelText: "Nhập lại mât khẩu",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: MyAppColors.gray300,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 218, 24, 24)),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 218, 24, 24),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend Deca'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ChangeLoginMethod(onPressed: () {}, children: []),
            const SizedBox(
              height: 37,
            ),
            Center(
              child: LimitedBox(
                maxWidth: 300,
                maxHeight: 111,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 218, 24, 24),
                    alignment: Alignment.center,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(34, 73, 87, 1),
                        fontFamily: 'Lexend Deca',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        child: MyAppIcons.logo,
        height: 72,
        width: 72,
      ),
    );
  }
}
