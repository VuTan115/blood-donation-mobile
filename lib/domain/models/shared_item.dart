import 'package:flutter/foundation.dart';

class SharedItem with ChangeNotifier {
  String name;
  String url;

  SharedItem(this.name, this.url);
}
