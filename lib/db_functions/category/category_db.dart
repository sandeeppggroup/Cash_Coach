import 'package:money_management/models/category/category_model.dart';

abstract class CategoryDbFunctions {
  List<CategoryModel> getCategories();
  Future <void> insertCateory(CategoryModel value); 
}
