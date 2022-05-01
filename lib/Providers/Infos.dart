import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';

class Infos extends ChangeNotifier {

String Number = "" ;
List<Contact> contacts = [] ;
int onlong = 900 ;


void AddNum (String x) {
  if(Number.length<=18) {
    Number=Number+x;
    notifyListeners() ;

  }

  notifyListeners() ;
}

void DelNum () {
  if (Number != null && Number.length > 0) {
    Number = Number.substring(0, Number.length - 1);
  }
  notifyListeners() ;
}
}