/*

(level) permManager_set

*/

private["_level","_destination","_adminlevel", "_perm_row", "_permid"];

_level = [_this, 0, -1] call BIS_fnc_param;
_perm_row = [];

//read destination
_destination = (lbData[1500, lbCurSel 1500]);

//look for player
{
	if((getPlayerUID _x) == _destination) exitWith
	{
		_destination = _x;
	};
}
foreach playableUnits;

if(typeName _destination == "STRING") exitWith
{
	hint "Ungültiger Spieler!";
};


//read perm data
_permid = EMonkeys_permmanager_permid;
_perm_row = (([] call EMonkeys_fnc_perms) select EMonkeys_permmanager_permindex);

if((count _perm_row) == 0) exitWith
{
	hint "Invalid perm?";
};


//read level 
if(_level == -1) then
{
	//read level from controls
	_level = ctrlText 1400;
	
	
	if(([_level] call fnc_isnumber)) then
	{
		_level = parseNumber _level;
		_level = round _level;
	}
	else
	{
		_level = -1;
	};
};

//check 
if( _level < 0 || _level > (_perm_row select 2)) exitWith
{
	hint "Ungültiges Level angegeben!";
};

//get admin level 
_adminlevel = 0;
if(EMonkeys_permmanager_admin) then
{
	_adminlevel = call EMonkeys_adminlevel;
};


//send
if(_destination == player) then
{
	[player ,_permid, _level, [_permid] call EMonkeys_fnc_permLevel, _adminlevel] spawn EMonkeys_fnc_permSetLevel;
}
else
{
	[[player ,_permid, _level, [_permid] call EMonkeys_fnc_permLevel, _adminlevel],"EMonkeys_fnc_permSetLevel",_destination,false] call EMonkeys_fnc_mp;
};

EMonkeys_permmanager_player_perms = []; //Reset cache to make update possible
[] call EMonkeys_fnc_permManager_update; //update, because sth was changed!

hint format["Level für %1 der Gruppe %2 auf %3 gesetzt.", name _destination, _perm_row select 1, _level];