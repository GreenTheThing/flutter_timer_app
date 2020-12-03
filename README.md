# TimerApp

A Flutter timer application with animated background and a spinner dialog for setting the duration.

## Info

I created this app as a way to familiarize myself with the BLoc Architecture and Flutter.

The starting point for the app was [this tutorial](https://bloclibrary.dev/#/fluttertimertutorial) on the official BLoC Library website (source code for the tutorial can be found [here](https://github.com/felangel/Bloc/tree/master/examples/flutter_timer)). 

## Contributions
1. App level:
* Addded a "set timer" pop-up dialog to change the timer duration. 
* Created 2 differently stylized dialogs to match the design of the platform it is running on - iOS or Android.
* Animated background that changes height from 100% to 0% based in the duration left on the timer.
* UI changes and improvements.

2. Project level:
* Reoragnize flies into a more scalable architecture (for proof of concept purposes).
* Extract some widgets into separate files to improve code readability.
* Reformating, clean-up and commenting the code to imporve readability.
