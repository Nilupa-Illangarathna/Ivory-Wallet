import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../notes.dart';


class IncomeCategoryDatabase{
  static final IncomeCategoryDatabase instance = IncomeCategoryDatabase._init();

  static Database? _database;

  IncomeCategoryDatabase._init();

  Future<Database> get database async{

    _database = await _initDB('IncomesCaegories.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }


  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''           
  CREATE TABLE $tableIncomesCaegories (
  ${NoteFields.ID          } $idType, 
  ${NoteFields.CategoryName} $textType,
  ${NoteFields.CategoryType} $textType,
  ${NoteFields.CurrentSum  } $textType,
  ${NoteFields.IconAddress } $textType,
  ${NoteFields.ButtonColor } $textType,
  ${NoteFields.EndColor } $textType,
  ${NoteFields.TransectionAmount} $textType,
  ${NoteFields.IsRecurring} $textType,
  ${NoteFields.AccountData  } $textType,
  ${NoteFields.Date } $textType,
  ${NoteFields.Time } $textType,
  ${NoteFields.IsFavorite } $textType,
  ${NoteFields.IsBadTransection } $textType
  )
  ''');

  }


  Future<Note> createBudgetInstance(Note Transection,String tablename) async {
    final db = await instance.database;
    final id = await db.insert(tablename, Transection.toJson());
    return Transection.copy(ID: id);
  }

  Future<Note> readBudgetInstence(int id,String tablename) async {
    final db = await instance.database;

    final maps = await db.query(
      tablename,
      columns: NoteFields.values,
      where: '${NoteFields.ID} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllBudgetsNotes(String tablename) async {
    final db = await instance.database;

    final orderBy = '${NoteFields.ID} ASC';

    final result = await db.query(tablename, orderBy: orderBy);

    return result.map((json) => Note.fromJson(json)).toList();
  }


  Future<int> updateBudgetInstance(Note note,String tablename) async {
    final db = await instance.database;

    return db.update(
      tablename,
      note.toJson(),
      where: '${NoteFields.ID} = ?',
      whereArgs: [note.ID],
    );
  }

  Future<int> delete(int id,String tablename) async {
    final db = await instance.database;

    return await db.delete(
      tablename,
      where: '${NoteFields.ID} = ?',
      whereArgs: [id],
    );
  }


  Future close() async {
    final db = await instance.database;

    db.close();
  }

}