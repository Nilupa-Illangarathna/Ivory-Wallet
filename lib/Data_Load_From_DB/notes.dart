final String tableBudgets = 'Budgets';
final String tableAllTransections = 'AllTransections';
final String tableExpensesCaegories = 'ExpensesCaegories';
final String tableIncomesCaegories = 'IncomesCaegories';


class NoteFields {

  static final List<String> values = [
    /// Add all fields
    ID, CategoryName, CategoryType, CurrentSum, IconAddress, ButtonColor,EndColor,
    TransectionAmount, IsRecurring, AccountData, Date, Time, IsFavorite,IsBadTransection,
  ];

  static final String ID = '_ID';
  static final String CategoryName = 'CategoryName';
  static final String CategoryType = 'CategoryType';
  static final String CurrentSum = 'CurrentSum';
  static final String IconAddress = 'IconAddress';
  static final String ButtonColor = 'ButtonColor';
  static final String EndColor = 'EndColor';
  static final String TransectionAmount = 'TransectionAmount';
  static final String IsRecurring = 'IsRecurring';
  static final String AccountData = 'AccountData';
  static final String Date = 'Date';
  static final String Time = 'Time';
  static final String IsFavorite = 'IsFavorite';
  static final String IsBadTransection = 'IsBadTransection';
}

class Note {
  final int ID;
  final String CategoryName;
  final String CategoryType;
  final String CurrentSum;
  final String IconAddress;
  final String ButtonColor;
  final String EndColor;
  final String TransectionAmount;
  final String IsRecurring;
  final String AccountData;
  final DateTime Date;
  final String Time;
  final String IsFavorite;
  final String IsBadTransection;

  const Note({
    required this.ID,
    required this.CategoryName,
    required this.CategoryType,
    required this.CurrentSum,
    required this.IconAddress,
    required this.ButtonColor,
    required this.EndColor,
    required this.TransectionAmount,
    required this.IsRecurring,
    required this.AccountData,
    required this.Date,
    required this.Time,
    required this.IsFavorite,
    required this.IsBadTransection,
  });


  Note copy({
    int? ID,
    String? CategoryName,
    String? CategoryType,
    String? CurrentSum,
    String? IconAddress,
    String? ButtonColor,
    String? EndColor,
    String? TransectionAmount,
    String? IsRecurring,
    String? AccountData,
    DateTime? Date,
    String? Time,
    String? IsFavorite,
    String? IsBadTransection,
  }) =>
      Note(
        ID: ID ?? this.ID,
        CategoryName: CategoryName ?? this.CategoryName,
        CategoryType: CategoryType ?? this.CategoryType,
        CurrentSum: CurrentSum ?? this.CurrentSum,
        IconAddress: IconAddress ?? this.IconAddress,
        ButtonColor: ButtonColor ?? this.ButtonColor,
        EndColor: EndColor ?? this.EndColor,
        TransectionAmount: TransectionAmount ?? this.TransectionAmount,
        IsRecurring: IsRecurring ?? this.IsRecurring,
        AccountData: AccountData ?? this.AccountData,
        Date: Date ?? this.Date,
        Time: Time ?? this.Time,
        IsFavorite: IsFavorite ?? this.IsFavorite,
        IsBadTransection: IsBadTransection ?? this.IsBadTransection,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
    ID: json[NoteFields.ID] as int,
    CategoryName: json[NoteFields.CategoryName] as String,
    CategoryType: json[NoteFields.CategoryType] as String,
    CurrentSum: json[NoteFields.CurrentSum] as String,
    IconAddress: json[NoteFields.IconAddress] as String,
    ButtonColor: json[NoteFields.ButtonColor] as String,
    EndColor: json[NoteFields.EndColor] as String,
    TransectionAmount: json[NoteFields.TransectionAmount] as String,
    IsRecurring: json[NoteFields.IsRecurring] as String,
    AccountData: json[NoteFields.AccountData] as String,
    Date: DateTime.parse(json[NoteFields.Date] as String),
    Time: json[NoteFields.Time] as String,
    IsFavorite: json[NoteFields.IsFavorite] as String,
    IsBadTransection: json[NoteFields.IsBadTransection] as String,
  );


  Map<String, Object?> toJson() => {
    NoteFields.ID: ID,
    NoteFields.CategoryName: CategoryName,
    NoteFields.CategoryType: CategoryType,
    NoteFields.CurrentSum: CurrentSum,
    NoteFields.IconAddress: IconAddress,
    NoteFields.ButtonColor: ButtonColor,
    NoteFields.EndColor: EndColor,
    NoteFields.TransectionAmount: TransectionAmount,
    NoteFields.IsRecurring: IsRecurring,
    NoteFields.AccountData: AccountData,
    NoteFields.Date: Date.toIso8601String(),
    NoteFields.Time: Time,
    NoteFields.IsFavorite: IsFavorite,
    NoteFields.IsBadTransection: IsBadTransection,
  };

}