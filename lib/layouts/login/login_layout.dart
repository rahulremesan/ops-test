import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/login_with_button.dart';
import 'package:styria_flutter_web/design_system/atoms/carousel/login_carousel.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/custom_checkbox.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_input_field.dart';
// import 'package:styria_flutter_web/design_system/atoms/navigations/side_navigation.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class LoginLayout extends StatefulWidget {
  final Color primaryColor;
  LoginLayout({super.key, this.primaryColor = AppColors.brandBlue});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  int selectedOption = 0;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? usernameError;
  String? passwordError;
  bool rememberMe = false; // Remember Me state

  void validateAndLogin() {
    setState(() {
      usernameError = null;
      passwordError = null;
    });

    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Validation
    bool isValid = true;

    if (username.isEmpty) {
      usernameError = 'Username cannot be empty';
      isValid = false;
    }

    if (password.isEmpty) {
      passwordError = 'Password cannot be empty';
      isValid = false;
    }

    if (!isValid) {
      setState(() {});
      return;
    }

    print(
        'Username: "$username", Password: "$password", Remember Me: $rememberMe');
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    bool isMobile = MediaQuery.of(context).size.width < 600;

    Widget logoAndCarousel = Container(
      color: AppColors.brandBlueSecondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: isMobile ? 60 : 0,
            ),
            SvgPicture.asset('assets/logo/styria.svg'),
            SizedBox(height: isMobile ? 50 : 100),
            LoginCarousel(
              activeColor: widget.primaryColor,
              inactiveColor: AppColors.nickel,
            ),
            SizedBox(height: isMobile ? 50 : 0),
          ],
        ),
      ),
    );

    Widget loginForm = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: isMobile ? 30 : 0,
            ),
            Text(
              'Welcome back',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: customTypography.title4SemiBold.fontFamily,
                fontSize: customTypography.title4SemiBold.fontSize,
                fontWeight: customTypography.title4SemiBold.fontWeight,
                color: AppColors.blackV1,
                letterSpacing: 0,
              ),
            ),
            Text(
              'Login to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: customTypography.body2Regular.fontFamily,
                fontSize: customTypography.body2Regular.fontSize,
                fontWeight: customTypography.body2Regular.fontWeight,
                color: AppColors.blackV1,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 57),
            PrimaryInputField(
              controller: usernameController,
              obscureText: false,
              placeholder: 'Type here',
              labelText: 'Username',
              inputFieldType: 'login',
            ),
            if (usernameError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  usernameError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 24),
            PrimaryInputField(
              controller: passwordController,
              obscureText: true,
              placeholder: 'Type here',
              labelText: 'Password',
              inputFieldType: 'login',
            ),
            if (passwordError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  passwordError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            // Remember Me Checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckbox(
                  label: 'Remember me',
                  value: rememberMe,
                  onChanged: (bool? newValue) {
                    setState(() {
                      rememberMe = newValue ?? false;
                    });
                  },
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontFamily: customTypography.subTitle1.fontFamily,
                    fontSize: customTypography.subTitle1.fontSize,
                    fontWeight: customTypography.subTitle1.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                    letterSpacing: 0,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 540,
              height: 54,
              child: ElevatedButton(
                onPressed: () => context.go(AppRoute.home),
                // validateAndLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text('Login',
                    style: TextStyle(
                      fontFamily: customTypography.title1Regular.fontFamily,
                      fontSize: customTypography.title1Regular.fontSize,
                      fontWeight: customTypography.title1Regular.fontWeight,
                      color: Colors.white,
                      letterSpacing: 0,
                    )),
              ),
            ),
            const SizedBox(
              height: 39,
            ),
            Text('Or login with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: customTypography.subTitle1.fontFamily,
                  fontSize: customTypography.subTitle1.fontSize,
                  fontWeight: customTypography.subTitle1.fontWeight,
                  color: AppColors.luckyGrey,
                  letterSpacing: 0,
                )),
            const SizedBox(
              height: 40,
            ),
            LoginWithButton(onPressed: () {}, variant: 'google'),
            const SizedBox(
              height: 24,
            ),
            LoginWithButton(onPressed: () {}, variant: 'microsoft'),
            SizedBox(
              height: isMobile ? 50 : 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made with love by',
                  style: TextStyle(
                    fontFamily: customTypography.body4Regular.fontFamily,
                    fontSize: customTypography.body4Regular.fontSize,
                    fontWeight: customTypography.body4Regular.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/logo/Logo_Tarento.svg')
              ],
            ),
            SizedBox(
              height: isMobile ? 30 : 0,
            )
          ],
        ),
      ),
    );

    return isMobile
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logoAndCarousel,
                // const SizedBox(height: 32),
                loginForm,
              ],
            ),
          )
        : Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: logoAndCarousel),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.neutralGray3,
                  child: Center(child: loginForm),
                ),
              ),
            ],
          );
  }
}
