import 'items.dart';

class UserModel {
  int? _totalCount;
  bool? _incompleteResults;
  List<Items>? _items;

  int? get totalCount => _totalCount;
  bool? get incompleteResults => _incompleteResults;
  List<Items>? get items => _items;

  UserModel({
      int? totalCount, 
      bool? incompleteResults, 
      List<Items>? items}){
    _totalCount = totalCount;
    _incompleteResults = incompleteResults;
    _items = items;
}

  @override
  String toString() {
    return 'UserModel{_totalCount: $_totalCount, _incompleteResults: $_incompleteResults, _items: $_items}';
  }

  UserModel.fromJson(dynamic json) {
    _totalCount = json['total_count'];
    _incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['total_count'] = _totalCount;
    map['incomplete_results'] = _incompleteResults;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}