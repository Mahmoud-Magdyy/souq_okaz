import 'package:get/get.dart';

import '../repositories/user_repository.dart';

class SingletonInitializer {
    void initialize (){
      Get.put(UserRepository(),permanent: true);
    }
}