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
        // Ensures the resized widget stays at the bottom of the screen.
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          // Sets the height from the percentage left in the timer.
          height: MediaQuery.of(context).size.height * state.level,
          // Time it take to resize widget.
          duration: Duration(seconds: 1),
          child: WaveWidget(
            config: CustomConfig(
              // Color gradients for each layer
              gradients: [
                [
                  Color(0xFFC31717),
                  Color(0xCCCD4C10),
                  Color(0xAAFABF3D),
                ],
                [
                  Color(0xFFC31717),
                  Color(0xCCCD4C10),
                  Color(0xAAFFB356),
                ],
                [
                  Color(0xFFC31717),
                  Color(0xCCff7637),
                  Color(0xAAFF8D00),
                ],
              ],
              // Milliseconds for each layer's animation to complete.
              durations: [19440, 10800, 6000],
              // Set to negative values (overflow) to be visible when the
              // timer is complete
              heightPercentages: [-0.03, -0.01, -0.02],
              gradientBegin: Alignment.bottomCenter,
              gradientEnd: Alignment.topCenter,
            ),
            size: Size(double.infinity, double.infinity),
            // Width of the waves
            waveFrequency: 0.4,
          ),
        ),
      ),
    );
  }
}
