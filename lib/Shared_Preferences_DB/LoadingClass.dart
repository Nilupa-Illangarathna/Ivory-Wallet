import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Classes/colors.dart';
import '../Data_Load_From_DB/notes.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';


var ColourList =ColorsClass();




class UserSecureStorage {
  static final _storage = FlutterSecureStorage();


  static Future checkFirstTimeWrite() async {
      await _storage.write(key: "CheckFirstTimeIvoryWalletMobileApp", value: "true");
      FiltersForTheApp.FirstTime=false;
  }








  static Future set_ToStringConverted_Lists(List <Categories> RespectiveList) async {
    List <Note> StringBasedList=[];
    for(int i=0;i<RespectiveList.length;i++){
      Color color = RespectiveList[i].ButtonColor;
      var hexCode = '#${color.value.toRadixString(16).substring(2, 8)}';
      Color endcolor = RespectiveList[i].EndColor;
      var endhexCode = '#${endcolor.value.toRadixString(16).substring(2, 8)}';
      Note temp = Note(
          ID: RespectiveList[i].ID,
          CategoryName: RespectiveList[i].CategoryName.toString(),
          CategoryType:RespectiveList[i].CategoryType.toString(),
          CurrentSum:RespectiveList[i].CurrentSum.toString(),
          IconAddress:RespectiveList[i].IconAddress.toString(),
          ButtonColor: hexCode,
          EndColor: endhexCode,
          TransectionAmount: RespectiveList[i].TransectionAmount.toString(),
          IsRecurring: RespectiveList[i].IsRecurring.toString(),
          AccountData: RespectiveList[i].AccountData.toString(),
          Date: RespectiveList[i].Date,
          Time: TimeOfDay.now().toString(),
          IsFavorite:RespectiveList[i].IsFavorite.toString(),
          IsBadTransection: RespectiveList[i].IsBadTransection.toString(),
      );
      StringBasedList.add(temp);
      print(RespectiveList[i].IconAddress.toString());
    }
    return StringBasedList;
  }

  static get_BackCategory_List(List<Note> DatabaseList) async {
    List <Categories> temp=[];
    for (int i = 0; i < DatabaseList.length; i++) {
      final ID1 = DatabaseList[i].ID;                                ///////////////////////////////////////
      final CategoryName1 = DatabaseList[i].CategoryName;//////////////////////
      final CategoryType1 = DatabaseList[i].CategoryType;//////////////////////
      final CurrentSumstring1 = DatabaseList[i].CurrentSum;
      double CurrentSum1 = double.parse(CurrentSumstring1!);         ///////////////////////////////////////
      String IconAddress1 = DatabaseList[i].IconAddress;
      // print(IconAddress1);//////////////////////
      final ButtonColor = DatabaseList[i].ButtonColor;
      Color ColorValue1 = HexColor(ButtonColor!);
      final EndColor = DatabaseList[i].EndColor;
      Color ColorValue2 = HexColor(EndColor!);
      final TransectionAmountString = DatabaseList[i].TransectionAmount;
      double TransectionAmount1 = double.parse(TransectionAmountString!);                   //////////////////////
      final IsRecurring = DatabaseList[i].IsRecurring;
      bool IsRecurring1 = IsRecurring!.toLowerCase() == 'true';
      final AccountData1 = DatabaseList[i].AccountData;
      DateTime Date1 = DatabaseList[i].Date;
      final Time1 = TimeOfDay.now();
      final IsFavorite = DatabaseList[i].IsFavorite;
      bool IsFavorite1 = IsFavorite!.toLowerCase() == 'true';
      final IsBadTransection = DatabaseList[i].IsBadTransection;
      bool IsBadTransection1 = IsBadTransection!.toLowerCase() == 'true';



      temp.add(Categories(ID1, CategoryName1!, CategoryType1!, CurrentSum1, IconAddress1, ColorValue1, ColorValue2 ,TransectionAmount1,IsRecurring1,AccountData1!,Date1,Time1,IsFavorite1,IsBadTransection1));
    }

    return temp;
  }



  static Future setAll() async {
    await _storage.write(key: "FingerPrintOfIvoryWalletApp", value: FiltersForTheApp.FingerPrintOn.toString());
    await _storage.write(key: "ElevationValueOfIvoryWalletApp", value: FiltersForTheApp.elevationvalue.toString());
    await _storage.write(key: "CurrencyOfIvoryWalletApp", value: FiltersForTheApp.CurrentCurrencyType.toString());
    await _storage.write(key: "StartDaysPastFromNowOfIvoryWalletApp", value: FiltersForTheApp.StartDaysPastFromNow.toString());
    await _storage.write(key: "how_many_Days_pastData_To_Be_ConsideredOfIvoryWalletApp", value: FiltersForTheApp.how_many_Days_pastData_To_Be_Considered.toString());
    await _storage.write(key: "voiceRecognitionWantOfIvoryWalletApp", value: FiltersForTheApp.voiceRecognitionWant.toString());
    await _storage.write(key: "Is_CashOfIvoryWalletApp", value: FiltersForTheApp.Is_Cash.toString());
    return 0;
  }
  //
  static GetAll() async {
    int Bool =1;
    final FingerPrint = await _storage.read(key: "FingerPrintOfIvoryWalletApp");
    final Elevation = await _storage.read(key: "ElevationValueOfIvoryWalletApp");
    final CurrencyType = await _storage.read(key: "CurrencyOfIvoryWalletApp");
    final FirstTime = await _storage.read(key: "CheckFirstTimeIvoryWalletMobileApp");
    final OverviewDaysToConsider = await _storage.read(key: "StartDaysPastFromNowOfIvoryWalletApp");
    final PredictionDaysToConsider = await _storage.read(key: "how_many_Days_pastData_To_Be_ConsideredOfIvoryWalletApp");
    final voiceRecognitionWanttemp = await _storage.read(key: "voiceRecognitionWantOfIvoryWalletApp");
    final Is_Cash_Temp = await _storage.read(key: "Is_CashOfIvoryWalletApp");

    if(FingerPrint!=null){
      FiltersForTheApp.FingerPrintOn = FingerPrint == "true";
    }else{
      Bool=2;
    }
    if(Elevation!=null){
      FiltersForTheApp.elevationvalue = double.parse(Elevation!);
    }else{
      Bool=2;
    }
    if(CurrencyType!=null){
      FiltersForTheApp.CurrentCurrencyType = CurrencyType!;
    }else{
      Bool=2;
    }
    if(FirstTime!=null){
      FiltersForTheApp.FirstTime = FirstTime != "true";
    }else{
      Bool=2;
    }
    if(OverviewDaysToConsider!=null){
      FiltersForTheApp.StartDaysPastFromNow = int.parse(OverviewDaysToConsider);
    }else{
      Bool=2;
    }
    if(PredictionDaysToConsider!=null){
      FiltersForTheApp.how_many_Days_pastData_To_Be_Considered = int.parse(PredictionDaysToConsider!);
    }else{
      Bool=2;
    }
    if(voiceRecognitionWanttemp!=null){
      FiltersForTheApp.voiceRecognitionWant = voiceRecognitionWanttemp == "true";
    }else{
      Bool=2;
    }

    if(Is_Cash_Temp!=null){
      FiltersForTheApp.Is_Cash = Is_Cash_Temp;
    }else{
      Bool=2;
    }

    return Bool;
  }


}

