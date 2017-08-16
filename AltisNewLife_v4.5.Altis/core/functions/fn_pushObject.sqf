private ["_caller","_thingToPush","_dir","_speed","_vel","_thingToPushType","_nameOfThingToPush","_textString","_targetDistance","_dist","_relativePosModel","_minSetBoxLimits","_maxSetBoxLimits","_minX","_minY","_minZ","_maxX","_maxY","_maxZ","_xRPM","_yRPM","_zRPM","_thingToPushLimits","_posCaller","_headPos","_headDir"];
_caller = player;
_thingToPush = cursorTarget;
_posCaller = visiblePosition _caller;
_dir = getDir _caller;
if(!local _thingToPush) exitWith {};
_thingToPushType = typeOf _thingToPush;
_nameOfThingToPush = (getText (configFile >> "cfgVehicles" >> (_thingToPushType) >> "displayname"));
if (!(isNull _thingToPush) and ((_thingToPush isKindOf "AllVehicles") or (_thingToPush isKindOf "Thing") or (_thingToPush isKindOf "Object") ))
then
{
         _targetDistance = _caller distance _thingToPush;
		 _thingToPushLimits = boundingBox _thingToPush;
         _dist = 2;
         _posCaller = [(_posCaller select 0) + _dist*sin _dir, (_posCaller select 1) + _dist*cos _dir, _posCaller select 2];
         _relativePosModel = _thingToPush worldToModel _posCaller;
         _minSetBoxLimits = _thingToPushLimits select 0;
         _maxSetBoxLimits = _thingToPushLimits select 1;
         _minX = _minSetBoxLimits select 0;
         _minY = _minSetBoxLimits select 1;
         _minZ = _minSetBoxLimits select 2;
         _maxX = _maxSetBoxLimits select 0;
         _maxY = _maxSetBoxLimits select 1;
         _maxZ = _maxSetBoxLimits select 2;
         _xRPM = _relativePosModel select 0;
         _yRPM = _relativePosModel select 1;
         _zRPM = _relativePosModel select 2;
         if (((_xRPM > _minX) and (_xRPM < _maxX) and (_yRPM > _minY) and (_yRPM < _maxY) and (_zRPM > _minZ) and (_zRPM < _maxZ)) or (_targetDistance <= 3.5)) then
         {
                  _headPos=screenToWorld [0.5,0.5];
                  _headDir=[
                           (_headPos select 0)-(getPos _caller select 0),
                           (_headPos select 1)-(getPos _caller select 1),
                           (_headPos select 2)-(getPos _caller select 2)
                  ];
                  _dir = (_headDir select 0) atan2 (_headDir select 1);
                  _speed = 6;
                  _vel = velocity _thingToPush;
                  _thingToPush setVelocity
                  [
                           (_vel select 0)+((sin _dir)*_speed),
                           (_vel select 1)+((cos _dir)*_speed),
                           1
                  ];
                  if (_thingToPush isKindOf "Ship") then
                  {
                           uiSleep 1;
                           _thingToPush setVelocity [0,0,0];
                  };

         } else
         {

         };

}
else
{

};