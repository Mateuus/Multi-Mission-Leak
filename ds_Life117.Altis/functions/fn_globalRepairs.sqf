/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
Repairs buildings on the server
*/
private ["_buildingarray","_pos"];
_pos = (_this select 0);

_buildingarray = nearestObjects [_pos, ["All"], 300];
{
	if((_x isKindOf "Air")&&(_x isKindOf "LandVehicle"))then{}else
		{
		_x setDamage 0;
		};
} forEach _buildingarray;













