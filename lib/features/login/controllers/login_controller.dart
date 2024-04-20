import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/models/user_model.dart';
import '../../../core/shared/repositories/user_repository.dart';
import '../../home/pages/home_page.dart';

class LoginController extends GetxController {

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final isLoading = false.obs;
  late  GlobalKey<FormState> formKey;
  @override
  void onInit() {
    formKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> login () async {
    if (formKey.currentState!.validate() ){
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.signInWithEmailAndPassword
          (email: emailController.text, password: passwordController.text);
        UserModel userModel = await Get.find<UserRepository>().getUserByEmail(emailController.text);
        Get.offAll( HomePage(userModel: userModel,));
      } on FirebaseAuthException catch(e){
        Get.snackbar("Error!", e.message??"",backgroundColor: Colors.redAccent,colorText: Colors.white);
      } catch(e,c){
        print(c);
        Get.snackbar("Error!", e.toString());
      }
      isLoading.value = false;
    }
  }
}