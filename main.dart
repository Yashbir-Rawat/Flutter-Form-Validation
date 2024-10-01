import 'package:flutter/material.dart' ;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title : 'flutter_application_2',
      theme : ThemeData(
        primarySwatch: Colors.red,
      ),
      home : Home(),
    );
  }
}

class Home extends StatefulWidget{
  const Home({super.key});
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  //Order _order = Order();

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title : Text('Form Validation'),
        centerTitle : true,
      ),
      body : SafeArea(
        child : Column(
          children : [
            Form(
              key : _formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child : Padding(
                padding : EdgeInsets.all(16.0),
                child : Column(
                  children : [


                    TextFormField(
                      decoration: InputDecoration(
                        hintText : 'Pizza',
                        labelText : 'Item',
                      ),
                      
                      validator : (String? value) => _validateItemRequired(value),

                      //onSaved : (value) => order.item=value,

                    ),


                    TextFormField(
                      decoration : InputDecoration(
                        hintText : '2',
                        labelText : 'Quantity',
                      ),

                      validator : (String? value) => _validateItemCount(value),

                      //onSaved : (value) => order.quantity = int.tryParse(value),

                    ),


                    Divider(height : 32.0,),
                    ElevatedButton(
                      child : Text('Save'),
                      
                      onPressed:(){
                        if(_formStateKey.currentState!.validate()){

                        }
                      },
                      //=>_submitOrder(), 
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**class Order{
  String item;
  int quantity;
}**/

String? _validateItemRequired(String? value){
  if(value == null || value.isEmpty){
    return 'Item Required';
  }
  return null;
}

String? _validateItemCount(String? value){
  int? _valueAsInteger;
  if(value == null || value.isEmpty){
    _valueAsInteger = 0;
  }
  else{
    _valueAsInteger = int.tryParse(value);
  }
  if(_valueAsInteger==0){
    return 'Atleast one item required';
  }
  return null;
}

/**void _submitOrder(){
  if(_formStateKey.currentState.validate()){
    _formStateKey.currentState.save();
    print('Order item : ${order.item}');
    print('Order quantity : ${order.quantity}');
  }
}**/