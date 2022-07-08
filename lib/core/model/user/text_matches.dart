import 'matches.dart';

class Text_matches {
  String? _objectUrl;
  String? _objectType;
  String? _property;
  String? _fragment;
  List<Matches>? _matches;

  String? get objectUrl => _objectUrl;
  String? get objectType => _objectType;
  String? get property => _property;
  String? get fragment => _fragment;
  List<Matches>? get matches => _matches;

  Text_matches({
      String? objectUrl, 
      String? objectType, 
      String? property, 
      String? fragment, 
      List<Matches>? matches}){
    _objectUrl = objectUrl;
    _objectType = objectType;
    _property = property;
    _fragment = fragment;
    _matches = matches;
}

  @override
  String toString() {
    return 'Text_matches{_objectUrl: $_objectUrl, _objectType: $_objectType, _property: $_property, _fragment: $_fragment, _matches: $_matches}';
  }

  Text_matches.fromJson(dynamic json) {
    _objectUrl = json['object_url'];
    _objectType = json['object_type'];
    _property = json['property'];
    _fragment = json['fragment'];
    if (json['matches'] != null) {
      _matches = [];
      json['matches'].forEach((v) {
        _matches?.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['object_url'] = _objectUrl;
    map['object_type'] = _objectType;
    map['property'] = _property;
    map['fragment'] = _fragment;
    if (_matches != null) {
      map['matches'] = _matches?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}