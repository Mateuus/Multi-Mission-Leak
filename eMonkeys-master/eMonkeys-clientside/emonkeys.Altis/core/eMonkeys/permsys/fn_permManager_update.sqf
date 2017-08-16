/*

	Updates the PERM manager (29550)

*/

private["_display", "_permid", "_permindex", "_index", "_valid","_playerlevel"];
disableSerialization;
if (side player == independent || side player == west)exitWith	{hint "Medics und Polizisten haben keine Gruppen"};
if(EMonkeys_permmanager_admin || (call EMonkeys_adminlevel) < 1) then
{
	ctrlShow [2400, false];
};


_index  = lbCurSel 2100;

if(_index == -1) exitWith
{
	["HIDDEN"] call EMonkeys_fnc_permManager_uiMode;
};

_permid = lbData [2100, _index];
_permindex = lbValue[2100, _index];

//Reset/Set data
EMonkeys_permmanager_permid = _permid;
EMonkeys_permmanager_permindex = _permindex;
EMonkeys_permmanager_data_receive_time = time;

//Show own data
["HIDDEN"] call EMonkeys_fnc_permManager_uiMode;

_playerlevel = [_permid] call EMonkeys_fnc_permLevel;
ctrlSetText[1001, format["Rang %1 (%2)", _playerlevel, [_permid, _playerlevel] call EMonkeys_fnc_permLevelName]];
ctrlSetText[1200, (([] call EMonkeys_fnc_perms) select _permindex) select 5];


if( !([_permid, "VIEW"] call EMonkeys_fnc_permRule) && !EMonkeys_permmanager_admin) exitWith
{
	systemChat "Du kannst nicht sehen, welche Personen in der Gruppe sind!";
};

