#include "..\script_macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
params [
	["_robber",objNull,[objNull]]
];

if(isNull _robber) exitWith {}; //No one to return it to?

_toLog = format ["Name: %1 (%2) wurde von %3 (%4) %5 $ geraubt", player getVariable["realname",name player], getPlayerUID player, name _robber, getPlayerUID _robber, [ES_cash] call ES_fnc_numberText];
["ROB_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

if(ES_cash > 0) then {

	switch (true) do {
		case (ES_cash < 0) : {ES_cash = 0;};
		case (ES_cash > 2000000) : {ES_cash = 250000;};
		case (ES_cash > 1000000) : {ES_cash = 150000;};
		case (ES_cash > 750000) : {ES_cash = 100000;};
		default {};
	};

	[[ES_cash,player,_robber],"ES_fnc_robReceive",_robber,false] call ES_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"],"ES_fnc_wantedAdd",false,false] call ES_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable ["realname",name _robber],profileName,[ES_cash] call ES_fnc_numberText]],"ES_fnc_broadcast",nil,false] call ES_fnc_MP; 	

	ES_cash = 0;
	[] call SOCK_fnc_syncData;
	[] call SOCK_fnc_updateRequest;
} else {
	[[2,"STR_NOTF_RobFail",true,[profileName]],"ES_fnc_broadcast",_robber,false] call ES_fnc_MP;
};
[0] call SOCK_fnc_updatePartial;
