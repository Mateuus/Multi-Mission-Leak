private["_result","_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
_result = false;



if (!isNil {DWEV_holstered_weapon}) then 
{
	_result = true;
	DWEV_holstered_weapon = nil;
};

if ((primaryWeapon player) != "") then
{
	_result = true;
	player removeWeapon (primaryWeapon player);
};

if ((secondaryWeapon player) != "") then
{
	_result = true;
	player removeWeapon (secondaryWeapon player);
};

if ((handGunWeapon player) != "") then
{
	_result = true;
	player removeWeapon (handGunWeapon player);
};

if (_result) then 
{
	hint "Dir wurden alle deine Waffen abgenommen";
	[3] call SOCK_fnc_updatePartial;
};

[_result] remoteExec ["DWEV_fnc_removeWeaponBack",_unit];