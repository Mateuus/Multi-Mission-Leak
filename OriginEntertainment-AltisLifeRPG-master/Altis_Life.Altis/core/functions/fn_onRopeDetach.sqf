private["_liftingObject","_ropeObject","_attachedObject"];
_liftingObject = _this select 0;
_ropeObject = _this select 1;
_attachedObject = _this select 2;

_attachedObject setVariable["isSlung",false,true];
hint localize "STR_NOTF_VehicleDetached";