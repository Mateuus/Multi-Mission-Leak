/*

	Returms LEVEL for perm from another Unit
	
	permLevel[PERMID, (perms)]

*/
private["_unit","_perm_level","_perm_id"];
_unit = _this select 0;
_permid = _this select 1;
_perms = _unit getVariable "perms";

waitUntil {(!isNil {_unit getVariable "perms"})};

_level = 0;

{
	if ((_x select 0) == _permid) exitWith
	{
		_level = (_x select 1);
	};
}foreach _perms;

_level;