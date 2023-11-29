import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/controllers/login_provider.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_bar.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';
import '../onboarding/widgets/page_three.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
      builder: (context, signupNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                text: "SignUp",
                child: GestureDetector(
                    onTap: () {
                      Get.to(() => const PageThree());
                    },
                    child: Icon(Icons.arrow_left)),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  HeightSpacer(size: 50),
                  ReusableText(
                      text: "Hello Welcome!",
                      style: appstyle(30, Color(kDark.value), FontWeight.w600)),
                  ReusableText(
                      text: "fill the details to signup for an account ",
                      style: appstyle(16, Color(kDark.value), FontWeight.w600)),
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: name,
                    KeyboardType: TextInputType.emailAddress,
                    hintText: "Full Name",
                    validator: (email) {
                      if (email!.isEmpty || email.contains("@")) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 18),
                  CustomTextField(
                    controller: email,
                    KeyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Please enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 18),
                  CustomTextField(
                    controller: password,
                    KeyboardType: TextInputType.emailAddress,
                    hintText: "Password",
                    obscureText: signupNotifier.obscureText,
                    validator: (password) {
                      if (signupNotifier.PasswordValidator(password ?? '')) {
                        return "Please enter a valid password with atleast one uppercase, one lowercase, one digit and length of 8 charachter ";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signupNotifier.obscureText =
                            !signupNotifier.obscureText;
                      },
                      child: Icon(
                        signupNotifier.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(kDark.value),
                      ),
                    ),
                  ),
                  const HeightSpacer(size: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginPage());
                      },
                      child: ReusableText(
                        text: "Login",
                        style:
                            appstyle(14, Color(kDark.value), FontWeight.w500),
                      ),
                    ),
                  ),
                  const HeightSpacer(
                    size: 40,
                  ),
                  CustomButton(
                    onTap: () {},
                    text: "Sign up",
                  ),
                ],
              ),
            ));
      },
    );
  }
}
