import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

var lawyers = 'https://rentify-fm53.onrender.com/lawyers/list-all';

Future getLawyers() async{
  var lawyer = await http.get(Uri.parse(lawyers));

  var dataOflawyer= jsonDecode(lawyer.body);
  if(lawyer.statusCode == 200){
    return dataOflawyer;
  }

}