import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silent_moon/data/model/topic.model.dart';
import 'package:silent_moon/data/topic_storage.dart';
import 'package:silent_moon/utils/theme.dart';
import 'package:silent_moon/widgets/responsive_builder.dart';

final TopicStorage = AssetTopicStorage();

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      body: SafeArea(
          child: ResponsiveBuilder(
              portrait: Column(
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: _HeaderChooseTopic(),
                  ),
                  Flexible(
                    flex: 3,
                    child: FutureBuilder<List<Topic>>(
                        future: TopicStorage.load(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('$snapshot.error');
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          ;
                          final topics = snapshot.data!;
                          return _TopicGrid(topics: topics);
                        }),
                  ),
                ],
              ),
              landscape: Row(children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: const [
                      Expanded(child: _HeaderChooseTopic()),
                      Spacer(),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: FutureBuilder<List<Topic>>(
                      future: TopicStorage.load(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('$snapshot.error');
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        ;
                        final topics = snapshot.data!;
                        return _TopicGrid(topics: topics);
                      }),
                ),
              ]))),
    );
  }
}

class _TopicGrid extends StatelessWidget {
  const _TopicGrid({
    Key? key,
    required this.topics,
  }) : super(key: key);

  final List<Topic> topics;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        mainAxisSpacing: 16,
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return DecoratedBox(
              decoration: BoxDecoration(
                  color: topic.bgColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SvgPicture.asset(
                        topic.thumbnail,
                        width: constraints.maxWidth,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      topic.title,
                      style: PrimaryFont.bold(
                              context.screenSize.shortestSide * 0.04)
                          .copyWith(
                        color: topic.textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ));
        });
  }
}

class _HeaderChooseTopic extends StatelessWidget {
  const _HeaderChooseTopic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(
            flex: 3,
          ),
          Flexible(
            flex: 3,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'What Brings you\n',
                  style: PrimaryFont.medium(24).copyWith(color: kColorBlack),
                  children: [
                    TextSpan(
                      text: 'to Silent Moon?',
                      style: PrimaryFont.thin(24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 1,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text('choose a topic to focuse on:'),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
