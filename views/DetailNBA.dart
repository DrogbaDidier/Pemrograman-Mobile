import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile1/models/Team.dart';

class DetailNBA extends StatelessWidget {
  final Team team;
  DetailNBA({Key key, @required this.team}) : super(key: key);

@override
Widget build(BuildContext context) {
  Widget bagianJudul = Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    team.nama,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  team.liga,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blueAccent[400],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('${team.stadium}'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );

  Widget bagianDeskripsi = Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      team.deskripsi,
      style: Theme.of(context).textTheme.bodyText1,
      softWrap: true,
      textAlign: TextAlign.justify,
    ),
  );
  return Scaffold(
    appBar: AppBar(
      title: Text(team.nama),
    ),
    body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            '${team.logo}',
            width: 600,
            height: 300,
          ),
        ),
        bagianJudul,
        bagianDeskripsi,
      ],
    ),
  );
}
}
