import 'package:to_do_app/datasources/local/database_types.dart';

class TodoEntity {


  static final String tableName = "todo";

  static final String fieldNameId = "_id";
  static final String fieldNameType = "type";
  static final String fieldNameTitle = "title";
  static final String fieldNameDescription = "description";
  static final String fieldNameDateTime = "datetime";
  static final String fieldNameIsDone = "isDone";


  static final String createTableString = '''
        CREATE TABLE $tableName(
        $fieldNameId ${DatabaseTypes.idAutoIncrement},
        $fieldNameType ${DatabaseTypes.booleanNotNull},
        $fieldNameTitle ${DatabaseTypes.textTypeNotNull},
        $fieldNameDescription ${DatabaseTypes.textTypeNotNull},
        $fieldNameDateTime ${DatabaseTypes.textTypeNotNull},
        $fieldNameIsDone ${DatabaseTypes.booleanNotNull}
      )
  ''';

  final int id;
  final int type;
  final String title;
  final String description;
  final String dateTime;
  final int isDone;

  TodoEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone
  });


  Map<String, dynamic> toMap() {
    return {
      fieldNameId : this.id,
      fieldNameDateTime: this.dateTime,
      fieldNameDescription: this.description,
      fieldNameIsDone: this.isDone,
      fieldNameTitle: this.title,
      fieldNameType: this.type
    };
  }

  static TodoEntity fromMap(Map<String, dynamic> map) {
    return TodoEntity(
        id: map[fieldNameId],
        type: map[fieldNameType],
        title: map[fieldNameTitle],
        description: map[fieldNameDescription],
        dateTime: map[fieldNameDateTime],
        isDone: map[fieldNameIsDone]
    );
  }

}