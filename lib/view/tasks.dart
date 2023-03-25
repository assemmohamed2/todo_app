import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/view/utils/themes.dart';
import '../features/todo/widgets/delete_task_dialog.dart';
import '../features/todo/widgets/update_task_dialog.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final fireStore = FirebaseFirestore.instance;
  bool showTasks = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: fireStore.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          } else {
            showTasks = snapshot.data!.docs.isNotEmpty;
            return showTasks
                ?  ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                Color taskColor = AppColors.blueShadeColor;
                var taskType = data['taskType'];
                if (taskType != null) {
                  if (taskType == 'Learning') {
                    taskColor = AppColors.salmonColor;
                  } else if (taskType == 'Working') {
                    taskColor = AppColors.greenShadeColor;
                  }
                  else if (taskType == 'Fun') {
                    taskColor = AppColors.redShadeColor;
                  }
                  else if (taskType == 'Sports') {
                    taskColor = AppColors.redShadeColor;
                  }
                }
                return Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 20,
                      height: 20,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: taskColor,
                      ),
                    ),
                    title: Text(data['taskName'] ?? ''),
                    subtitle: Text(data['taskDesc'] ?? ''),
                    isThreeLine: true,
                    trailing: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'edit',
                            child: const Text(
                              'Edit',
                              style: TextStyle(fontSize: 13.0),
                            ),
                            onTap: () {
                              String taskId = data['id'] != null ? data['id'] : '';
                              String taskName = (data['taskName']!= null ?data['taskName']: '');
                              String taskDesc = (data['taskDesc']!= null ?data['taskDesc']:'');
                              String taskType = (data['taskType']!= null ?data['taskType']:  '');
                              Future.delayed(
                                const Duration(seconds: 0),
                                    () => showDialog(
                                  context: context,
                                  builder: (context) => UpdateTaskAlertDialog(
                                    taskId: taskId,
                                    taskName: taskName,
                                    taskDesc: taskDesc,
                                    taskType: taskType,
                                  ),
                                ),
                              );
                            },

                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: const Text(
                              'Delete',
                              style: TextStyle(fontSize: 13.0),
                            ),
                            onTap: (){
                              String taskId = (data['id']);
                              String taskName = (data['taskName']);
                              Future.delayed(
                                const Duration(seconds: 0),
                                    () => showDialog(
                                  context: context,
                                  builder: (context) => DeleteTaskDialog(taskId: taskId, taskName:taskName),
                                ),
                              );
                            },
                          ),
                        ];
                      },
                    ),
                    dense: true,
                  ),
                );
              }).toList(),
            )
              :  Center(child:Lottie.network(
                'https://assets8.lottiefiles.com/private_files/lf30_cgfdhxgx.json'),);
          }
        },
      ),
    );
  }
}