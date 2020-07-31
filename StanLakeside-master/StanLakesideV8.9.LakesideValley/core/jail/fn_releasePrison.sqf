/*
	fn_releasePrison.sqf
*/

_release = _this select 0;

life_is_arrested = false;
[5] call SOCK_fnc_updatePartial;
player setVariable["life_is_arrested", nil, true];
[player] remoteExecCall ["life_fnc_svr_releasePrison",2];
if ( _release == 1 || life_bail_paid ) then {
	
	if (isNil "A3L_Fnc_OldUniform") then 
	{
		player addUniform "A3LShirt";
	} else
	{
		player addUniform A3L_Fnc_OldUniform;
	};
	life_breakouton = 1;
	[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
	player setPos (getMarkerPos "jail_release");
	("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
	["Your jailtime is over, you are a free man now!",20,"green"] spawn domsg;
	life_bail_paid = false;
} else {
	[getPlayerUID player,profileName,"901"] remoteExec ["life_fnc_wantedAdd",2];
	["You escaped the jail!",20,"orange"] spawn domsg;
	life_breakouton = 1;
	("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
};