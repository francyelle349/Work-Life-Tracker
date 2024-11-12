import 'dart:collection';
import 'dart:math';

var suggestionList = { "Working beyond 8 hours can impact your cognitive performance. Try scaling back." : 1, "Take a 5-minute break every 25 minutes to refresh your mind—try the Pomodoro Technique." : 2, "Too many pauses? Aim for uninterrupted focus periods to maximize deep work." : 3, "Staying productive doesn\’t mean overworking—prioritize rest for sustainable growth." : 4 };

List lista = ["Working beyond 8 hours can impact your cognitive performance. Try scaling back.", "Take a 5-minute break every 25 minutes to refresh your mind—try the Pomodoro Technique." ,  "Staying productive doesnt mean overworking—prioritize rest for sustainable growth." ,"Structure your day with planned blocks of work and relaxation for better efficiency." , "Did you know? Regular breaks reduce stress and boost creativity!"
,"Too many pauses? Aim for uninterrupted focus periods to maximize deep work.", ];

int PauseNumber = 0;
int WorkerHours = 0;
 var rng = Random(3); 

 bool PauseNumberMethod(){
 if(PauseNumber > 70){
  return true;
 }
 else{
  return false;
 }
}

String WorkerHoursMethod(int WorkHours){

  if(WorkHours > 16){
    return lista[rng.nextInt(4)];
  }
  else{
    return lista[5];
  }

}



