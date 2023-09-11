import 'package:sqflite/sqflite.dart';
import 'package:sqlite_database_provider/database/db_controller.dart';
import 'package:sqlite_database_provider/database/db_operations.dart';
import 'package:sqlite_database_provider/models/contact.dart';

class ContactDbController implements DbOperations<Contact> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Contact object) async {
    // INSERT INTO contacts (name,phone) VALUES ('Ali','3334')
    int newRowId = await _database.insert('contacts', object.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    // DELETE FROM contacts
    // DELETE FROM contacts WHERE id = 1
    int numOfDeletedRows = await _database.delete(
        'contacts',
        where: 'id = ?',
        whereArgs: [id]
    );
    return numOfDeletedRows > 0;
  }

  @override
  Future<List<Contact>> read() async {
    // SELECT * FROM contacts
    List<Map<String, dynamic>> rowsMap = await _database.query('contacts');
    return rowsMap.map((rowMap) => Contact.fromMap(rowMap)).toList();

  }

  @override
  Future<Contact?> show(int id) async {
    // SELECT * FROM contacts WHERE id = ?
    List<Map<String, dynamic>> rowsMap =
    await _database.query('contacts', where: 'id = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Contact.fromMap(rowsMap.first) : null;
    /*
    if(rows.isNotEmpty){
      return Contact.fromMap(rows.first);
    }
    */
  }

  @override
  Future<bool> update(Contact object) async {
    // UPDATE contact SET name = 'jjj', phone = '8789'
    // UPDATE contact SET name = 'jjj', phone = '8789' WHERE id = 1
    int numOfUpdatedRows = await _database.update(
        'contacts', object.toMap(), where: 'id = ?', whereArgs: [object.id]);
    return numOfUpdatedRows > 0;
  }
}
