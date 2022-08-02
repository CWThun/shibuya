class Address {
  String id = '';
  String zipcode = '';
  String pref = '';
  String city = '';
  String town = '';
  int code = 200;

  Address();

  Address.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    zipcode = map['zipcode'];
    pref = map['pref'];
    city = map['city'];
    town = map['town'];
    code = 200;
  }

  Address.fromCode(int responseCode) {
    code = responseCode;
  }
}
