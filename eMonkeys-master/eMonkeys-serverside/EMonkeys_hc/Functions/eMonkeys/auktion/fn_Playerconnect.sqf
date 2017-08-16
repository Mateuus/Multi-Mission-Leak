/* 
 Author: Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
*/ 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {}; 
 
_query = format["UPDATE players SET  online='1',lastjoin = CURRENT_TIMESTAMP WHERE playerid='%1'", _uid]; 
[_query,1] call DB_fnc_asyncCall; 
 
_text = format ["*** Player connect | SpielerID: %1 |",_uid]; 
[7,_text] call TON_fnc_log;