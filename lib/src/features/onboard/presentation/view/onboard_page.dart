import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:localization/localization.dart';

// https://pub.dev/packages/flutter_onboard
class OnboardPage extends StatelessWidget {
  final PageController _pageController = PageController();

  OnboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 162),
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // print('done tapped');
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Color(0xffFFD54F),
          fontSize: 20,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: const TextStyle(
          fontSize: 18,
          color: Color(0xffFFD54F),
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Color.fromRGBO(255, 255, 255, 0.4),
          activeColor: Color.fromRGBO(255, 255, 255, 1),
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            //print('skipButton pressed');
            Modular.to.navigate('/auth/');
          },
          child: const Text(
            "Entrar",
            style: TextStyle(color: Color(0xffFFD54F)),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 0, 0, 162),
                  /* gradient: const LinearGradient(
                    colors: [
                      Color(0xffFFFF81),
                      Color(0xffFFD54F)
                    ], //FFFF81 C8A415
                  ), */
                ),
                child: Text(
                  state.isLastPage ? "enter".i18n() : "next".i18n(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
      Modular.to.navigate('/auth/');
    }
  }
}

final List<OnBoardModel> onBoardData = [
  OnBoardModel(
    title: "onboard-title".i18n(),
    description: "onboard-description-1".i18n(),
    imgUrl: "lib/assets/images/mapa.png",
  ),
  OnBoardModel(
    title: "",
    description: "onboard-description-2".i18n(),
    imgUrl: 'lib/assets/images/interesses.png',
  ),
  OnBoardModel(
    title: "",
    description: "onboard-description-3".i18n(),
    imgUrl: 'lib/assets/images/locais_recomendados.png',
  ),
  OnBoardModel(
    title: "",
    description: "onboard-description-4".i18n(),
    imgUrl: 'lib/assets/images/pontos_turisticos.png',
  ),
];
