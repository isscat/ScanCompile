import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
          child: GestureDetector(
            onTap: invokeCame,
                        child: Image.asset('assets/camera.png'),
                      ),
                    
                  ),
                );
              }
            
              void invokeCame() {

              }
}