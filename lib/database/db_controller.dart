// To create and control db
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static final DbController _instance = DbController._internal();
  late Database _database;

  DbController._internal();

  factory DbController() {
    return _instance;
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    //جلب مسارات التخزين لكل بيئة عمل على حدة(بمساعدة مكتبة path_provider)  -1
    Directory directory = await getApplicationDocumentsDirectory();
    //إدارة المسارات والتحكم فيها (بمساعدة مكتبة path)   -2
    // إنشاء ملف  db اسمه app_db.sql في هذا المسار directory.path الذي تم جلبه من خطوة 1
    String path = join(directory.path, 'app_db.sql');

    //3- التعامل مع ال database
    // هي دالة عامة كدالة print (موجودة بكل مكان)
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute('Create Table contacts (' // كل جدول في DB يقابله model لذلك انشأنا contact file.
            'id INT PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'phone TEXT NOT NULL'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
