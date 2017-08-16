private["_detachObject","_detachactionID","_detachObjectclass","_objectid","_objectgangId","_gangId","_text","_pos","_dir","_location","_detachObjectworldspace","_txtTmp"]; 
 
_detachObject =  _this select 3; 
_detachactionID = _this select 2; 
_detachObjectclass = typeOf _detachObject; 
_objectid = _detachObject getVariable ["ObjectID",0]; 
_objectgangId = _detachObject getVariable ["gangarea_id",-1]; 
_gangId = group player getVariable "gang_id"; 
_text = getText (configFile >> "CfgVehicles" >> _detachObjectclass >> "displayName"); 
AttachedObj = _detachObject; 
 
if (isNil "_gangId") then { 
_gangId = grpNull; 
}; 
 
AttachedObj = nil; 
 
{ 
  player removeaction _x; 
  admindetachids = admindetachids - [_x]; 
}forEach admindetachids; 
 
//detach _detachObject; 
[BUILD_objectHandler, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;  
sleep 0.3; 
flagpole = nil; 
// if(surfaceIsWater _location) then { 
 // _location = getposASL _detachObject; 
// };    
//_pos = _location; 
//_pos set [2,0]; 
//_detachObject setpos _pos; 
 
_detachObject setPos [getPos _detachObject select 0, (getPos _detachObject select 1),0]; 
_dir = getDir _detachObject; 
_location = getpos _detachObject; 
_detachObjectworldspace = [_dir,_location]; 
 
 
//object allready exits update it! 
If (_objectid != 0 || _objectgangId != -1) then {  
 [[_objectid,_objectgangId,_detachObject],"build_fnc_updateObject",false,false] call lhm_fnc_mp; 
 [_detachObject] call build_fnc_renewObjectFunctions; 
  
// new object 
} else { 
  player removeaction _detachactionID; 
   
 { 
  player removeaction _x; 
  admindetachids = admindetachids - [_x]; 
 }forEach admindetachids; 
}; 
 
player removeaction detachid; 
thisismyattachtarget = objNull; 
 
playSound "repair"; 
 
[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"lhm_fnc_animSync",false,false] call lhm_fnc_mp; 
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"; 
 
waitUntil {sleep 1;animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"}; 
 
// set object can use again 
 
// reset build vars 
BUILD_buildDirection = 0; 
BUILD_Z_OFFSET = 0; 
BUILD_X_OFFSET = 0; 
BUILD_Y_OFFSET = 5; 
 
_txtTmp = format ["Plaziere Objekt '%1'", _text]; 
[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
 
sleep 2; 
_detachObject setVariable ["objUsed",false,true]; 
 
player forceWalk false;