import 'package:flutter/foundation.dart';

class StepCard with ChangeNotifier {
  int id;
  String name;
  String description;
  String imageUrl;

  StepCard(this.id, this.name, this.description, this.imageUrl);
}
