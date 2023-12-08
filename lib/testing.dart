import 'dart:async';
int xy=0;
void main() {
  // Start the periodic printing
  edit();
  startPeriodicPrinting(10);
  print("main ${xy}");
}
Future<void> edit()async{
Timer.periodic(Duration(seconds: 2), 
  (Timer timer) {
    print("hai");
  xy=1;
      
      timer.cancel();
    
  }); 
}
void startPeriodicPrinting(int x) {
  int y=0;
  Timer.periodic(Duration(milliseconds: 100), 
  (Timer timer) {
  print("gogo");
    y+=1;
    print(y);
    if(y==10){
      print(y);
      timer.cancel();
    }
  }
  );
}