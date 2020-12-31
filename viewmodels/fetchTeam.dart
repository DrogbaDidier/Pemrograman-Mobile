import 'package:mobile1/models/Team.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Team>> fetchAustralianNBL(http.Client client) async {
  final response = await client.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?1=Australian%20NBL');
  return compute(parseTeam, response.body);
}
Future<List<Team>> fetchNBA(http.Client client) async {
  final response = await client.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=NBA');
  return compute(parseTeam, response.body);
}
Future<List<Team>> fetchSpanishLigaACB(http.Client client) async {
  final response = await client.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=Spanish%20liga%20ACB');
  return compute(parseTeam, response.body);
}

List<Team> parseTeam(String responseBody) {
  final parsed = jsonDecode(responseBody)['teams'].cast<Map<String, dynamic>>();
  return parsed.map<Team>((json) => Team.fromJson(json)).toList();
}
