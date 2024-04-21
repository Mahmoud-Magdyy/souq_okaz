import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okaz_souq/core/locale/app_loacl.dart';
import 'package:okaz_souq/core/utils/app_strings.dart';
import '../../../core/shared/styles/my_colors.dart';
import '../../../core/shared/styles/text_styles.dart';
import '../../../core/shared/widgets/my_button.dart';
import '../../../core/shared/widgets/my_text_field.dart';
import '../../../core/utils/my_validators.dart';
import '../../registration/pages/registration_page.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash.gif",),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 140,
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 34.0, vertical: 32),
                        child: Text(
                          AppStrings.login.trr(context),
                          style: MyTextStyles.hOneTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 34, vertical: 8),
                        child: MyTextField(
                          controller: controller.emailController,
                          label: AppStrings.email.trr(context),
                          textInputType: TextInputType.emailAddress,
                          validator: MyValidators.emailValidator,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 34, right: 34, top: 8, bottom: 0),
                        child: MyTextField(
                          controller: controller.passwordController,
                          textInputType: TextInputType.visiblePassword,
                          validator: MyValidators.passwordValidator,
                          label: AppStrings.password.trr(context),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(
                          () => controller.isLoading.value
                              ? const Center(child: CircularProgressIndicator(color: MyColors.primaryColor,))
                              : MyButton(
                                  text: AppStrings.signIn.trr(context),
                                  withArrow: false,
                                  onPressed: () => controller.login()),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            AppStrings.dontHaveAccount.trr(context),
                            style: const TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.off(() => const RegistrationPage());
                                
                              },
                              child:  Text(AppStrings.signUp.trr(context),
                                  style:
                                      const TextStyle(color: MyColors.primaryColor))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
