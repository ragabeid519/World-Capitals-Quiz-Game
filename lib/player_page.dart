import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2_g2/home_page.dart';
import 'package:flutter_app2_g2/player.dart';
import 'package:flutter_app2_g2/stat_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({super.key});

  final nameController = TextEditingController();
  var started = false.obs;
  final players = <Player>[];
  var playerExist = false.obs;
  final file = GetStorage();

  @override
  Widget build(BuildContext context) {
    //style - decoration
    final last = file.read('name') ?? ''.obs;
    print('the last winner is ${last}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (last != '') Text('the last winner is ${last}'),
            TextField(
              onChanged: (v) {
                started.value = v.isNotEmpty;
              },
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'name here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Obx(() {
              return ElevatedButton.icon(
                onPressed: started.value
                    ? () async {
                        if (players.any(
                          (value) => value.name == nameController.text,
                        )) {
                          Get.snackbar(
                            'error',
                            'player already exists',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }
                        //route
                        //memory leak
                        final score = await Get.to(
                          () => HomePage(),
                          transition: Transition.rightToLeft,
                          arguments: nameController.text,
                        );
                        print(
                          'score is $score ================================',
                        );
                        if (score != null) {
                          playerExist.value = true;
                          players.add(
                            Player(name: nameController.text, score: score),
                          );
                          // play sound
                          final p = AudioPlayer();
                          await p.setAsset(
                            score > 2
                                ? 'assets/audio/clap_success.mp3'
                                : 'assets/audio/clap_fail.mp3',
                          );
                          p.play();
                        } else {
                          Get.snackbar(
                            'error',
                            'Incomplete game',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      }
                    : null,
                label: Text('play'),
                icon: Icon(Icons.games),
              );
            }),
            Obx(
              () => ElevatedButton(
                onPressed: playerExist.value
                    ? () {
                        Get.to(
                          () => StatPage(),
                          transition: Transition.rightToLeft,
                          arguments: players,
                        );
                        final player = players.maxBy((value) => value.score);
                        file.write('name', player?.name);
                      }
                    : null,
                child: Text('winner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
