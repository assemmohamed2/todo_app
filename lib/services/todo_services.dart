import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo.dart';

class ToDoService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ToDo>> getToDoList() async {
    QuerySnapshot querySnapshot =
    await _firestore.collection('todos').get();
    List<ToDo> todoList = [];
    querySnapshot.docs.forEach((doc) {
      ToDo task = ToDo.fromJson(doc.data() as Map<String, dynamic>);
      todoList.add(task);
    });
    return todoList;
  }

  Future<void> addTask(ToDo task) async {
    await _firestore.collection('todos').add(task.toJson());
  }

  Future<void> updateTask(ToDo task, String taskId) async {
    await _firestore.collection('todos').doc(taskId).update(task.toJson());
  }




  Future<void> deleteTask(String taskId) async {
    await _firestore.collection('todos').doc(taskId).delete();
  }
}
