import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;
  int _offset = 0;

  Future<Map> _getGifis() async{
    http.Response response;
    if(_search == null) {
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=RIbWAIZhM0HAyaCwVBpjaMr9yJn47G6I&limit=25&rating=G");
    }else {
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key="
          "RIbWAIZhM0HAyaCwVBpjaMr9yJn47G6I&q=$_search&limit=25&offset=$_offset&rating=G&lang=pt");

      return json.decode(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    _getGifis().then((map) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}