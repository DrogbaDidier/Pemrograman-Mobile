import 'package:flutter/cupertino.dart';

class Team {
  final String nama;
  final String logo;
  final String deskripsi;
  final String stadium;
  final String liga;

  Team({this.nama, this.logo, this.deskripsi, this.stadium, this.liga});

  factory Team.fromJson(Map<String, dynamic>json) {
    return Team(
      nama:json['strTeam'] as String,
      logo: json['strTeamBadge'] as String,
      deskripsi: json['strDescriptionEN'] as String,
      stadium: json['strStadium'] as String,
      liga: json['strLeague'] as String,
    );
  }
}