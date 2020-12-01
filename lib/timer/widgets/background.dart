import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) => Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          height: MediaQuery.of(context).size.height * state.level,
          duration: Duration(seconds: 1),
          child: WaveWidget(
            config: CustomConfig(
              gradients: [
                [
                  Color(0xFFC31717),
                  Color(0xCCCD4C10),
                  Color(0xAAfabf3d),
                ],
                [
                  Color(0xFFC31717),
                  Color(0xCCCD4C10),
                  Color(0xAAffb356),
                ],
                [
                  Color(0xFFC31717),
                  Color(0xCCff7637),
                  Color(0xAAff8d00),
                ],
              ],
              durations: [19440, 10800, 6000],
              heightPercentages: [-0.03, -0.01, -0.02],
              gradientBegin: Alignment.bottomCenter,
              gradientEnd: Alignment.topCenter,
            ),
            size: Size(double.infinity, double.infinity),
            waveFrequency: 0.5,
          ),
        ),
      ),
    );
  }
}
