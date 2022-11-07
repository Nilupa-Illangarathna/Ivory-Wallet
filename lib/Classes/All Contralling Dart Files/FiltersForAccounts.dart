import 'category_types.dart';
import 'TransectionsClass.dart';

class CurrentFilters{
  String AccountType;
  String IncomeOrExpense;
  DateTime StartingDate;
  DateTime EndingDate;
  String CurrentCurrencyType;
  double TransectionsTilesScaleFactor;
  String ShowFavoritesOrBadSets;
  int StartDaysPastFromNow;
  double elevationvalue;
  bool FingerPrintOn;
  bool FirstTime;


  //prediction parameters
  int how_many_Days_pastData_To_Be_Considered;
  //voiceRecognitionEnable
  bool voiceRecognitionWant;
  //Cash or Card payment check
  String Is_Cash;

  CurrentFilters(
      this.AccountType,
      this.IncomeOrExpense,
      this.StartingDate,                  //Daily or receant updates are measured from this date
      this.EndingDate,                    //Daily or receant updates are measured to this date
      this.CurrentCurrencyType,///////////////////////////////////////////////////////////////////////////////////////
      this.TransectionsTilesScaleFactor,  //1 to get the original size. to scale up high to lower low ***(Best to keep 0.8 to 1.0)
      this.ShowFavoritesOrBadSets,
      this.StartDaysPastFromNow,///////////////////////////////////////////////////////////////////////////////////////  //Bar charts are drawn this number of days past from now
      this.elevationvalue,///////////////////////////////////////////////////////////////////////////////////////
      this.FingerPrintOn,///////////////////////////////////////////////////////////////////////////////////////
      this.FirstTime,
      this.how_many_Days_pastData_To_Be_Considered,  /////////////////////////////////////////////////////////////////////////////////////  //BubbleCharts aredrawen based on this much of days past
      this.voiceRecognitionWant,        //This is in the settings to check
      this.Is_Cash,
      );
}

CurrentFilters FiltersForTheApp= CurrentFilters(
    "All Account",
    "All Types",
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    DateTime.now().add(Duration(minutes:60)),
    "Rs",
    0.92,
    "No Filters",
    30,
    3,
    false,
    true,
    7,
    false,
    "Cash",
);



//Favorites and Bad mentiones selector
List <Categories> GetFilteredTransectionsList(){
  List <Categories> tempListOfReturns=[];
  List <Categories> tempListOfReturns1=[];

  //Filtering account type
  for(int i=0;i<AllTransectionsForTheTime.length;i++){
    if(FiltersForTheApp.AccountType=="All Account" && AllTransectionsForTheTime[i].AccountData!="None"){
      tempListOfReturns.add(AllTransectionsForTheTime[i]);
    }
    else if (FiltersForTheApp.AccountType=="Card" && AllTransectionsForTheTime[i].AccountData==FiltersForTheApp.AccountType){
      tempListOfReturns.add(AllTransectionsForTheTime[i]);
    }
    else if (FiltersForTheApp.AccountType=="Cash" && AllTransectionsForTheTime[i].AccountData==FiltersForTheApp.AccountType){
      tempListOfReturns.add(AllTransectionsForTheTime[i]);
    }
  }
  //Filtering income and expenses
  for(int i=0;i<tempListOfReturns.length;i++){
    if(FiltersForTheApp.IncomeOrExpense=="All Types"){
      tempListOfReturns1.add(tempListOfReturns[i]);
    }
    else if (FiltersForTheApp.IncomeOrExpense=="Incomes" && tempListOfReturns[i].CategoryType==FiltersForTheApp.IncomeOrExpense){
      tempListOfReturns1.add(tempListOfReturns[i]);
    }
    else if (FiltersForTheApp.IncomeOrExpense=="Expenses" && tempListOfReturns[i].CategoryType==FiltersForTheApp.IncomeOrExpense){
      tempListOfReturns1.add(tempListOfReturns[i]);
    }
  }
  tempListOfReturns.clear();
  //Filtering Favorites and bad mentions
  for(int i=0;i<tempListOfReturns1.length;i++){
    if(FiltersForTheApp.ShowFavoritesOrBadSets=="No Filters"){
      tempListOfReturns.add(tempListOfReturns1[i]);
    }
    else if (FiltersForTheApp.ShowFavoritesOrBadSets=="Favorites" && tempListOfReturns1[i].IsFavorite){
      tempListOfReturns.add(tempListOfReturns1[i]);
    }
    else if (FiltersForTheApp.ShowFavoritesOrBadSets=="Warnings" && tempListOfReturns1[i].IsBadTransection){
      tempListOfReturns.add(tempListOfReturns1[i]);
    }
  }
  print(FiltersForTheApp.AccountType);
  print(FiltersForTheApp.IncomeOrExpense);
  print(FiltersForTheApp.ShowFavoritesOrBadSets);

  tempListOfReturns=tempListOfReturns.reversed.toList();
  return tempListOfReturns;
}







//to generate filtered displaying income amounts for each category
List <Categories> IncomeFilteredCategoryValuesforincomeExpenses(List <Categories> Currently_Using_Income_Categories){
  List <Categories> TempList=[];
  for(int i=0;i<Currently_Using_Income_Categories.length;i++)
  {
    double tempSum=0;
    for(int j=0;j<AllTransectionsForTheTime.length;j++)
    {
      if(FiltersForTheApp.AccountType =='All Account')
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Income_Categories[i].CategoryName && DateTime.utc(DateTime.now().year, DateTime.now().month, 1).isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date))
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
      else
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Income_Categories[i].CategoryName && DateTime.utc(DateTime.now().year, DateTime.now().month, 1).isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date) && AllTransectionsForTheTime[j].AccountData==FiltersForTheApp.AccountType)
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
    }
    TempList.add(Categories(
      Currently_Using_Income_Categories[i].ID,
      Currently_Using_Income_Categories[i].CategoryName,
      Currently_Using_Income_Categories[i].CategoryType,
      tempSum,
      Currently_Using_Income_Categories[i].IconAddress,
      Currently_Using_Income_Categories[i].ButtonColor,
      Currently_Using_Income_Categories[i].EndColor,
      tempSum,
      Currently_Using_Income_Categories[i].IsRecurring,
      Currently_Using_Income_Categories[i].AccountData,
      Currently_Using_Income_Categories[i].Date,
      Currently_Using_Income_Categories[i].Time,
      false,
      false,
    ));
  }
  return TempList;
}

//to generate filtered displaying income amounts for each category per day
List <Categories> IncomeFilteredCategoryValues(List <Categories> Currently_Using_Income_Categories){
  List <Categories> TempList=[];
  for(int i=0;i<Currently_Using_Income_Categories.length;i++)
  {
    double tempSum=0;
    for(int j=0;j<AllTransectionsForTheTime.length;j++)
    {
      if(FiltersForTheApp.AccountType =='All Account')
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Income_Categories[i].CategoryName && FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date))
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
      else
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Income_Categories[i].CategoryName && FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date) && AllTransectionsForTheTime[j].AccountData==FiltersForTheApp.AccountType)
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
    }
    TempList.add(Categories(
      Currently_Using_Income_Categories[i].ID,
      Currently_Using_Income_Categories[i].CategoryName,
      Currently_Using_Income_Categories[i].CategoryType,
      tempSum,
      Currently_Using_Income_Categories[i].IconAddress,
      Currently_Using_Income_Categories[i].ButtonColor,
      Currently_Using_Income_Categories[i].EndColor,
      tempSum,
      Currently_Using_Income_Categories[i].IsRecurring,
      Currently_Using_Income_Categories[i].AccountData,
      Currently_Using_Income_Categories[i].Date,
      Currently_Using_Income_Categories[i].Time,
      false,
      false,
    ));
  }
  return TempList;
}


//to generate filtered displaying expense amounts for each category
List <Categories> ExpenseFilteredCategoryValuesforincomeandexpenses(List <Categories> Currently_Using_Expense_Categories){
  List <Categories> TempList=[];
  for(int i=0;i<Currently_Using_Expense_Categories.length;i++)
  {
    double tempSum=0;
    for(int j=0;j<AllTransectionsForTheTime.length;j++)
    {
      if(FiltersForTheApp.AccountType =='All Account')
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Expense_Categories[i].CategoryName && DateTime.utc(DateTime.now().year, DateTime.now().month, 1).isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date))
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
      else
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Expense_Categories[i].CategoryName && DateTime.utc(DateTime.now().year, DateTime.now().month, 1).isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date) && AllTransectionsForTheTime[j].AccountData==FiltersForTheApp.AccountType)
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
    }
    TempList.add(Categories(
      Currently_Using_Expense_Categories[i].ID,
      Currently_Using_Expense_Categories[i].CategoryName,
      Currently_Using_Expense_Categories[i].CategoryType,
      tempSum,
      Currently_Using_Expense_Categories[i].IconAddress,
      Currently_Using_Expense_Categories[i].ButtonColor,
      Currently_Using_Expense_Categories[i].EndColor,
      tempSum,
      Currently_Using_Expense_Categories[i].IsRecurring,
      Currently_Using_Expense_Categories[i].AccountData,
      Currently_Using_Expense_Categories[i].Date,
      Currently_Using_Expense_Categories[i].Time,
      false,
      false,
    ));
  }
  return TempList;
}


//to generate filtered displaying expense amounts for each category per day
List <Categories> ExpenseFilteredCategoryValues(List <Categories> Currently_Using_Expense_Categories){
  List <Categories> TempList=[];
  for(int i=0;i<Currently_Using_Expense_Categories.length;i++)
  {
    double tempSum=0;
    for(int j=0;j<AllTransectionsForTheTime.length;j++)
    {
      if(FiltersForTheApp.AccountType =='All Account')
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Expense_Categories[i].CategoryName && FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date))
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
      else
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Expense_Categories[i].CategoryName && FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[j].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[j].Date) && AllTransectionsForTheTime[j].AccountData==FiltersForTheApp.AccountType)
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
    }
    TempList.add(Categories(
      Currently_Using_Expense_Categories[i].ID,
      Currently_Using_Expense_Categories[i].CategoryName,
      Currently_Using_Expense_Categories[i].CategoryType,
      tempSum,
      Currently_Using_Expense_Categories[i].IconAddress,
      Currently_Using_Expense_Categories[i].ButtonColor,
      Currently_Using_Expense_Categories[i].EndColor,
      tempSum,
      Currently_Using_Expense_Categories[i].IsRecurring,
      Currently_Using_Expense_Categories[i].AccountData,
      Currently_Using_Expense_Categories[i].Date,
      Currently_Using_Expense_Categories[i].Time,
      false,
      false,
    ));
  }
  return TempList;
}


//to generate filtered displaying expense amounts for each category
List <Categories> ExpenseFilteredCategoryValuesForGauges(List <Categories> Currently_Using_Expense_Categories){
  List <Categories> TempList=[];
  for(int i=0;i<Currently_Using_Expense_Categories.length;i++)
  {
    double tempSum=0;
    for(int j=0;j<AllTransectionsForTheTime.length;j++)
    {
      if(FiltersForTheApp.AccountType =='All Account')
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Expense_Categories[i].CategoryName && DateTime.utc(DateTime.now().year, DateTime.now().month, 1).isBefore(AllTransectionsForTheTime[j].Date) && DateTime.now().isAfter(AllTransectionsForTheTime[j].Date))
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
      else
      {
        if(AllTransectionsForTheTime[j].CategoryName==Currently_Using_Expense_Categories[i].CategoryName && DateTime.utc(DateTime.now().year, DateTime.now().month, 1).isBefore(AllTransectionsForTheTime[j].Date) && DateTime.now().isAfter(AllTransectionsForTheTime[j].Date) && AllTransectionsForTheTime[j].AccountData==FiltersForTheApp.AccountType)
        {
          tempSum+=AllTransectionsForTheTime[j].TransectionAmount;
        }
      }
    }
    TempList.add(Categories(
      Currently_Using_Expense_Categories[i].ID,
      Currently_Using_Expense_Categories[i].CategoryName,
      Currently_Using_Expense_Categories[i].CategoryType,
      tempSum,
      Currently_Using_Expense_Categories[i].IconAddress,
      Currently_Using_Expense_Categories[i].ButtonColor,
      Currently_Using_Expense_Categories[i].EndColor,
      tempSum,
      Currently_Using_Expense_Categories[i].IsRecurring,
      Currently_Using_Expense_Categories[i].AccountData,
      Currently_Using_Expense_Categories[i].Date,
      Currently_Using_Expense_Categories[i].Time,
      false,
      false,
    ));
  }
  return TempList;
}


List <Categories> OverviewTableExpense(){

  List <Categories> ListOfTotaleOfTheMonth=ExpenseFilteredCategoryValuesforincomeandexpenses(Currently_Using_Expense_Categories);
  List <Categories> ListOfCategories=ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories);

  for(int i=0;i<ListOfCategories.length;i++){
    ListOfCategories[i].CurrentSum=ListOfTotaleOfTheMonth[i].TransectionAmount;
  }

  double TodayTotal=0;
  double AllTotal=0;

  for(int i=0;i<ListOfCategories.length;i++){
    TodayTotal+=ListOfCategories[i].TransectionAmount;
    AllTotal+=ListOfCategories[i].CurrentSum;
  }

  ListOfCategories.add(Categories(
    Currently_Using_Expense_Categories[0].ID,
    "Net Total",
    Currently_Using_Expense_Categories[0].CategoryType,
    AllTotal,
    Currently_Using_Expense_Categories[0].IconAddress,
    Currently_Using_Expense_Categories[0].ButtonColor,
    Currently_Using_Expense_Categories[0].EndColor,
    TodayTotal,
    Currently_Using_Expense_Categories[0].IsRecurring,
    Currently_Using_Expense_Categories[0].AccountData,
    Currently_Using_Expense_Categories[0].Date,
    Currently_Using_Expense_Categories[0].Time,
    false,
    false,
  ));

  return ListOfCategories;
}


List <Categories> OverviewTableIncome(){

  List <Categories> ListOfTotaleOfTheMonth=IncomeFilteredCategoryValuesforincomeExpenses(Currently_Using_Income_Categories);
  List <Categories> ListOfCategories=IncomeFilteredCategoryValues(Currently_Using_Income_Categories);

  for(int i=0;i<ListOfCategories.length;i++){
    ListOfCategories[i].CurrentSum=ListOfTotaleOfTheMonth[i].TransectionAmount;
  }

  double TodayTotal=0;
  double AllTotal=0;

  for(int i=0;i<ListOfCategories.length;i++){
    TodayTotal+=ListOfCategories[i].TransectionAmount;
    AllTotal+=ListOfCategories[i].CurrentSum;
  }

  ListOfCategories.add(Categories(
    Currently_Using_Expense_Categories[0].ID,
    "Net Total",
    Currently_Using_Expense_Categories[0].CategoryType,
    AllTotal,
    Currently_Using_Expense_Categories[0].IconAddress,
    Currently_Using_Expense_Categories[0].ButtonColor,
    Currently_Using_Expense_Categories[0].EndColor,
    TodayTotal,
    Currently_Using_Expense_Categories[0].IsRecurring,
    Currently_Using_Expense_Categories[0].AccountData,
    Currently_Using_Expense_Categories[0].Date,
    Currently_Using_Expense_Categories[0].Time,
    false,
    false,
  ));


  return ListOfCategories;
}
