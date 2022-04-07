import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turistycle/blocs/social_posts_bloc.dart';
import 'package:turistycle/models/social_post_model.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Chuj złoty'),
        ChangeNotifierProvider<SocialPostsBloc>(
          create: (context) => SocialPostsBloc(),
          child: Consumer<SocialPostsBloc>(
            builder: (context, SocialPostsBloc _bloc, _) {
              return Expanded(
                child: _bloc.isInProgress
                    ? const Text('Dane się ładują')
                    : _bloc.list.isEmpty
                        ? const Text('Brak postów')
                        : ListView.builder(
                            itemCount: _bloc.list.length,
                            itemBuilder: (context, index) {
                              Post item = _bloc.list[index];
                              return ListTile(
                                  title: Text(item.displayName ?? ''));
                            },
                          ),
              );
            },
          ),
        ),
      ],
    );
  }
}
