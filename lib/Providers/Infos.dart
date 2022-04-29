import 'package:flutter/cupertino.dart';

class Infos extends ChangeNotifier {

String Number = "" ;

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