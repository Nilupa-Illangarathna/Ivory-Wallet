import '../../Data_Load_From_DB/notes.dart';
import '../../Data_Load_From_DB/ExpenseCategoryDB/ExpenseCategory_LocalDatabase.dart';



Future ExpenseCategory_updateNote(Note SendIn,String Tablename) async {
  await ExpenseCategoryDatabase.instance.updateBudgetInstance(SendIn,Tablename);
}

Future ExpenseCategory_addNote(Note SendIn,String Tablename) async {
  await ExpenseCategoryDatabase.instance.createBudgetInstance(SendIn,Tablename);
}