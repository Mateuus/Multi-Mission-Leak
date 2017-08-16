private ["_attachObject", "_attachType", "_maxHeight", "_text", "_objInUse", "_price", "_gangBank", "_flagpole", "_txtTmp", "_pos2", "_directionto", "_setNewPos", "_vel2", "_dir2", "_up2", "_pos1", "_vel1", "_dir1", "_up1", "_interval"]; 
 
//_attachObject = _this select 3; 
_attachObject = cursorTarget; 
_attachType = typeOf _attachObject; 
 
if (isNull _attachObject) exitWith {Hint "Fehler beim bewegen des Objektes..."}; 
if (_attachType == "Flag_Quontrol_F") exitWith {}; 
 
_text = getText (configFile >> "CfgVehicles" >> _attachType >> "displayName"); 
_objInUse = _attachObject getVariable "objUsed"; 
_price = [_attachType] call build_fnc_getPrice; 
_gangBank = group player getVariable "gang_bank"; 
_flagpole = (nearestobjects [player, ["FlagCarrier"], LHM_VAR_GANGBASERANGE]); 
if (_objInUse) exitWith { 
 ["Objekt wird benutzt!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
if (!isNil "AttachedObj" || !isNil "Placing_Obj") exitWith { 
 ["Bitte zuerst plazieren!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
if(!(count _flagpole > 0)) exitWith { 
 ["Objekt ist nicht im Bauradius", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
if (_price < 50000) then {_price = _price / 100}; 
if (_price > 100000) then {_price = _price / 125}; 
if (_price > 1000000) then {_price = _price / 1000}; 
if (_price > 10000000) then {_price = _price / 2000}; 
 
if (_gangBank < _price) exitWith { 
 _txtTmp = format ["Deine Gang braucht %1$ um das zu verschieben", _price]; 
 [_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
_gangBank = _gangBank - _price; 
group player setVariable["gang_bank",_gangBank,true]; 
[[1,group player],"TON_fnc_updateGang",false,false] call lhm_fnc_mp; 
hint format ["Du hast für das verschieben des Objektes %1 vom Gang-Konto bezahlt!",_price]; 
 
// set object is used 
_attachObject setVariable ["objUsed",true,true]; 
 
// change object owner to local player 
if (!local _attachObject) then { 
 [[_attachObject,player],"lhm_fnc_changeOwner",false,false] call lhm_fnc_mp; 
}; 
 
playSound "repair"; 
 
[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"lhm_fnc_animSync",false,false] call lhm_fnc_mp; 
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"; 
 
waitUntil {sleep 1;animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"}; 
 
player removeAction s_admin_attach; // remove attach action so player cant attach this target again 
s_admin_attach = -1; 
 
player forceWalk true; 
 
_txtTmp = format ["Bewege Objekt '%1'", _text]; 
[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
 
AttachedObj = _attachObject; 
admindetachids = []; 
detachid = player addAction ['<img image="core\build\icons\detach.paa"/> <t color="#3CBEDE">' + "Platziere " + str(_text) + '</t>', build_fnc_placeObject, _attachObject, 98, false, true, "", ""]; 
 
admindetachids pushBack detachid; 
 
hintsilent format ["OBJEKTSTEUERUNG:

Q = rechts drehen
E = links drehen
POS1 = Vorwaerts
ENDE = Zurueck
Pfeil Links = Links bew.
Pfeil Rechts = rechts bew.
ENTF = Reset Ausrichtung

>> 'Plazieren' zum speichern! <<
Bewegungsradius 100m"]; 
 
BUILD_velocityTransformation = []; 
_offset = player worldToModel (getposATL AttachedObj); 
BUILD_X_OFFSET = _offset select 0; 
BUILD_Y_OFFSET = _offset select 1; 
BUILD_Z_OFFSET = _offset select 2; 
 
BUILD_objectHandler = ["Pos_objectHandler","onEachFrame","BUILD_fnc_updateObjectPos"] call BIS_fnc_addStackedEventHandler; 
 
while {!isnil "AttachedObj"} do { 
 _pos2 = player modelToWorld[BUILD_X_OFFSET, BUILD_Y_OFFSET, BUILD_Z_OFFSET]; 
 if (_pos2 select 2 > 2.5) then{ 
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
 
sleep 0.1; 
}; 
 
player removeaction detachid; 
thisismyattachtarget = objNull;