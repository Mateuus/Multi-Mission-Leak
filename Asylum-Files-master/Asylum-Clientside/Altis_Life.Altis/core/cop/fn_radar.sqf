/*
	File: fn_radar.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Police radar gun scan
*/
if(playerSide != west) exitWith {};
life_radar_active = !life_radar_active;

[] spawn
{
	private ["_speed","_color","_highest","_vehicle"];
	_highest = 0;
	while {life_radar_active && ((currentWeapon player) == "hgun_P07_snds_F" || 74 in life_talents)} do
	{
		_vehicle = cursorTarget;
		if ((vehicle player != player) && !(73 in life_talents)) exitWith { systemChat "You're not talented enough to use your radar gun from within the vehicle."; };
		if (isNull _vehicle) then { _speed = 0; }
		else { _speed = round speed _vehicle; };

		if (_speed > _highest) then { _highest = _speed; };
		_color = "#33CC33";
		if (_highest > 80) then { _color = "#FF0000"; };
		hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t align='center'><t size='1'>Active Speed: %1 km/h<br/><t color='%3'>Recorded High: %2 km/h", _speed, _highest, _color];
	};

	life_radar_active = false; 
	hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Deactivated"];
};