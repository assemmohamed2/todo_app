// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ToDoList extends StatefulWidget {
//   @override
//   _ToDoListState createState() => _ToDoListState();
// }
//
// class _ToDoListState extends State<ToDoList> {
//   TextEditingController _taskController = TextEditingController();
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("To-Do List"),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: _taskController,
//             decoration: InputDecoration(
//               labelText: 'Add Task',
//               contentPadding: EdgeInsets.symmetric(horizontal: 20),
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               addTask(_taskController.text);
//               _taskController.clear();
//             },
//             child: Text('Add'),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: firestore.collection('tasks').snapshots(),
//               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data?.docs.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     DocumentSnapshot doc = snapshot.data!.docs[index];
//                     return ListTile(
//                       title: Text(doc['task']),
//                       trailing: Checkbox(
//                         value: doc['completed'],
//                         onChanged: (bool? value) {
//                           updateTask(doc.id, value!);
//                         },
//                       ),
//                       onLongPress: () {
//                         deleteTask(doc.id);
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void addTask(String task) {
//     firestore.collection('tasks').add({
//       'task': task,
//       'completed': false,
//     });
//   }
//
//   void updateTask(String id, bool completed) {
//     firestore.collection('tasks').doc(id).update({'completed': completed});
//   }
//
//   void deleteTask(String id) {
//     firestore.collection('tasks').doc(id).delete();
//   }
// }
