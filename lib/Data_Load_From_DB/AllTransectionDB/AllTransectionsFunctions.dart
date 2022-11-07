import '../../Data_Load_From_DB/notes.dart';
import '../../Data_Load_From_DB/AllTransectionDB/AllTransections_LocalDatabase.dart';


Future AllTransections_updateNote(Note SendIn,String Tablename) async {
  await AllTransectionsDatabase.instance.updateBudgetInstance(SendIn,Tablename);
}

Future AllTransections_addNote(Note SendIn,String Tablename) async {
  await AllTransectionsDatabase.instance.createBudgetInstance(SendIn,Tablename);
}

Future AllTransections_deleteNote(int id,String tablename) async {
  await AllTransectionsDatabase.instance.delete(id,tablename);
}