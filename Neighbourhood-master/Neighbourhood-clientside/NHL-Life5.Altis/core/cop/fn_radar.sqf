/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon
	
	Description:
	Looks like weird but radar?
*/
if(playerSide != west) exitWith {};
private ["_speed","_vehicle","_owners"];
_vehicle = cursorTarget;
//_owners = _vehicle getVariable "vehicle_info_owners";
_distance = player distance _vehicle;
_speed = round speed _vehicle;

if(_distance >= 300) exitWith{};

if((_vehicle isKindOf "Car") && (currentWeapon player) in ["hgun_P07_snds_F","Binocular","Rangefinder"]) then
{
	switch (true) do
	{
		case ((_speed > 33 && _speed <= 51)) : 
		{	
			_owners = [_owners] call life_fnc_vehicleOwners; //get vehicle owner from vehicle information.
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Geschwindigkeit: %1 km/h<br/><t color='#33CC33'><t align='center'><t size='1'>Entfernung: %2 m<br/><t color='#FFD700'>", round _speed, round _distance];
		};
		
		case ((_speed > 51)) : 
		{	
			_owners = [_owners] call life_fnc_vehicleOwners; //get vehicle owner from vehicle information.
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Geschwindigkeit: %1 km/h<br/><t color='#33CC33'><t align='center'><t size='1'>Entfernung: %2 m<br/><t color='#FFD700'>", round _speed, round _distance];
		};
	};
};