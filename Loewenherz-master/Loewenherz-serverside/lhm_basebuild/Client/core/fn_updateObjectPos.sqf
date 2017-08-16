/* 
Filename: fn_updateObjectPos.sqf 
 
Author: Blackd0g 
 
Description: update position from object every frame with (StackedEventHandler) 
*/ 
 
if (isNil "flagpole") then { 
 flagpole = (nearestobjects [player, ["FlagCarrier"], LHM_VAR_GANGBASERANGE]); 
 flagpole = flagpole select 0; 
}; 
 
// warn player if border is near 
if (AttachedObj distance flagpole > 90) then { 
 hintsilent format ["Bauradius in %1m erreicht!",round (99 -(AttachedObj distance flagpole))]; 
}; 
 
// if player reached the building border drop object 
if(AttachedObj distance flagpole > 99) exitWith { 
 hintsilent "Ausserhalb des Bauradius
Objekt wird fallengelassen!"; 
 _directionto = [AttachedObj, flagpole] call BIS_fnc_dirTo;  
 _setNewPos = [AttachedObj, +2, _directionto] call BIS_fnc_relPos; 
 _setNewPos set [2,(getposATL AttachedObj select 2)]; 
 AttachedObj setPos _setNewPos; 
 [player,player,detachid,AttachedObj] spawn build_fnc_placeObject; 
}; 
 
// check if player is really the player 
if (!alive player || (vehicle player) != player || isNull player) then { 
 [player,player,detachid,AttachedObj] spawn build_fnc_placeObject; 
}; 
 
if (speed player > 10) then { 
 player playMoveNow "amovpercmstpsnonwnondnon"; // stop animation 
 Hint "Du kannst nicht rennen waehrend du etwas traegst!"; 
}; 
 
 
_pos2 = player modelToWorld[BUILD_X_OFFSET, BUILD_Y_OFFSET, BUILD_Z_OFFSET]; 
if (_pos2 select 2 > 2.5) then { 
 _pos2 set[2, 2.5]; 
}; 
 
if !(surfaceIsWater _pos2) then { 
 _pos2 = ATLtoASL _pos2; 
}; 
 
if (BUILD_space) then { 
 _vel2 = (velocity player); 
 _dir2 = [vectorDir player, BUILD_buildDirection] call BUILD_fnc_returnVector; 
 _up2 = (vectorUp player); 
 BUILD_space = false; 
 BUILD_velocityTransformation = [_pos2,_vel2,_dir2,_up2]; 
} else { 
 BUILD_velocityTransformation = []; 
}; 
 
_pos1 = getPosASL AttachedObj; 
_vel1 = velocity AttachedObj; 
_dir1 = vectorDir AttachedObj; 
_up1 = vectorUp AttachedObj; 
_interval = 0.1; 
 
if ((count BUILD_velocityTransformation) == 4) then { 
 AttachedObj setvelocitytransformation [_pos1,(BUILD_velocityTransformation select 0),_vel1,(BUILD_velocityTransformation select 1),_dir1,(BUILD_velocityTransformation select 2),_up1,(BUILD_velocityTransformation select 3),_interval]; 
} else { 
 _pos2 = player modelToWorld [BUILD_X_OFFSET,BUILD_Y_OFFSET,BUILD_Z_OFFSET]; 
 if ((_pos2 select 2) < 0) then {_pos2 set [2,0]}; 
 if !(surfaceIsWater _pos2) then {_pos2 = ATLtoASL _pos2}; 
 if ((_pos1 distance _pos2) > 0) then { 
  AttachedObj setvelocitytransformation [_pos1,_pos2,_vel1,_vel1,_dir1,_dir1,_up1,_up1,_interval]; 
 }; 
};