/*
	File: fn_whoDunnit
	Description: Save log file of units killed.
	Author: © ColinM - Help of BI Wiki & Forums.
	
	Credits:	KillzoneKid for his Debug_Console v3.0 file.
				Cuel from the BI Forums for his current & previous posts.
*/

if(isServer) then 
{
	private["_victim","_killer","_distance","_killerWep","_weaponName","_killerVeh","_vehName"];
	_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
	
	_distance = _killer distance _victim;
	_distance = floor(_distance);
	
	_killerWep = currentWeapon _killer;
	_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
	_weaponName = format["%1",getText(_weaponName >> "displayName")];
	_killerWep = format["%1",_weaponName];
	
	_killerVeh = vehicle _killer;
	_vehName = getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName");
	
	switch (true) do 
	{
		case (_victim == _killer):
		{
			[[1,format["Suicide Message: %1 has killed %1 (Possibly Suicide or Disconnect)",_killer getVariable["realname",name _killer]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
		case (vehicle _killer isKindOf "Car"):
		{
			[[1,format["Vehicle Death Message: %1 has obliterated %2 with a %3",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _vehName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
		case (vehicle _killer isKindOf "Air"):
		{
			[[1,format["Aircraft Death Message: %1 has obliterated %2 with a %3",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _vehName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
		default
		{
			[[1,format["Death Message: %1 has killed %2 with Weapon %3 from Distance %4 Meters",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _killerWep, _distance]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
	};
};