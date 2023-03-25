class ToDo {
  String id;
  String title;
  String description;
  DateTime dueDate;
  bool completed;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.completed = false,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.fromMillisecondsSinceEpoch(json['dueDate']),
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'dueDate': dueDate.millisecondsSinceEpoch,
    'completed': completed,
  };
}
