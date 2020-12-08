package com.practice.bloc_timer

import android.graphics.Color
import android.os.Bundle
import io.flutter.embedding.android.DrawableSplashScreen
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Set flutter window's status bar color to transparent. 
        window.statusBarColor = Color.parseColor("#00000000")
    }

    // provide splash screen to the flutter window.
    override fun provideSplashScreen(): SplashScreen? {
        val splash = resources.getDrawable(R.drawable.launch_background)
        return DrawableSplashScreen(splash)
    }
}
