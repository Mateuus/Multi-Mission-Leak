/*
file name: fn_freeCombatlogers.sqf

Author: Barney
Description : BLAHBLAHBLAH
*/

disableSerialization;


private ["_display","_listbox","_Geknastete","_players","_tempArray","_tempGuid","_objektGefangene","_temp","_temp1","_Gefangene","_wo","_foreachIndex"];
closeDialog 0;
createDialog "jail_combatlog";
_display = findDisplay 2705;
_listbox = _display displayCtrl 2701;

_Geknastete = combatlogJail getVariable["Gefangene",[]];
_players = [];
_tempArray = [];
_tempGuid =  [];
_objektGefangene =  [];
_Gefangene = [];

{
	if(side _x == civilian) then {
		_tempArray = [];
		_temp = getPlayerUID _x;
		_tempArray pushback _temp;

		_temp1 = _x;
		_tempArray pushback _temp1;

		_Gefangene pushback _tempArray;

	};

} foreach playableUnits;




{
	_tempGuid pushBack (_x select 0);
} forEach _Gefangene;



{
	if(_x in _tempGuid) then {
		_wo = _tempGuid find _x;

		_objektGefangene pushback ((_Gefangene select _wo) select 1);
	};

} foreach _Geknastete;

waitUntil {dialog};

{
	_listbox lbadd name _x;
	_listbox lbsetdata[_foreachIndex,netid _x];
}foreach _objektGefangene;