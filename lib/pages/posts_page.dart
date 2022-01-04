import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

class PostsPage extends StatelessWidget {
  final Color appBarColor;

  const PostsPage({
    Key? key,
    required this.appBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        backgroundColor: appBarColor,
      ),
      body: StoreConnector<AppState, _PostViewModel>(
        onInit: (store) => store.dispatch(FetchPostsAction()),
        converter: (store) => _PostViewModel(
          state: store.state.postsState,
        ),
        builder: (BuildContext context, _PostViewModel postsVM) {
          if (postsVM.state.status == PostsStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (postsVM.state.status == PostsStatus.error) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(postsVM.state.error.message.toString()),
                ),
              );
            });
          }

          if (postsVM.state.posts.isEmpty) {
            return Center(
              child: Text(
                'No Posts !',
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) => Card(
              child: ListTile(
                onTap: () {},
                title: Text(postsVM.state.posts[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PostViewModel {
  final PostsState state;

  _PostViewModel({
    required this.state,
  });
}
