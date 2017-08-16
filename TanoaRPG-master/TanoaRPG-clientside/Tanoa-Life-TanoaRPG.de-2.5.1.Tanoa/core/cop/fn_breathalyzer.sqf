/*
	file:fn_breathalyzer
	author:[midgetgrimm]
	
	descrip:
	allows cop to breathalyze player
*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _cop) exitWith {};
_drinky = life_drink;
if(_drinky > 0.04) then {
	[1,format["Alkohol Test beim Spieler: %1 \n\n Promille: %2 \n\n Sie sind über den Grenzwert! ",name player,[_drinky] call tanoarpg_fnc_numberText]] remoteExec ["tanoarpg_fnc_broadcast", _cop, false];
} else {
	[1,format["Alkohol test %1 \n\n Promille: %2 \n\n Sie sind unter den Grenzwert",name player,[_drinky] call tanoarpg_fnc_numberText]] remoteExec ["tanoarpg_fnc_broadcast", _cop, false];
};