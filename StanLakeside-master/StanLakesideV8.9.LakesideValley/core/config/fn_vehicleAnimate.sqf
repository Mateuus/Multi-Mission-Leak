/*
	File: fn_vehicleAnimate.sqf
	

	Description:
	Pass what you want to be animated.
*/

params [["_vehicle", objNull, [objNull]], ["_animate", "", [""]], ["_preset", false, [false]]];
if(isnull _vehicle) exitwith {}; //FUCK

if(!_preset) then
{
	if(count _animate > 1) then
	{
		{
			_vehicle animate[_x select 0,_x select 1];
		} foreach _animate;
	}
		else
	{
		_vehicle animate[_animate select 0,_animate select 1];
	};
};
