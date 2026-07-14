import 'package:flutter/material.dart';
import 'package:mplayer/components/drawer.dart';
import 'package:mplayer/models/playlist_provider.dart';
import 'package:mplayer/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playListProvider;
  @override
  initState() {
    super.initState();
    playListProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSongPage(int songIndex) {
    playListProvider.currentIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SongPage(
              songArtist: playListProvider.playlists[songIndex].artist,
              songName: playListProvider.playlists[songIndex].name,
              songCover: playListProvider.playlists[songIndex].image,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Library',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'Songs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Consumer<PlaylistProvider>(
              builder: (context, playlistProvider, _) {
                final playlists = playlistProvider.playlists;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlists.length,
                  itemBuilder: (context, index) {
                    final song = playlists[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          song.image,
                          width: 60,
                          height: 65,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        song.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        song.artist,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        goToSongPage(index);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
