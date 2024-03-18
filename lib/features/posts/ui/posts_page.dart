import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postget/features/posts/bloc/posts_bloc.dart';
import 'package:postget/features/posts/bloc/posts_event.dart';
import 'package:postget/features/posts/bloc/posts_state.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts Page'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              postsBloc.add(PostAddEvent());
            }),
        body: BlocConsumer<PostsBloc, PostsState>(
          bloc: postsBloc,
          listenWhen: (previous, current) => current is PostsActionState,
          buildWhen: (previous, current) => current is! PostsActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostsFetchingLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case PostsAdditionErrorState:
                return const Column(
                  children: [Text('data')],
                );
              case PostsAdditionSuccessState:
                return const Center(
                  child: LinearProgressIndicator(),
                );
              case PostFetchingSuccessfulState:
                final successState = state as PostFetchingSuccessfulState;

                return Container(
                  child: ListView.builder(
                    itemCount: successState.posts[0].carts.length,
                    itemBuilder: (context, index) {
                      return Container(
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(16),
                          child: ListTile(
                            title: Text(successState.posts[0].carts[index].total
                                .toString()),
                          ));
                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ));
  }
}
