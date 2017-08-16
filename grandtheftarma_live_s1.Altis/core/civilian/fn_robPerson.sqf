private "_robber";
_robber = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
if ( isNull _robber ) exitWith {};

if ( GTA_money_cash > 0 ) then {

	[ [ GTA_money_cash ], "life_fnc_robReceive", _robber ] call GTA_fnc_remoteExec;
	[ [ getPlayerUID _robber, _robber getVariable [ "nametag_title", name _robber ], "211"], "life_fnc_wantedAdd", false ] call GTA_fnc_remoteExec;
	[ [ 1, format [ localize "STR_NOTF_Robbed", _robber getVariable [ "nametag_title", name _robber ], profileName, [ GTA_money_cash ] call life_fnc_numberText ] ], "life_fnc_broadcast" ] call GTA_fnc_remoteExec;
	GTA_money_cash = 0;

	//--- Update cash
	[ 0 ] call GTA_fnc_updatePlayerPartial;

} else {

	[ [ 2, format [ localize "STR_NOTF_RobFail", profileName ] ], "life_fnc_broadcast", _robber ] call GTA_fnc_remoteExec;

};