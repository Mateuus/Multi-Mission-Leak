 
 
 
params["_player","_moneyOwed"]; 
 
_pia = MafiaLoan1 FIND _player; 
 
if((_moneyOwed select 1) == 0) exitwith { 
MafiaLoan1 DELETEAT _pia; 
MafiaLoan2 DELETEAT _pia; 
}; 
 
if(_pia == -1) exitwith { 
MafiaLoan1 pushback _player; 
MafiaLoan2 pushback _moneyOwed; 
}; 
 
MafiaLoan2 set [_pia, _moneyOwed];  
