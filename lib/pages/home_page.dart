import 'package:flutter/material.dart';
import 'package:mplayer/components/drawer.dart';
import 'package:mplayer/models/playlist_provider.dart';
import 'package:mplayer/models/song.dart';
import 'package:mplayer/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlaylistProvider playListProvider;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    playListProvider = Provider.of<PlaylistProvider>(context, listen: false);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void goToSongPage(int songIndex) {
    playListProvider.currentIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(
          songArtist: playListProvider.playlists[songIndex].artist,
          songName: playListProvider.playlists[songIndex].name,
          songCover: playListProvider.playlists[songIndex].image,
        ),
      ),
    );
  }

  List<Song> _filteredPlaylists(List<Song> playlists) {
    if (_searchQuery.isEmpty) {
      return playlists;
    }

    final query = _searchQuery.toLowerCase();
    return playlists.where((song) {
      return song.name.toLowerCase().contains(query) ||
          song.artist.toLowerCase().contains(query);
    }).toList();
  }

  int _originalIndexForSong(Song song) {
    return playListProvider.playlists.indexWhere((item) {
      return item.name == song.name &&
          item.artist == song.artist &&
          item.image == song.image &&
          item.audioPath == song.audioPath;
    });
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search songs or artists',
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: _searchQuery.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                },
                              ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Consumer<PlaylistProvider>(
              builder: (context, playlistProvider, _) {
                final allPlaylists = playlistProvider.playlists;
                final playlists = _filteredPlaylists(allPlaylists);

                if (playlists.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        'No songs found.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlists.length,
                  itemBuilder: (context, index) {
                    final song = playlists[index];
                    final originalIndex = _originalIndexForSong(song);
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
                        if (originalIndex != -1) {
                          goToSongPage(originalIndex);
                        }
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
