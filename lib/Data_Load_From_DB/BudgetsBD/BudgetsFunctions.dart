import '../../Data_Load_From_DB/notes.dart';
import '../../Data_Load_From_DB/BudgetsBD/Budgets_LocalDatabase.dart';


Future Budgets_updateNote(Note SendIn,String Tablename) async {
  await BudgetsDatabase.instance.updateBudgetInstance(SendIn,Tablename);
}

Future Budgets_addNote(Note SendIn,String Tablename) async {
  await BudgetsDatabase.instance.createBudgetInstance(SendIn,Tablename);
}