import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/models/user_model.dart';
import '../../../core/shared/repositories/user_repository.dart';
import '../../home/pages/home_page.dart';

class RegistrationController extends GetxController {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final isLoading = false.obs;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    formKey = GlobalKey();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        await FirebaseFirestore.instance.collection("users").add({
          "name": nameController.text,
          "email": emailController.text,
        });
        UserModel userModel = await Get.find<UserRepository>()
            .getUserByEmail(emailController.text);
        Get.offAll(HomePage(
          userModel: userModel,
        ));
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error!", e.message ?? "",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      } on FirebaseException catch (e) {
        Get.snackbar("Error!", e.message ?? "",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      } catch (e) {
        Get.snackbar("Error!", e.toString());
      }
      isLoading.value = false;
    }
  }
}
