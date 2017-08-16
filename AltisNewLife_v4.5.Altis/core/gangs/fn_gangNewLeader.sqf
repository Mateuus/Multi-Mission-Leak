#include <macro.h>
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;
if((lbCurSel 2621) == -1) exitWith {hint "Vous devez d'abord choisir une perosnne !"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous etes deja le chef !"};
_action = [
	format["Vous allez transferer le commandement à %1<br/>Vous n'aurez plus le controle de ce gang a moins qu'on vous transfert le commandement a nouveau",_unit getVariable ["realname",name _unit]],
	"Transferer le commandement",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if(_action) then {
	_unitID = getPlayerUID _unit;
	if(_unitID == "") exitWith {hint "Bad UID?"};
	grpPlayer SVAR["gang_owner",_unitID,true];
	grpPlayer selectLeader _unit;
	[[_unit,grpPlayer],"TON_fnc_clientGangLeader",_unit,false] spawn life_fnc_MP; 
	[[3,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	hint localize "STR_GNOTF_TransferCancel";
};
[] call life_fnc_gangMenu;