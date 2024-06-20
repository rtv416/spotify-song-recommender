import 'package:flutter/material.dart';
import 'spotify_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spotify API Example'),
        ),
        body: Center(
          child: SpotifyLoginButton(),
        ),
      ),
    );
  }
}

class SpotifyLoginButton extends StatelessWidget {
  final SpotifyService spotifyService = SpotifyService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await spotifyService.authenticate(context);
      },
      child: Text('Login with Spotify'),
    );
  }
}
