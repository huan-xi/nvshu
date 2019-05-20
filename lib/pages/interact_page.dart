import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class InteractPage extends StatefulWidget {
  @override
  _InteractPageState createState() => _InteractPageState();
}

class _InteractPageState extends State<InteractPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Image(image: CachedNetworkImageProvider("http://via.placeholder.com/350x150"))
    );
  }
}
