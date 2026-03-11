import 'package:challenges/week08/week08_mini_homework/model/songs/song.dart';
import 'package:challenges/week08/week08_mini_homework/utils/async_value_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../../widgets/song/song_tile.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    LibraryViewModel mv = context.watch<LibraryViewModel>();
    AsyncValue<List<Song>> asyncValue = mv.songsValue;
    Widget content;

    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = CircularProgressIndicator();
        break;
      case AsyncValueState.error:
        content = Text("error !");
        break;
      case AsyncValueState.sucess:
        content = Expanded(
          child: ListView.builder(
            itemCount: mv.songs.length,
            itemBuilder: (context, index) => SongTile(
              song: mv.songs[index],
              isPlaying: mv.isSongPlaying(mv.songs[index]),
              onTap: () {
                mv.start(mv.songs[index]);
              },
            ),
          ),
        );
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text("Library", style: AppTextStyles.heading),
            SizedBox(height: 50),
            content,
          ],
        ),
      ),
    );
  }
}
