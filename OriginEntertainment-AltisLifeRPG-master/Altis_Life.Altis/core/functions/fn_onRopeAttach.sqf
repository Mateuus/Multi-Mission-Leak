private["_liftingObject","_ropeObject","_attachedObject"];
_liftingObject = _this select 0;
_ropeObject = _this select 1;
_attachedObject = _this select 2;

if(_attachedObject in life_vehicles) then
{
	_attachedObject setVariable["isSlung",true,true];
	hint localize "STR_NOTF_VehicleAttached";
}
else
{
	hint localize "STR_NOTF_NotYourVehicle";
	deleteVehicle _ropeObject;
};