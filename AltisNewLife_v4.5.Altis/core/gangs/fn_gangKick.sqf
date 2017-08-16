#include <macro.h>
private["_unit","_unitID","_members"];
disableSerialization;
if((lbCurSel 2621) == -1) exitWith {hint "Vous devez choisir une personne a virer !"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous ne pouvez pas vous virer vous meme !"};
_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
grpPlayer SVAR["gang_members",_members,true];
[[_unit,grpPlayer],"TON_fnc_clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
closeDialog 0;
[] call life_fnc_gangMenu;