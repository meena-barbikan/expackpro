import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phonenumber;
  @HiveField(2)
  String? id;
  HiveModel({
    this.id,
    this.name,
    this.phonenumber,
  });
}
