#include <macro.h>
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
_gangName = _group getVariable "gang_name";
_action = [
	format["%1 vous a invité a rejoindre son gang %2",_name,_gangName],
	"Faire partie du gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if(_action) then {
	[player] join _group;
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer SVAR["gang_members",_grpMembers,true];
	[[4,_grpMembers],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
};