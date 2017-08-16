lotto_spielstatus=1; 
[[0,"Die nächste Lottoziehung beginnt in 10 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60;  
 
[[0,"Die nächste Lottoziehung beginnt in 9 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 8 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 7 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 6 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 5 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 4 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 3 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 2 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 60; 
[[0,"Die nächste Lottoziehung beginnt in 1 Minuten"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 30; 
[[0,"Die nächste Lottoziehung beginnt in 30 Sekunden"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
uiSleep 30; 
 
if (count lotto_spieler>=2) then  
{ 
 _gewinner = lotto_spieler select floor random count lotto_spieler; 
 _count = count lotto_spieler; 
  
 _geld = 25000 * _count; 
  
 _text = format ["%1€ wurde bei der Lotterie ausgezahlt",[_geld] call EMonkeys_fnc_numberText]; 
  
 [[0,_text],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
 [[2,_geld],"EMonkeys_fnc_lotto_response",_gewinner,false] call EMonkeys_fnc_mp; 
  
    lotto_spieler = []; 
    lotto_spielstatus=0; 
  
 _text = format ["*** Lotto | Gewinner: %1 | Betrag: %2 |",_gewinner,[_geld] call EMonkeys_fnc_numberText]; 
 [4,_text]call TON_fnc_log; 
} 
 else  
{ 
    { 
        [[1],"EMonkeys_fnc_lotto_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach lotto_spieler; 
     
 lotto_spieler = []; 
    lotto_spielstatus=0; 
};