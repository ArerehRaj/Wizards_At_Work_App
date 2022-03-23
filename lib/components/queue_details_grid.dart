import 'package:flutter/material.dart';

class QueueDetailsGrid extends StatelessWidget {
  const QueueDetailsGrid({
    Key? key,
    required this.nameOfHospital,
    required this.nameOfDoctor,
    required this.noOfPeopleInFront,
    required this.timeLeftInMins,
    required this.noOfDistributedTokens,
    required this.noOfTokensAvailable,
  }) : super(key: key);
  final String nameOfHospital;
  final String nameOfDoctor;
  final String noOfPeopleInFront;
  final String timeLeftInMins;
  final String noOfDistributedTokens;
  final String noOfTokensAvailable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            nameOfHospital,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            nameOfDoctor,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          noOfPeopleInFront,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'People',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('in Front Of You')],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          timeLeftInMins,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Minutes',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('until your turn.')],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          noOfDistributedTokens,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Tokens',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('have been distributed')],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          noOfTokensAvailable,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Tokens',
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('available')],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Book Queue'),
            ),
          ),
        )
      ],
    );
  }
}
