import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/domain/blocs/login/login_bloc.dart';

class ChangeLoginMethod extends StatelessWidget {
  ChangeLoginMethod(
      {Key? key, required Function onPressed, required List<Widget> children})
      : super(key: key);
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bạn chưa có tài khoản?',
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 52, 52, 52),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend Deca'),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Tạo tài khoản',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 218, 24, 24),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend Deca'),
                ),
              ),
              const Text(' or ',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 245, 216, 2),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend Deca')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<LoginBloc>(context).add(
                      const LoginWithGooglePressed(),
                    );
                  },
                  child: RichText(
                      text: TextSpan(
                          text: 'Đăng nhập bằng Google',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 218, 24, 24),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lexend Deca'),
                          children: [
                        WidgetSpan(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: MyAppIcons.googleIcon,
                        ))
                      ])),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {}
  }
}
