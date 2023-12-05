import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/game_logic.dart';
import 'package:flutter_application_1/provider/normal_game.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class GameplayScreen extends StatefulWidget {
  const GameplayScreen({super.key});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  late List<bool> _showFrontSideList;
  late List<bool> _cardBlock;
  late bool _flipXAxis;
  late final GameLogic game = GameLogic();
  List<String> cards = [];
  bool temporaryBlock = true;
  int dimension = NormalGame.helper.dropdownValue;

  int _firstCard = -1;
  int _secondCard = -1;
  double minutosIniciais = 0;
  int tempo = 0;
  bool fimTempo = false;
  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(mode: StopWatchMode.countDown);

  @override
  void initState() {
    super.initState();

    cards = game.drawer();
    _showFrontSideList = List.generate(cards.length, (index) => false);
    _cardBlock = List.generate(cards.length, (index) => false);

    _flipXAxis = true;
    startDemo();

    if (dimension == 2) {
      minutosIniciais = 0.08;
    } else if (dimension == 4) {
      minutosIniciais = 1;
    } else if (dimension == 6) {
      minutosIniciais = 2;
    } else {
      minutosIniciais = 3;
    }
    tempo = (minutosIniciais * 60).toInt();

    _stopWatchTimer.setPresetTime(mSec: tempo * 1000);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: const Text(
          "Jogo",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: [
          IconButton(
            icon: RotatedBox(
              quarterTurns: _flipXAxis ? 0 : 1,
              child: const Icon(Icons.flip),
            ),
            onPressed: _changeRotationAxis,
          ),
        ],
      ),
      body: Column(children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: NormalGame.helper.dropdownValue,
            childAspectRatio: 3.3 / 4,
            crossAxisSpacing: 3.0,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: _buildFlipAnimation(cards[index], index),
                ),
              ],
            );
          },
        ),
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: 0,
          builder: (context, snap) {
            final value = snap.data;
            final displayTime = StopWatchTimer.getDisplayTime(value!);
            print('Listen every second. $value');
            return Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            displayTime.toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
              ],
            );
          },
        ),
      ]),
    );
  }

  void startDemo() async {
    int interval = 1000;
    for (int j = 0; j < NormalGame.helper.dropdownValue; j++) {
      await Future.delayed(Duration(milliseconds: interval));
    }
    _showFrontSideList.asMap().forEach((index, element) {
      setState(() {
        _showFrontSideList[index] = !_showFrontSideList[index];
      });
    });
    temporaryBlock = false;
    _stopWatchTimer.onStartTimer();
  }

  void checkMatch() async {
    if (_firstCard != -1 && _secondCard != -1) {
      if (cards[_firstCard] == cards[_secondCard]) {
        _firstCard = -1;
        _secondCard = -1;
      } else {
        _cardBlock[_firstCard] = false;
        _cardBlock[_secondCard] = false;

        temporaryBlock = true;
        await Future.delayed(const Duration(milliseconds: 1000));
        setState(() {
          _showFrontSideList[_firstCard] = !_showFrontSideList[_firstCard];
          _showFrontSideList[_secondCard] = !_showFrontSideList[_secondCard];
        });
        _firstCard = -1;
        _secondCard = -1;
        temporaryBlock = false;
      }
    }
  }

  void _switchCard(int index) {
    if (!_cardBlock[index] && !temporaryBlock) {
      if (_firstCard == -1) {
        _firstCard = index;
      } else if (_secondCard == -1) {
        _secondCard = index;
      }
      setState(() {
        _showFrontSideList[index] = !_showFrontSideList[index];
      });
      _cardBlock[index] = true;
      checkMatch();
    }
  }

  void _changeRotationAxis() {
    setState(() {
      _flipXAxis = !_flipXAxis;
    });
  }

  Widget _buildFlipAnimation(String card, int index) {
    return GestureDetector(
      onTap: () => _switchCard(index),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: _showFrontSideList[index] ? _buildFront(card) : _buildRear(card),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSideList) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildFront(String card) {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: "Front",
      card: card,
      child: const Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget _buildRear(String card) {
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.blue.shade700,
      faceName: "Rear",
      card: card,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child:
              Center(child: Text("Flutter", style: TextStyle(fontSize: 50.0))),
        ),
      ),
    );
  }

  Widget __buildLayout({
    required Key key,
    required Widget child,
    required String faceName,
    required Color backgroundColor,
    required String card,
  }) {
    if (faceName == 'Rear') {
      return Container(
        key: key,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundColor,
        ),
        child: Center(
          child: ClipRRect(child: Image.asset('../assets/images/$card.png')),
        ),
      );
    } else {
      return Container(
        key: key,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundColor,
        ),
        child: Center(
          child:
              ClipRRect(child: Image.asset('../assets/images/cartaBack.png')),
        ),
      );
    }
  }
}
