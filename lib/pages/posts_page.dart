import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/pages/post_page.dart';
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
        title: TextButton(
          child: Text(
            'Posts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
        backgroundColor: appBarColor,
      ),
      body: StoreConnector<AppState, _PostsViewModel>(
        onInit: (store) => store.dispatch(FetchPostsAction()),
        converter: (store) => _PostsViewModel(
          state: store.state.postsState,
        ),
        builder: (BuildContext context, _PostsViewModel postsVM) {
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
                onTap: () {
                  print(postsVM.state.posts[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostPage(
                        appBarColor: appBarColor,
                        postId: postsVM.state.posts[index].id,
                      ),
                    ),
                  );
                },
                title: Text(postsVM.state.posts[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PostsViewModel {
  final PostsState state;

  _PostsViewModel({
    required this.state,
  });
}
