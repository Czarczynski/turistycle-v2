import 'package:flutter/cupertino.dart';
import 'package:turistycle/models/social_post_model.dart';
import 'package:turistycle/networking/http_client.dart';
import 'package:turistycle/services/auth_service.dart';

class SocialPostsBloc extends ChangeNotifier {
  static List<Post> _list = <Post>[];
  bool _isInProgress = false;

  bool get isInProgress => _isInProgress;

  List<Post> get list => _list;

  SocialPostsBloc() {
    if (_list.isEmpty) {
      getPosts();
    }
  }

  Future<void> getPosts() async {
    try {
      _isInProgress = true;
      notifyListeners();
      final response = await HttpClient().get('/users/followed', headers: {
        'Authorization': 'Bearer ${await AuthService().user?.getIdToken()}'
      });
      if (response.statusCode == 200) {
        _list = SocialPostsResponse.fromJson(response.data).posts!;
      } else {
        print('Err');
      }
    } catch (error) {
      print('err2');
    } finally {
      _isInProgress = false;
    }
    notifyListeners();
  }
}
