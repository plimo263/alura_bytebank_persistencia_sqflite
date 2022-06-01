import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contacts.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tablesql = 'CREATE TABLE $_tableName ('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER'
      ')';

  Future<int> save(Contacts contact) async {
    // Obter a referencia ao banco de dados
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert('contacts', contactMap);
  }

  Map<String, dynamic> _toMap(Contacts contact) {
    final Map<String, dynamic> contactMap = {};
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

//
  Future<List<Contacts>> findAll() async {
    // Obter a referencia ao banco de dados
    final Database db = await getDatabase();
    //
    final List<Map<String, dynamic>> rows = await db.query('contacts');
    return _toList(rows);
  }

  List<Contacts> _toList(List<Map<String, dynamic>> rows) {
    // Criando uma lista de contacts
    List<Contacts> contacts = [];
    for (var row in rows) {
      final Contacts contact = Contacts(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contacts.add(contact);
    }

    return contacts;
  }
}
