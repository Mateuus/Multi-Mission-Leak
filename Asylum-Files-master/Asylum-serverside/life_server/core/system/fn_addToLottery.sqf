 
 
 
 
 
 
 
 
private ["_unit","_ticket","_jackpot"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
if (isNull _unit) exitWith {}; 
 
_jackpot = life_configuration select 8; 
_ticket = floor (random 1000);  
 
if (_ticket == 0) then  
{ 
[[_jackpot * 1000],"life_fnc_jackpot",_unit,false] spawn life_fnc_MP; 
[777, _unit, format["Won lottery for $%1", [_jackpot * 1000] call life_fnc_numberText]] call ASY_fnc_logIt; 
_jackpot = 25;  
} 
else 
{ 
[[[0,1,2],"Sorry, try again."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
_jackpot = _jackpot + 1;  
}; 
 
life_configuration set [8, _jackpot]; 
publicVariable "life_configuration"; 
[] spawn DB_fnc_updateConfig;