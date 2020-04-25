import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int puntaje;
  final Function resetApp;
  Result({@required this.puntaje, this.resetApp});
  String get resultText{
    String result;
    if(this.puntaje<=8){
        result='Normal';
    }else if(this.puntaje<=12){
        result='Strange';
    }else if(this.puntaje<=16){
       result='No lo se rick';
    }else{
        result='You are so bad';
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Puntaje: ${this.puntaje}',
              style: TextStyle(
                fontSize: 36,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: ClipRRect(

                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    height: 350.0,
                    width: 350.0,                      
                    image: NetworkImage('https://k60.kn3.net/taringa/1/A/A/6/0/1/JuanOrdonezGomez/94A.jpg'),
                    placeholder: AssetImage('assets/i2B6aoIg8U0WQ.gif')
                  )
                )
                
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child:Text(
                    resultText,
                    style:TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed:resetApp,
                child:Text('Reset Quiz',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic
                ),
                ) ,)
            ],
          ),
        ),
      )
  );
}
    
    
    
    
    
    
}

// FadeInImage(

                    
//                     image: NetworkImage('https://k60.kn3.net/taringa/1/A/A/6/0/1/JuanOrdonezGomez/94A.jpg'),
//                     placeholder: AssetImage('assets/i2B6aoIg8U0WQ.gif'),
//                     fit: BoxFit.cover,
//                   )