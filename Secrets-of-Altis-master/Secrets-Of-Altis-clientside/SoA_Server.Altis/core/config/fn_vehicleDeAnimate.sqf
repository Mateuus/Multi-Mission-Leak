private["_vehicle"];
_vehicle = _this select 0;

{deletevehicle _x} foreach (attachedObjects _vehicle);