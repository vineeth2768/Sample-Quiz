import 'package:flutter/material.dart';
import 'package:sample_api/api/api_services.dart';
import 'package:sample_api/core/constents/buttons/buttons.dart';
import 'package:sample_api/core/constents/colors/colors.dart';
import 'package:sample_api/core/constents/height_width/height_width.dart';
import 'package:sample_api/models/questions_model.dart';

class ScreenQuestions extends StatefulWidget {
  const ScreenQuestions({Key? key}) : super(key: key);

  @override
  State<ScreenQuestions> createState() => _ScreenQuestionsState();
}

class _ScreenQuestionsState extends State<ScreenQuestions> {
  final List<List<String>> _listAnswers = [
    [
      'conversation',
      'collaboration',
      'communication',
      'curation',
    ],
    [
      'Maradona',
      'Pele',
      'C.Ronaldo',
      'Leo Messi',
    ],
    [
      'Twitter',
      'Instagram',
      'Whatsapp',
      'FaceBook',
    ],
    [
      '-10',
      '-5',
      '0',
      '5',
    ],
    [
      'Order of Significance',
      'Open Software',
      'Operating System',
      'Optical Sensor',
    ],
    [
      'September ',
      'January ',
      'November ',
      'October ',
    ],
  ];

  int _index = 0;

  List<QuestionsModel> listQuestions = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    listQuestions = (await ApiServices().getQuestions());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(title: const Text('Questions')),
      body: listQuestions.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight10,
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Question ${_index + 1}'),
                          kHeight10,
                          Text(listQuestions[_index].question)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Choices'),
                          kHeight10,
                          Builder(
                            builder: (context) {
                              final List<String> _answers =
                                  listQuestions[_index].incorrectAnswers;

                              _answers.add(listQuestions[_index].correctAnswer);
                              return Column(
                                children: List<Row>.generate(
                                  _answers.length,
                                  (index) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Checkbox(
                                            value: false,
                                            onChanged: (value) {}),
                                        Text(
                                          _answers[index],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          kHeight40,
                          Align(
                            alignment: Alignment.center,
                            child: ButtonWidgets(
                              title: 'NEXT',
                              onPressed: () {
                                if (_index < listQuestions.length) {
                                  _index++;
                                  setState(() {});
                                } else {}
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
