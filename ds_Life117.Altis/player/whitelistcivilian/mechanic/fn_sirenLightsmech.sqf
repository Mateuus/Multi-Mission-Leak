/*
/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Sets up strobe lights for mechanics
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_Truck_01_mover_F"])) exitWith {};
_trueorfalse = _vehicle getVariable["sirens",FALSE];
if(_trueorfalse) then 
	{
	_vehicle setVariable["sirens",FALSE,TRUE];
	}
	else 
	{
	_vehicle setVariable["sirens",TRUE,TRUE];
	[[_vehicle,0.22],"DS_fnc_mechLights",true,false] call BIS_fnc_MP;
	};
