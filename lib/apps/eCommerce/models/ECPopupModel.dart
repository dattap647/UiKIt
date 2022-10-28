class ECPopUpModel {
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const List<String> choices = <String>[
    save,
    delete,
  ];
}

void eCChoiceAction(String choice) {
  print('Selected');
}
