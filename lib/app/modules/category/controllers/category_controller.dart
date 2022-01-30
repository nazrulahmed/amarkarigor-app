import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/global/data/model/sub_category.dart';
import 'package:amar_karigor/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late final arguments;
  var categoryName = 'loading...'.obs;
  List<Service> servicesInCategory = [];
  List<SubCategory> subCategories = [];
  
  int selectedSubCategoryId = 0;
  HomeController _homeController = Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    arguments = Get.arguments;
    int id = arguments['id'];
    categoryName.value = arguments['name'];

    servicesInCategory = _homeController.getServicesByCatId(id);
    subCategories = _homeController.getSubCategoriesByCatId(id);
   
    update();
  }

  @override
  void onClose() {}

  void changeSelectedSubCategory(int id) {
    selectedSubCategoryId = id;
    
    servicesInCategory = _homeController.getServicesBySubCatId(id);
    print(servicesInCategory.length);
    update();
  }
}
