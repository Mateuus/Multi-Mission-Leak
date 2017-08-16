_vehicle = param [0,ObjNull,[ObjNull]];

if(!VehFlip) exitWith {};
VehFlip = false;
_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2) + 0.7];
[] spawn
{
	sleep 10;
	VehFlip = true
};
closeDialog 0;