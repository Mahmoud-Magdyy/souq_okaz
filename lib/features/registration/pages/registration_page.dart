import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/styles/my_colors.dart';
import '../../../core/shared/styles/text_styles.dart';
import '../../../core/shared/widgets/my_button.dart';
import '../../../core/shared/widgets/my_text_field.dart';
import '../../../core/utils/my_validators.dart';
import '../../login/pages/login_page.dart';
import '../controllers/registration_controller.dart';


class RegistrationPage extends  GetView<RegistrationController> {
 const  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegistrationController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/splash.gif"), fit: BoxFit.cover,),
            ),
          ),
          SafeArea (
            child:Obx(
              ()=> controller.isLoading.value? const Center(child: CircularProgressIndicator(),):
              SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 34.0,vertical: 32),
                            child: Text("Register",style: MyTextStyles.hOneTextStyle,),
                          ),
                          const SizedBox(height: 32,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 8),
                            child: MyTextField(controller: controller.nameController,
                              validator: MyValidators.notEmptyValidator,
                              label: "Name",),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 8),
                          child: MyTextField(controller: controller.emailController,
                            label: "Email",
                            textInputType: TextInputType.emailAddress,
                            validator: MyValidators.emailValidator,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 8),
                          child: MyTextField(controller: controller.passwordController,
                            textInputType: TextInputType.visiblePassword,
                            validator: MyValidators.passwordValidator,
                            label: "Password",),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: MyButton(text: "Sign Up", withArrow: false,
                              onPressed:()=> controller.register() ),
                        ),
                        const SizedBox(height: 30,),
                        Row (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an Account?",style: TextStyle(color: Colors.white),),
                            TextButton(onPressed: (){
                              Get.off(()=> LoginPage());
                            }, child: const Text("SIGN IN",style: TextStyle(color: MyColors.primaryColor))),
                          ],
                        )
                      ],
                    ),
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
