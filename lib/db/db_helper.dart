import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:v_card/models/contact_model.dart';
class DbHelper{
  final String _createTableContact = ''' create table $tableContact(
    $tblContactColId integer primary key autoincrement, 
    $tblContactColName text, 
    $tblContactColMobile text,
    $tblContactColEmail text,
    $tblContactColAddress text,
    $tblContactColCompany text,
    $tblContactColDesignation text,
    $tblContactColWebsite text,
    $tblContactColImage text,
    $tblContactColFavorite text,
  ) ''';
  Future<Database> _open() async{
      final root = await getDatabasesPath();
      final dbPath = p.join(root,'contact.db');
      return openDatabase(dbPath,version: 1, onCreate: (db, version) {
        db.execute(_createTableContact);

      });
  }


  Future<int> insertContact(ContactModel contactModel) async{
      final db = await _open();
      return db.insert(tableContact, contactModel.toMap());
  }

  Future<List<ContactModel>> getAllContacts() async{
    final db = await _open();
    final  mapList = await db.query(tableContact);
    return List.generate(mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }
}