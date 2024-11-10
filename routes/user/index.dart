import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async{
  return switch (context.request.method) {
    HttpMethod.get => _getUsers(),
    HttpMethod.post => _createUser(context),
    _ => Future.value(Response(body: "This is default"))
  };
}

Future<Response> _getUsers() {
  return Future.value(Response.json(body: [
    {
      'name': "shebin",
      "lastName": "Kandapath",
    },
    {
      'name': "sanjil",
      "lastName": "Kandapath",
    },
    {
      'name': "shahana",
      "lastName": "Kandapath",
    }
  ]));
}

Future<Response> _createUser(RequestContext context) async {
  final data = await context.request.json() as Map<String, dynamic>;

  final name = data["name"];
  final lastName = data["lastName"];

  return Response.json(body: { 
    "message": "Saved!",
    "userName": name,
    "lastName": lastName,
  });
}
