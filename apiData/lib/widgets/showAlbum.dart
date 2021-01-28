import 'package:flutter/material.dart';
import '../model/album.dart';
import '../services/netwoeking.dart';

class ShowAlbum extends StatefulWidget {
  @override
  _ShowAlbumState createState() => _ShowAlbumState();
}

class _ShowAlbumState extends State<ShowAlbum> {
  Future<Album> _futureAlbum;
  NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    super.initState();
    _futureAlbum = _networkHelper.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Server Api'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text('${snapshot.data?.title ?? 'Deleted'}'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureAlbum = _networkHelper
                              .deleteAlbum(snapshot.data.id.toString());
                        });
                      },
                      child: Text('Delete Data'),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
