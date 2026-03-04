import 'package:challenges/week07_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:challenges/week07_small_homework/ui/screens/library/widgets/library_content.dart';
import 'package:challenges/week07_small_homework/ui/states/player_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/songs/song_repository.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // // 1- Read the globbal song repository
    // SongRepository songRepository = context.read<SongRepository>();
    // List<Song> songs = songRepository.fetchSongs();

    // // 2- Read the globbal settings state
    // AppSettingsState settingsState = context.read<AppSettingsState>();

    // // 3 - Watch the globbal player state
    // PlayerState playerState = context.watch<PlayerState>();

    // return LibraryContent();

    return ChangeNotifierProvider<LibraryViewModel>(
      create: (context) {
        final repo = context.read<SongRepository>();
        final player = context.read<PlayerState>();

        final vm = LibraryViewModel(songRepository: repo, playerState: player);
        return vm;
      },
      child: LibraryContent(),
    );
  }
}
