/*
    Filename: attachObj.sqf
    Author: Blackd0g

    Description: Attach/Detach Object
*/
private ["_attachObject","_attachType","_objectid","_objectgangId","_gangId","_text","_korrekturfaktor","_txtTmp","_WorldToPlayerObj","_posiplayerATL","_posirelterrainObj","_ObjPosiRelTerra","_posirelterrainObjOffset","_posiObj","_dir","_posiObjATL","_posiATLPlayer","_pos"];
_attachObject = param [0,ObjNull,[ObjNull]];
_attachType = typeOf _attachObject;
_objectid = _attachObject getVariable ["ObjectID",0];
_objectgangId = _attachObject getVariable ["gangarea_id",-1];
_gangId = group player getVariable "gang_id";
_text = getText (configFile >> "CfgVehicles" >> _attachType >> "displayName");
_korrekturfaktor = 0;

if (isNull _attachObject) exitWith {};
if (isNil "_gangId") then {_gangId = grpNull};

// Attach Object
if(isNil "AttachedObj" && !(_attachObject in attachedObjects player)) then {
    AttachedObj = _attachObject;

    _txtTmp = format ["Attach Object '%1'", _text];
    [_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

    _WorldToPlayerObj = player worldtomodel getPos AttachedObj;
    while {!isnil "AttachedObj"} do {
        detach AttachedObj;
        _posiplayerATL = getTerrainHeightASL (position player);
        _posirelterrainObj = getTerrainHeightASL (position AttachedObj);
        _ObjPosiRelTerra = getPosATL AttachedObj select 2;
        if (_ObjPosiRelTerra != 0 ) then {
          _korrekturfaktor = _korrekturfaktor - _ObjPosiRelTerra;
        };
        /*if (_ObjPosiRelTerra > 0 ) then {
          _korrekturfaktor = _korrekturfaktor - _ObjPosiRelTerra;
        };
        if (_ObjPosiRelTerra < 0 ) then {
          _korrekturfaktor = _korrekturfaktor - _ObjPosiRelTerra;
        };
        */
        _posirelterrainObjOffset = _posirelterrainObj - _posiplayerATL + _korrekturfaktor;
        _posiObj = player modelToWorld _WorldToPlayerObj;
        _dir = direction player;
        AttachedObj setdir _dir;
        _posiObjATL = [getPosATL AttachedObj select 0,getPosATL AttachedObj select 1,getPosATL AttachedObj select 2];
        _posiATLPlayer = [getPosATL player select 0,getPosATL player select 1,getPosATL player select 2];
        //hintSilent format["%1 | %2 | %3 | %4 | %5 | %6",_posiObjATL,_posiATLPlayer,_posirelterrainObjOffset,_posiplayerATL,_posirelterrainObj,_korrekturfaktor];
        AttachedObj attachTo [player, [_WorldToPlayerObj select 0,_WorldToPlayerObj select 1,_posirelterrainObjOffset]];
        //_x setdir direction player;
        sleep 0.1;
    };


} else {
    // Detach Object
    AttachedObj = nil;
    detach _attachObject;

    // if objet still attached detach all
    if (count attachedObjects player != 0) then {
        {
          detach _x;
        } forEach attachedObjects player;
    };

    sleep 0.1;

    _pos = getPos _attachObject;
    if(surfaceIsWater _pos) then {
        _pos = getposASL _attachObject;
    };

    _pos set [2,0];
    _attachObject setPos _pos;
    sleep 0.3;

    //object allready exits update it!
    If (_objectid != 0 || _objectgangId != -1) then {
        [[_objectid,_objectgangId,_attachObject],"build_fnc_updateObject",false,false] call lhm_fnc_mp;
        [_attachObject] call build_fnc_renewObjectFunctions;
    };

    _attachObject setVariable ["objUsed",false,true];

    // reset build vars
    BUILD_buildDirection = 0;
    BUILD_Z_OFFSET = 0;
    BUILD_X_OFFSET = 0;
    BUILD_Y_OFFSET = 5;

    _txtTmp = format ["Placed Object '%1'", _text];
    [_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

    lhm_playerCarryItem = false;
};
