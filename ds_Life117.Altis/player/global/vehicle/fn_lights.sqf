_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(_vehicle getVariable ["sirens",false])then
	{
	_vehicle setVariable ["sirens",false,true];
	}
	else
	{
	_vehicle setVariable ["sirens",true,true];
	[[_vehicle],"DS_fnc_globalLights",true,false] call DS_fnc_MP;
	};






