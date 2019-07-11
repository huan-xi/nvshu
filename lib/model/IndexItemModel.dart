import 'dart:convert' show json;


class IndexItemModel {

  int total;
  String image;
  String subtitle;
  String time;
  String title;


  IndexItemModel(jsonStr) {
    var jsonRes = json.decode(jsonStr);

    total = jsonRes['totol'];
    image = jsonRes['image'];
    subtitle = jsonRes['subtitle'];
    time = jsonRes['time'];
    title = jsonRes['title'];

  }

  @override
  String toString() {
    return '{"totol": $total,"image": ${image != null?'${json.encode(image)}':'null'},"subtitle": ${subtitle != null?'${json.encode(subtitle)}':'null'},"time": ${time != null?'${json.encode(time)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

