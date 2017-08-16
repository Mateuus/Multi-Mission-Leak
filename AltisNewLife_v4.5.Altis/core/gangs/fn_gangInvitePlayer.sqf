#include <macro.h>
private["_unit"];
disableSerialization;
if((lbCurSel 2632) == -1) exitWith {hint "Vous devez choisir une personne a inviter !"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous ne pouvez pas vous virer vous meme !"};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "Ce type est deja dans un gang"}; //Added
if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Plus de place dans le gang"};
_action = [
	format["Vous allez inviter %1 a rejoindre votre gang, si il accepte il aura accès a votre fond de gang !",_unit getVariable ["realname",name _unit]],
	"Inviter à rejoindre le gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	_members = grpPlayer getVariable "gang_members";
	_members pushBack getPlayerUID _unit;
	grpPlayer SVAR["gang_members",_members,true];
	hint format["Vous avez demandé à %1 de rejoindre votre gang",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation annulée";
};