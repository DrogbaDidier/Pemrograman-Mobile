import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile1/models/Team.dart';
import 'package:mobile1/viewmodels/fetchTeam.dart';
import 'package:mobile1/views/DetailAustraliaNBL.dart';
import 'DetailNBA.dart';
import 'DetailSpanishLigaACB.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'LIGA AUSTRALIA',
              ),
              Tab(
                text: 'LIGA AMERIKA' ,
              ),
              Tab(
                text: 'LIGA SPANYOL',
              ),
            ],
          ),
          title: Text('LIGA BASKET'),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder<List<Team>>(
                future: fetchAustralianNBL(http.Client()),
                builder: (context, snapshot){
                  if(snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? TeamListAustraliaNBL(team: snapshot.data)
                      : Center(
                  child: CircularProgressIndicator(),
                  );
                }
              ),
            ),
            Center(
              child: FutureBuilder<List<Team>>(
                future: fetchNBA(http.Client()),
                builder: (context, snapshot){
                  if (snapshot.hasError) print (snapshot.error);
                  return snapshot.hasData
                      ? TeamListNBA(team: snapshot.data)
                      : Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
            ),
            Center(
              child: FutureBuilder<List<Team>>(
                future: fetchSpanishLigaACB(http.Client()),
                builder: (context, snapshot){
                  if (snapshot.hasError) print (snapshot.error);
                  return snapshot.hasData
                      ? TeamListSpanishLigaACB(team: snapshot.data)
                      : Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeamListAustraliaNBL extends StatelessWidget {
  final List<Team> team;
  TeamListAustraliaNBL({Key key, this.team}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: team.length,
      itemBuilder: (context, index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
            builder: (context) => DetailAustralianNBL(
              team: team[index],
            )));
          },
          child: new Card(
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network("${team[index].logo}",
                    width: 80,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '${team[index].nama}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                        '${team[index].liga}',
                          style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
  }
}

class TeamListNBA extends StatelessWidget {
  final List<Team> team;
  TeamListNBA({Key key, this.team}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: team.length,
        itemBuilder: (context, index){
          return new GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNBA(
                        team: team[index],
                      )));
            },
            child: new Card(
              child: new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network("${team[index].logo}",
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${team[index].nama}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text(
                          '${team[index].liga}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class TeamListSpanishLigaACB extends StatelessWidget {
  final List<Team> team;
  TeamListSpanishLigaACB({Key key, this.team}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: team.length,
        itemBuilder: (context, index){
          return new GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNBA(
                        team: team[index],
                      )));
            },
            child: new Card(
              child: new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network("${team[index].logo}",
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${team[index].nama}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text(
                          '${team[index].liga}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
