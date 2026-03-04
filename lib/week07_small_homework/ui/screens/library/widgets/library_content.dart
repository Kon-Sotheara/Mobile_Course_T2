import 'package:challenges/week07_small_homework/model/songs/song.dart';
import 'package:challenges/week07_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:challenges/week07_small_homework/ui/states/settings_state.dart';
import 'package:challenges/week07_small_homework/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LibraryViewModel>();
    final settings = context.read<AppSettingsState>();

    return Container(
      color: settings.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: vm.songs.length,
              itemBuilder: (context, index) {
                final songs = vm.songs[index];
                return SongTile(
                  song: songs,
                  isPlaying: vm.isPlaying(songs),
                  onTap: () {
                    vm.play(songs);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
