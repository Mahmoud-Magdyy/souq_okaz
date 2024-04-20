import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/styles/my_colors.dart';
import '../../../core/shared/styles/text_styles.dart';
import '../../../core/shared/widgets/my_button.dart';
import '../../../core/shared/widgets/my_text_field.dart';
import '../../../core/utils/my_validators.dart';
import '../../registration/pages/registration_page.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash.gif"),
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
                        height: 92,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 34.0, vertical: 32),
                        child: Text(
                          "Login",
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
                          label: "Email",
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
                          label: "Password",
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(
                          () => controller.isLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : MyButton(
                                  text: "Sign In",
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
                          const Text(
                            "Don’t have an Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.off(() => const RegistrationPage());
                              },
                              child: const Text("SIGN UP",
                                  style:
                                      TextStyle(color: MyColors.primaryColor))),
                        ],
                      )
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
