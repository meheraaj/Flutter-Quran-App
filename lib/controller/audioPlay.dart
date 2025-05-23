import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class AudioPlay extends GetxController {
  final player = AudioPlayer();
  RxString durationForShow = '0:0'.obs;
  RxDouble durationInInt = 100.0.obs;
  RxDouble positionInInt = 0.0.obs;
  RxString positionToShow = '0:0'.obs;
  RxString playerState = 'stopped'.obs;
  RxDouble bufferedDuration = 0.0.obs;
  RxDouble volume = 0.0.obs;

  Future initAudio(
    String audioUrl,
    String sname,
  ) async {
    final playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(audioUrl.replaceAll('http', 'https')),
          tag: MediaItem(
              id: '1',
              title: sname,
              artUri: Uri.parse(
                  'https://cdn.pixabay.com/photo/2019/05/04/18/13/quran-4178711__340.jpg')))
    ]);

    try {
      await player.setAudioSource(playlist);
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      print("Error loading playlist: $e");
      print(stackTrace);
    }

    player.durationStream.listen((event) {
      durationInInt.value = event!.inMilliseconds.toDouble();
      durationForShow.value = event.toString();
    });
    player.play();

    player.positionStream.listen((event) {
      positionToShow.value = event.toString();
      positionInInt.value = event.inMilliseconds.toDouble();
      if (positionInInt > durationInInt.toDouble()) {
        positionInInt.value = durationInInt.toDouble();

        stopAudio();
      }
    });
    player.playerStateStream.listen((event) {
      if (event.playing) {
        playerState.value = 'playing';
      } else {
        playerState.value = 'paused';
      }
    });
    player.bufferedPositionStream.listen((event) {
      bufferedDuration.value = event.inMilliseconds.toDouble();
    });

    player.volumeStream.listen((event) {
      volume.value = event;
    });
  }

  Future stopAudio() async {
    player.stop();
    playerState.value = 'stopped';
  }

  Future pauseAudio() async {
    player.pause();
  }

  Future muteAudio(double vol) async {
    volume.value = vol;
    player.setVolume(vol);
  }

  Future resumeAudio() async {
    player.play();
  }

  Future seekTo(Duration val) async {
    player.seek(val);
  }

  Future disposeAudio() async {
    player.dispose();
    playerState.value = 'stopped';
  }

  @override
  void dispose() {
    player.dispose();
    playerState.value = 'stopped';
    super.dispose();
  }
}
