class Contact {
/*
   We store data in db in the form of Map ...
   and reade data from it in the form of Map too, so ...
   To store => we need to transform model into Map,
   To reade => we need to transform Map into model.
*/
  late int id;
  late String name;
  late String phone;

  ///Function used to store data into db table (model => Map).
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['name'] = name;
    rowMap['phone'] = phone;
    return rowMap;
  }

  ///Constructor used to reade table row from db table (Map => model).
  Contact.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    phone = rowMap['phone'];
  }

/*
  Note:
  above, we use function to return non instance/object data type,
  but we use constructor to return instance/object data type
*/
}
