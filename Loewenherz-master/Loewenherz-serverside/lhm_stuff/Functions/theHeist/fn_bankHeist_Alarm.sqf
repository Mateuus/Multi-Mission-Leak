 
/* 
 Filename: fn_bankHeist_alarm.sqf 
 Author: Blackd0g 
 
 Description: Starts the bank alarm 
*/ 
private ["_fed_alarm_bank1","_fed_alarm_bank2","_fed_alarm_bank3","_fed_alarm_bank4"]; 
 
bankHeistAlarmTriggered = true; 
 
// trigger alarm sound 
[] spawn { 
 for "_i" from 0 to 3 step 1 do 
 { 
  { 
   [[_x,"bankalarm"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
  } forEach [fed_alarm_bank,fed_alarm_1,fed_alarm_2,fed_alarm_3]; 
  sleep 25; 
 }; 
}; 
 
// Inform bank team 
 
[     [      [       ["ALARM AKTIVERT","<t align = 'center' shadow = '1' size = '0.7' color='#df0101' font='PuristaBold'>%1</t>"],       [format["%1h %2min",date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"],       ["Bringt den Job schnell zu Ende!","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"]      ]     ],"BIS_fnc_typeText",BankHeist_Team,false] call LHM_fnc_MP; 
 
// inform cops 
 
[     [      [       ["BANKÜBERFALL","<t align = 'center' shadow = '1' size = '0.7' color='#df0101' font='PuristaBold'>%1</t>"],       [format["%1h %2min",date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"],       ["Alle verfügbaren Einheiten melden sich umgehend bei der OPL!","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"]      ]     ],"BIS_fnc_typeText",west,false] call LHM_fnc_MP; 
sleep 60; 
[     [      [       ["BANKÜBERFALL","<t align = 'center' shadow = '1' size = '0.7' color='#df0101' font='PuristaBold'>%1</t>"],       [format["%1h %2min",date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"],       ["Alle verfügbaren Einheiten melden sich umgehend bei der OPL!","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"]      ]     ],"BIS_fnc_typeText",west,false] call LHM_fnc_MP; 
sleep 60; 
[     [      [       ["BANKÜBERFALL","<t align = 'center' shadow = '1' size = '0.7' color='#df0101' font='PuristaBold'>%1</t>"],       [format["%1h %2min",date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.7' color='#b71c1c' >%1</t><br/>"],       ["Alle verfügbaren Einheiten melden sich umgehend bei der OPL!","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"]      ]     ],"BIS_fnc_typeText",west,false] call LHM_fnc_MP; 
sleep 60;