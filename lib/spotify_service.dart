import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SpotifyService {
  final String clientId = 'e74fc9e33c564c2a87c1fe9c71f4c24a'; // Replace with your client ID
  final String clientSecret = '6bab3c4bdbd945819357db2f092f69c8'; // Replace with your client secret
  final String redirectUri = 'http://localhost:64494/callback'; // Replace with your redirect URI
  String? accessToken;

  Future<void> authenticate(BuildContext context) async {
    final Uri authUri = Uri(
      scheme: 'https',
      host: 'accounts.spotify.com',
      path: '/authorize',
      queryParameters: {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': redirectUri,
        'scope': 'user-read-private user-read-email',
      },
    );

    if (await canLaunch(authUri.toString())) {
      await launch(authUri.toString());
      _handleRedirect();
    } else {
      throw Exception('Could not launch $authUri');
    }
  }

  void _handleRedirect() {
    html.window.onBeforeUnload.listen((event) async {
      final Uri uri = Uri.parse(html.window.location.href);
      if (uri.queryParameters.containsKey('code')) {
        final String? code = uri.queryParameters['code'];
        if (code != null) {
          await _getToken(code);
          html.window.location.href = html.window.location.origin!;
        }
      }
    });
  }

  Future<void> _getToken(String code) async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('$clientId:$clientSecret')),
      },
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      accessToken = json['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }
}
