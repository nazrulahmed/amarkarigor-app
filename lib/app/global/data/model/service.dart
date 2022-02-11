import 'package:hive/hive.dart';
part 'service.g.dart';
@HiveType(typeId: 1)
class Service {
  @HiveField(0)
  int _id;
  @HiveField(1)
  String _name;
  @HiveField(2)
  double _price;
  @HiveField(3)
  int _catId;
  @HiveField(4)
  int _subCatId;
  @HiveField(5)
  String _icon;
  @HiveField(6)
  String _description;
  @HiveField(7)
  String? _attribute;
  @HiveField(8)
  String? _option;

  Service(this._id, this._name, this._price, this._catId, this._subCatId,
      this._icon, this._description, this._attribute,this._option);

  int get id => _id;
  int get catId => _catId;
  String get name => _name;
  double get price => _price;
  int get subCatId => _subCatId;
  String get icon => _icon;
  String get description => _description;
  String? get attribute => _attribute;
  String? get option => _option;
}
