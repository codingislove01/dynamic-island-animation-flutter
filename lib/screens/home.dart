import 'package:dynamic_island/widgets/call_expanded.dart';
import 'package:dynamic_island/widgets/call_shrinked.dart';
import 'package:dynamic_island/widgets/directions_expanded.dart';
import 'package:dynamic_island/widgets/directions_shrinked.dart';
import 'package:dynamic_island/widgets/music_expanded.dart';
import 'package:dynamic_island/widgets/music_shrinked.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PagesContainer(),
    );
  }
}

class PagesContainer extends StatefulWidget {
  const PagesContainer({super.key});

  @override
  State<PagesContainer> createState() => _PagesContainerState();
}

class _PagesContainerState extends State<PagesContainer> {
  int activePageIndex = 0;
  bool shrinked = true;
  bool showIsland = true;
  static const animationDuration = Duration(milliseconds: 300);
  final PageController controller = PageController();
  final List<Island> islands = [
    Island(
        shrinkedIsland: const CallShrinked(),
        expandedIsland: const CallExpanded(),
        expandedHeight: 75,
        expandedBorderRadius: 40),
    Island(
        shrinkedIsland: const MusicShrinked(),
        expandedIsland: const MusicExpanded(),
        expandedHeight: 180,
        expandedBorderRadius: 40),
    Island(
        shrinkedIsland: const DirectionsShrinked(),
        expandedIsland: const DirectionsExpanded(),
        expandedHeight: 180,
        expandedBorderRadius: 40)
  ];

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  setActivePageIndex(i) {
    setState(() {
      activePageIndex = i;
    });
  }

  toggleIsland() {
    setState(() {
      showIsland = false;
      shrinked = !shrinked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeIsland = islands[activePageIndex];
    final islandToBeShown =
        shrinked ? activeIsland.shrinkedIsland : activeIsland.expandedIsland;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (() => setState(() {
                  if (!shrinked) {
                    toggleIsland();
                  }
                })),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFFFFB6FA),
                    Color(0xFF972ED4),
                    Color(0xFF08015E)
                  ])),
              child: PageView(
                /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                /// Use [Axis.vertical] to scroll vertically.
                controller: controller,
                onPageChanged: setActivePageIndex,
                children: const <Widget>[
                  Center(
                    child: Text(
                      'Calls',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Music',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Navigation',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: toggleIsland,
              child: AnimatedContainer(
                  onEnd: () => setState(() {
                        showIsland = true;
                      }),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                          shrinked ? 20.0 : activeIsland.expandedBorderRadius)),
                  duration: animationDuration,
                  curve: Curves.easeInOut,
                  height: shrinked ? 35 : activeIsland.expandedHeight,
                  width: MediaQuery.of(context).size.width *
                      (shrinked ? 0.5 : 0.95),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (shrinked ? 10.0 : 15.0), vertical: 5),
                    child: AnimatedSwitcher(
                        duration: animationDuration,
                        child: showIsland ? islandToBeShown : const SizedBox()),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class Island {
  Island(
      {required this.shrinkedIsland,
      required this.expandedIsland,
      this.expandedHeight = 200,
      this.expandedBorderRadius = 20.0});
  final Widget shrinkedIsland;
  final Widget expandedIsland;
  double expandedHeight;
  double expandedBorderRadius;
}
