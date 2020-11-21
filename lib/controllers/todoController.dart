import 'package:get/get.dart';
import 'package:pokedex/controllers/authController.dart';
import 'package:pokedex/models/todo.dart';
import 'package:pokedex/services/database.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }
}