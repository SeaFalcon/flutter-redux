import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/models/post_model.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

class PostPage extends StatelessWidget {
  final Color appBarColor;
  final int postId;

  const PostPage({
    Key? key,
    required this.appBarColor,
    required this.postId,
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
      body: StoreConnector<AppState, _PostViewModel>(
        onInit: (store) => store.dispatch(fetchPostAndDispatch(postId)),
        converter: (store) => _PostViewModel(
          state: store.state.postState,
        ),
        builder: (BuildContext context, _PostViewModel postVM) {
          if (postVM.state.status == PostsStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (postVM.state.status == PostsStatus.error) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(postVM.state.error.message.toString()),
                ),
              );
            });
          }

          if (postVM.state.post == Post.emptyPost()) {
            return Center(
              child: Text(
                'No Post !',
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return Container(
            color: Colors.green.shade50,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      postVM.state.post.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 3, left: 5, right: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'User ID: ${postVM.state.post.userId} | Article No: ${postVM.state.post.id}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postVM.state.post.body,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PostViewModel {
  final PostState state;

  _PostViewModel({
    required this.state,
  });
}
