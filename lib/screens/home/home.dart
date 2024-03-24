import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media_test/controllers/post_controller/post_controller.dart';
import 'package:social_media_test/models/dashboard_model/post_model.dart';
import 'package:social_media_test/providers/home_provider.dart';
import 'package:social_media_test/screens/home/widgets/video_player.dart';
import 'package:social_media_test/utils/app_sizes.dart';
import 'package:social_media_test/utils/utils.dart';
import 'package:social_media_test/widgets/gradient_container.dart';
import 'package:social_media_test/widgets/indicators.dart';

import '../../main.dart';
import '../../widgets/bordered_container.dart';
import '../../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PostsModel?> _postsFuture;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _postsFuture = PostController().postData();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      body: Consumer<HomeProvider>(
          builder: (context, provider, _) {
          return FutureBuilder<PostsModel?>(
            future: _postsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  backgroundColor: currentTheme.backgroundColor,
                  body: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData && snapshot.data!.posts != null) {
                return PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.posts!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final post = snapshot.data!.posts![index];
                    return Stack(
                      children: [
                        PageView.builder(
                          itemCount: post.images!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, imageIndex) {
                            final image = post.images![imageIndex];
                            return image.isFirstPic == 10
                                ? VideoPlayerWidget(videoUrl: post.postVideo!)
                                : Image.network(post.profileImage!);
                          },
                          onPageChanged: (imageIndex) {
                              provider.setPageIndex = imageIndex;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: SizedBox(
                            height: 85,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                BorderedContainer(
                                  title: 'Add Listing',
                                  child: Icon(
                                    Icons.add,
                                    color: currentTheme.white,
                                  ),
                                ),
                                gapH10,
                                BorderedContainer(
                                  title: 'Search',
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SvgPicture.asset(
                                      'assets/images/search.svg',
                                      colorFilter: ColorFilter.mode(
                                          currentTheme.white, BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                               gapH10,
                                BorderedContainer(
                                  title: 'Notification',
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/bell.svg',
                                          colorFilter: ColorFilter.mode(
                                              currentTheme.white, BlendMode.srcIn),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentTheme.yellow,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                gapH10,
                                BorderedContainer(
                                    title: 'Electronics',
                                    child:
                                        Image.asset('assets/images/electronics.png')),
                                gapH10,
                                BorderedContainer(
                                    title: 'Appliances',
                                    child:
                                        Image.asset('assets/images/appliances.png')),
                                gapH10,
                                BorderedContainer(
                                    title: 'Mobile',
                                    child: Image.asset('assets/images/mobile.png')),
                                gapH10,
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Column(
                            children: [
                              GradientContainer(
                                imagePath: 'assets/images/offer.svg',
                                title: post.offers.toString() ?? 'Offer',
                                isDot: true,
                              ),
                              gapH14,
                              GradientContainer(
                                imagePath: 'assets/images/heart.svg',
                                title: post.likes.toString(),
                              ),
                              gapH14,
                               GradientContainer(
                                imagePath: 'assets/images/chat.svg',
                                title: post.comments.toString(),
                              ),
                              gapH14,
                               GradientContainer(
                                imagePath: 'assets/images/share.svg',
                                title: post.shares.toString(),
                              ),
                              gapH14,
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        currentTheme.lightBlue,
                                        currentTheme.tealAccent
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    )),
                                child: post.profileImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.network(post.profileImage!))
                                    : Image.asset('assets/images/profile.png'),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: SizedBox(
                            width: getWidth(context)*0.55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: post.postTitle ?? 'Macbook Air 2013',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: currentTheme.white,
                                ),
                                CustomText(
                                  text: 'AED ${post.price ?? '1200'}',
                                  color: currentTheme.paleYellow,
                                  weight: FontWeight.w700,
                                  textAlign: TextAlign.start,
                                  size: 24,
                                ),
                                CustomText(
                                  text: post.description == ''
                                      ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur adipiscing elit '
                                      : post.description ??
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur adipiscing eli',
                                  size: 13,
                                  textAlign: TextAlign.start,
                                  lines: 2,
                                  overFlow: TextOverflow.ellipsis,
                                  weight: FontWeight.w600,
                                  color: currentTheme.white,
                                ),
                                CustomText(
                                  text: post.hashtagTitles ?? '',
                                  size: 13,
                                  textAlign: TextAlign.start,
                                  lines: 2,
                                  weight: FontWeight.w600,
                                  color: currentTheme.white,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          ),
                                      child: Image.asset('assets/images/mobile.png'),
                                    ),
                                    gapH10,
                                    CustomText(
                                      text: post.country ?? '',
                                      size: 13,
                                      lines: 1,
                                      weight: FontWeight.w600,
                                      color: currentTheme.white,
                                    ),
                                  ],
                                ),
                               gapH10,
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        currentTheme.lightBlue,
                                        currentTheme.tealAccent
                                      ],
                                  ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Visit Website',
                                      size: 14,
                                      weight: FontWeight.w700,
                                      color: currentTheme.white,
                                    ),
                                  ),
                                ),
                                gapH10,
                                Indicators(
                                  length: post.images!.length,
                                  currentIndex: provider.currentPageIndex,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  onPageChanged: (imageIndex) {
                  provider.setPageIndex = 0;
                  },
                );
              } else {
                return const Center(
                  child: Text('No posts available.'),
                );
              }
            },
          );
        }
      ),
    );
  }
}
