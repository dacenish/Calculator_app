import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  } 
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

 
  final String title;

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output ="0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    
    if(buttonText == "CLEAR"){
      _output ="0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0"; 
    } else if(buttonText == "."){

      if(_output.contains(".")) {
        print('Already contains a decimal');
        return;
      } else{
        _output = _output + buttonText;
      }
    } else if (buttonText == "="){

       num2 = double.parse(output);

       if (operand == "+"){
         _output = (num1 + num2).toString();
       }
       if (operand == "-"){
         _output = (num1 - num2).toString();
       }
       if (operand == "x"){
         _output = (num1 * num2).toString();
       }
       if (operand == "/"){
         _output = (num1 / num2).toString();
       }

       num1 = 0.0;
       num2 = 0.0;
       operand = "";
      
    } else {
      _output = _output + buttonText;
    }
    print(output);
    setState(() {
      
      output = double.parse(_output).toStringAsFixed(2); 

    });
  }

 Widget BuildButton(String buttonText){
   return Expanded(
        child: OutlinedButton(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        
               ),
   );
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),
      body: Container(
        child:  Column(
          children: [

              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
                child: Text(output, style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ))),

              Expanded(
                child: Divider(),
                 ),

               Column(
                 children: [
                   Row(
                     children: [
                      BuildButton("7"),
                      BuildButton("8"),
                      BuildButton("9"),
                      BuildButton("/"),
                     ]),

                      Row(
                     children: [
                      BuildButton("4"),
                      BuildButton("5"),
                      BuildButton("6"),
                      BuildButton("x"),
                     ]),

                      Row(
                     children: [
                      BuildButton("1"),
                      BuildButton("2"),
                      BuildButton("3"),
                      BuildButton("- "),
                     ]),

                      Row(
                     children: [
                      BuildButton("."),
                      BuildButton("0"),
                      BuildButton("00"),
                      BuildButton("+"),
                     ]),

                      Row(
                     children: [
                      BuildButton("CLEAR"),
                      BuildButton("="),
                     ]),
                 ],
               )

          ],
        ),
      ) 
      
    );
  }
}
