class ToDoItemModel {
  String? title;
  String? priority;
  String? date;
  bool? isDone = false;

  ToDoItemModel({this.title, this.priority, this.date, this.isDone});

  Map toJson() {
    return {
      'title': title,
      'priority': priority,
      'date': date,
      'isDone': isDone
    };
  }

  ToDoItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    priority = json['priority'];
    date = json['date'];
    isDone = json['isDone'];
  }
}
