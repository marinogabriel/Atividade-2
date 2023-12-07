import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/manage_bloc.dart';
import 'package:flutter_application_1/model/match.dart';
import 'package:flutter_application_1/provider/firebase_firestore.dart';
import 'package:flutter_application_1/provider/game_logic.dart';
import 'package:flutter_application_1/provider/normal_game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class GameplayScreen extends StatefulWidget {
  const GameplayScreen({super.key});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

Partida partida = Partida();

class _GameplayScreenState extends State<GameplayScreen> {
  late List<bool> _showFrontSideList;
  late List<bool> _cardBlock;
  late bool _flipXAxis;
  late final GameLogic game = GameLogic();
  List<String> cards = [];
  bool temporaryBlock = true;
  //informacoes sobre o jogo
  String dimension = NormalGame.helper.dropdownValue.toString();
  final uid = FirestoreDatabase.helper.uid!;
  final DateTime _now = DateTime.now();
  late DateTime dateGame;
  late int tempoUsado;

  int _firstCard = -1;
  int _secondCard = -1;
  double minutosIniciais = 0;
  int tempo = 0;
  int tempoMilisegundos = 0;
  bool fimTempo = false;
  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(mode: StopWatchMode.countDown);

  @override
  void initState() {
    super.initState();
    dateGame = DateTime(
        _now.year, _now.month, _now.day, _now.hour, _now.minute, _now.second);
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
    tempoMilisegundos = tempo * 1000;

    _stopWatchTimer.setPresetTime(mSec: tempo * 1000);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  void _showWinnerSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Parabéns!',
          message: 'Você ganhou!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      ));
  }

  void _showLoserSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Que pena!',
          message: 'Você perdeu!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: Column(children: [
        Text(
          'Modo $dimension X $dimension',
          style: GoogleFonts.permanentMarker(
            color: const Color(0xff1D1617),
            fontSize: size.height * 0.08,
          ),
        ),
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
          initialData: 1,
          builder: (context, snap) {
            final value = snap.data;
            final displayTime = StopWatchTimer.getDisplayTime(value!);
            final resto = value / tempo;

            if (_cardBlock.every((element) => element == true)) {
              tempoUsado = tempoMilisegundos - value;
              _stopWatchTimer.onStopTimer();
              partida.date = dateGame;
              partida.duration = tempoUsado;
              partida.size = dimension;
              partida.uid = FirestoreDatabase.helper.uid!;
              partida.win = 1;
              try {
                BlocProvider.of<ManageBloc>(context)
                    .add(SubmitMatchEvent(match: partida));
              } catch (e) {
                print('Erro: $e');
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _showWinnerSnackbar(context);
              });
              temporaryBlock = true;
            } else if (value == 0) {
              temporaryBlock = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _showLoserSnackbar(context);
              });
              //cadastrar derrota aqui info do banco aqui
            }

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
                            style: GoogleFonts.permanentMarker(
                              color: (resto < 300)
                                  ? Colors.red
                                  : (resto < 600)
                                      ? Colors.amber[400]
                                      : Colors.lightGreen,
                              fontSize: size.height * 0.05,
                            ),
                          ),
                        ),
                      ],
                    )),
                surrenderButton(),
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
      key: const ValueKey(false),
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

  Widget surrenderButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.005),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: (temporaryBlock)
                ? const Color.fromARGB(255, 107, 107, 107)
                : const Color.fromARGB(255, 255, 0, 38),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02, bottom: size.height * 0.02),
            child: Text(
              "Desistir",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: size.height * 0.02,
                  fontStyle: FontStyle.normal),
            ),
          ),
          onPressed: () {
            if (temporaryBlock) {
            } else {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              //cadastrar derrota aqui
            }
          },
        ),
      ),
    );
  }
}
