import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/view/utils/themes.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final List<String> taskType = ['Learning', 'Working', 'Fun', 'Sports'];
  late String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: Text(
        'New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: mainColor),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Task',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon:  Icon(CupertinoIcons.square_list, color:mainColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Description',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon:  Icon(CupertinoIcons.bubble_left_bubble_right, color: mainColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(CupertinoIcons.tag, color: mainColor),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Add a task type',
                        style: TextStyle(fontSize: 14),
                      ),

                      items: taskType
                          .map(
                            (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (String? value) => setState(() {
                        if (value != null) selectedValue = value;
                      },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;
            final taskType = selectedValue;
            _addTasks(taskName: taskName, taskDesc: taskDesc, taskType: taskType);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Future _addTasks({required String taskName, required String taskDesc, required String taskType}) async {
    DocumentReference docRef = await FirebaseFirestore.instance.collection('tasks').add(
      {
        'taskName': taskName,
        'taskDesc': taskDesc,
        'taskType': taskType,
      },
    );
    String taskId = docRef.id;
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update(
      {'id': taskId},
    );
    _clearAll();
  }

  void _clearAll() {
    taskNameController.text = '';
    taskDescController.text = '';
  }
}