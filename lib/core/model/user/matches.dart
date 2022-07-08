class Matches {
  String? _text;
  List<int>? _indices;

  String? get text => _text;
  List<int>? get indices => _indices;

  Matches({
      String? text, 
      List<int>? indices}){
    _text = text;
    _indices = indices;
}

  Matches.fromJson(dynamic json) {
    _text = json['text'];
    _indices = json['indices'] != null ? json['indices'].cast<int>() : [];
  }

  @override
  String toString() {
    return 'Matches{_text: $_text, _indices: $_indices}';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['text'] = _text;
    map['indices'] = _indices;
    return map;
  }

}