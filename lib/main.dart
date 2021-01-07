import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  AnimationController animationController;
  Animation animation, transform;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 250.0, end: 200.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
    ));

    transform = BorderRadiusTween(
        begin: BorderRadius.circular(125),
      end: BorderRadius.circular(0.0)

    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn
    ));



    animationController.forward();

  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animationController,
        builder: (BuildContext context, Widget child){
      return new Scaffold(

        // apply it to any widget of your choice !
        // I have just given an example.
        body: Center(
          child: Stack(
            children: [
              Center(
                child:Container(
                  child: CircleAvatar(
            backgroundColor: Colors.pink,

            child: Text('Icon', style: TextStyle(
                fontSize: 20,
                color: Colors.black, fontWeight: FontWeight.bold),),
          ),
                  height: animation.value,
                  width: animation.value,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: transform.value,
                  ),
                ),
              )
            ],
          ),
        ),
      );
        });
  }
}

















