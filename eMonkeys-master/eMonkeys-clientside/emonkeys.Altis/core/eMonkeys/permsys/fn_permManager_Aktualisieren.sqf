
/*

	Updates the PERM manager (29550)

*/
if(isNil "EMonkeys_permman") then {EMonkeys_permman = false;};
if(EMonkeys_permman) exitWith {hint "Sie haben bereits aktualisiert, bitte versuchen Sie es in etwa 20 Sekunden erneut.";};

lbClear 1500;
lbClear 1500;


systemChat "Lade Liste ... Bitte warten!";

if(count EMonkeys_permmanager_player_perms == 0) then
{

	lbClear 1500;
	
	[player, (player getVariable "perms")] call EMonkeys_fnc_permManager_gotData;

	[[player],"EMonkeys_fnc_permManager_requestData",[civilian,east],false] call EMonkeys_fnc_mp;

}
else
{
	lbClear 1500;
	[] spawn EMonkeys_fnc_permManager_refreshList;
};


[] spawn
{
	EMonkeys_permman = true;
	uisleep 20;
	EMonkeys_permman = false;
};