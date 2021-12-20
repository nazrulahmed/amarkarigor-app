class Service {
  int _id;
  String _name;
  double _price;
  int _catId;
  int _subcatId;
  String _icon;
  String _description;
  String? _attribute;

  Service(this._id, this._name, this._price, this._catId, this._subcatId,
      this._icon, this._description, this._attribute);

  int get id => _id;
  int get catId => _catId;
  String get name => _name;
  double get price => _price;
  int get subCatId => _subcatId;
  String get icon => _icon;
  String get description => _description;
  String? get attribute => _attribute;
}
