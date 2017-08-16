[] spawn 
{
   LeoHintList = "";   
   {     
   LeoHintList = LeoHintList + format["%1\n",_x];     
   hintsilent LeoHintList;
   sleep 0.2;   
   } foreach (call sell_Array);  
   
};