#include <macro.h>
private["_item","_type","_tmp","_ret","_weaponArray"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
if(_item == "" || _type == 0) exitWith {0};
_ret = 0;
_weaponArray = [RIFLE, LAUNCHER, PISTOL];
{
	if(_ret != 0) exitWith {}; //Make sure we exit the loop since there was already a match.
	if(_x != "") then
	{
		_weapon = _x;
		_cfgInfo = [_weapon,"CfgWeapons"] call life_fnc_fetchCfgDetails;
		_legacyItems = ((_cfgInfo select 10) + (_cfgInfo select 11) + (_cfgInfo select 12));
		_newItems = _cfgInfo select 14;
		
		//Check Legacy Items first
		if(count _legacyItems > 0) then
		{
			for "_i" from 0 to (count _legacyItems)-1 do
			{
				_legacyItems set[_i,toLower(_legacyItems select _i)];
			};
			
			if((toLower _item) in _legacyItems) exitWith {_ret = switch(_weapon) do {case (RIFLE): {1};case (LAUNCHER) : {2};case (PISTOL): {3};default {0};};};
		};
		
		//Check new compatibleItems class structure
		if(count _newItems > 0) then
		{
			//This gets weird with foreach in foreach :\
			{
				if(_ret != 0) exitWith {};
				_cfg = getNumber(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> _x >> "compatibleItems" >> _item);
				if(isNil "_cfg") then {_cfg = 0;};
				if(_cfg == 1) exitWith
				{
					_ret = switch(_weapon) do {case (RIFLE): {1};case (LAUNCHER) : {2};case (PISTOL): {3};default {0};};
				};
			} foreach _newItems;
			if(_ret != 0) exitWith {}; //Make sure we exit the loop
		};
	};
} foreach _weaponArray;

_ret;