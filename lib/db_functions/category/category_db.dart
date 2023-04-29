import 'package:money_management/models/category/category_model.dart';

abstract class CategoryDbFunctions {
  List<CategoryModel> getCategories();
  Future <void> insertCategory(CategoryModel value); 
}

class CategoryDB implements CategoryDbFunctions{
  
   @override
  List<CategoryModel> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
 @override
 Future<void> insertCategory(CategoryModel value)async{
  
 }
 
}