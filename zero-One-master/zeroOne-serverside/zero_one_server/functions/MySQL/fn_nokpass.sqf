/* 
 File: fn_nokpass.sqf 
 Author: Nokman 
 
 Description: 
 pass aus der DB auslesen und den Spieler zusenden 
*/ 
private["_side","_query","_queryRe"]; 
params ["_player","_uid","_playerside"]; 
_side = switch (_playerside) do { 
 case west : {"playerpasscop"}; 
 case east : {"playerpassreb"}; 
 case independent : {"playerpassmed"}; 
 default {"playerpass"}; 
}; 
_query = format["%2:%1",_uid,_side]; 
_queryRe = [_query,2] call zero_fnc_asyncCall; 
if(count _queryRe > 0) then  { 
 _queryRe = _queryRe call zero_fnc_mresToArray; 
 if(typeName _queryRe == "STRING") then {_queryRe = call compile format["%1", _queryRe];}; 
 [_queryRe,""] remoteExec ["zero_fnc_gCQd",owner _player]; 
} else { 
 ["",name _player] remoteExec ["zero_fnc_gCQd",owner _player]; 
}; 
