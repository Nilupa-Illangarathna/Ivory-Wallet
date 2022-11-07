import '../../Data_Load_From_DB/notes.dart';
import '../../Data_Load_From_DB/IncomeCategoryDB/IncomeCategory_LocalDatabase.dart';


Future IncomeCategory_updateNote(Note SendIn,String Tablename) async {
  await IncomeCategoryDatabase.instance.updateBudgetInstance(SendIn,Tablename);
}

Future IncomeCategory_addNote(Note SendIn,String Tablename) async {
  await IncomeCategoryDatabase.instance.createBudgetInstance(SendIn,Tablename);
}