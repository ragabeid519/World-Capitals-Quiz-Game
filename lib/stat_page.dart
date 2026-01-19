import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2_g2/player.dart';
import 'package:get/get.dart';

class StatPage extends StatelessWidget {
  StatPage({super.key});
  var players = [
    // Player(name: 'ahmed', score: 0),
    // Player(name: 'tamer', score: 4),
    // Player(name: 'said', score: 2),
    // Player(name: 'ali', score: 3),
    // Player(name: 'mohamed', score: 1),
    // Player(name: 'mahmoud', score: 2),
  ].obs;
  var sortScore = false;
  var sortName = false;
  @override
  Widget build(BuildContext context) {
    players.clear();
    players.addAll(Get.arguments);
    final master = players.value.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'stat page',
          style: TextStyle(fontSize: context.width * 0.05),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      players.value = master
                          .where((player) => player.name.contains(value))
                          .toList();
                    },
                    decoration: const InputDecoration(
                      hintText: 'filter by name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    if (sortName) {
                      players.value = players
                          .sortedBy((player) => player.name)
                          .toList();
                    } else {
                      players.value = players
                          .sortedByDescending((player) => player.name)
                          .toList();
                    }
                    sortName = !sortName;
                  },
                  label: Text('sort name', style: TextStyle(fontSize: 18)),
                  icon: Icon(Icons.sort),
                ),
                TextButton.icon(
                  onPressed: () {
                    if (sortScore) {
                      players.value = players
                          .sortedBy((player) => player.score)
                          .toList();
                    } else {
                      players.value = players
                          .sortedByDescending((player) => player.score)
                          .toList();
                    }
                    sortScore = !sortScore;
                  },
                  label: Text('sort score', style: TextStyle(fontSize: 18)),
                  icon: Icon(Icons.sort),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (players.isEmpty) {
                return const Center(
                  child: Text(
                    'no players',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                );
              }
              return ListView.builder(
                // cacheExtent: 200, /////// /// improve performance
                // prototypeItem: ListTile(
                //   ///////////improve performance
                //   title: Text(
                //     'name',
                //     style: const TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                // ),
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      players[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      players[index].score.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
