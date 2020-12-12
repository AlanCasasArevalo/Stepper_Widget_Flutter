import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper widget',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  List<Step> _mySteps = [
    Step(
        title: Text('Paso 1'),
        subtitle: Text('Este paso te ayuda a .....'),
        content: Text('Aprendiendo Flutter')),
    Step(
        title: Text('Paso 2'),
        subtitle: Text('Este paso te ayuda a .....'),
        content: Text('Aprendiendo Flutter')),
    Step(
      title: Text('Paso 3'),
      subtitle: Text('Este paso te ayuda a .....'),
      content: Text('Aprendiendo Flutter'),
    ),
    Step(
        title: Text('Paso 4'),
        subtitle: Text('Este paso te ayuda a .....'),
        content: Text('Aprendiendo Flutter')),
    Step(
        title: Text('Paso 5'),
        subtitle: Text('Este paso te ayuda a .....'),
        content: Text('Aprendiendo Flutter'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Widget'),
      ),
      body: Container(
        child: Stepper(
          type: StepperType.vertical,
          currentStep: this._currentStep,
          steps: _mySteps,
          onStepContinue: () {
            setState(() {
              this._currentStep < _mySteps.length - 1
                  ? this._currentStep++
                  : this._currentStep = 0;
            });
          },
          onStepCancel: () {
            setState(() {
              this._currentStep == 0
                  ? this._currentStep = 0
                  : this._currentStep--;
            });
          },
          onStepTapped: (step) {
            setState(() {
              print("$step");
            });
          },
        ),
      ),
    );
  }
}
