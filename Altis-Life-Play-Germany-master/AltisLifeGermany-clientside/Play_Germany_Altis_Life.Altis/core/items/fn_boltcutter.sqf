/*
    Author: Bryan "Tonic" Boardwine

    Description:
    Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_securityLvl","_blocked","_uid","_houseOK","_fail","_dice","_person"];

_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_blocked = false;
_houseOK = false;
_person = ObjNull;

if(playerSide != civilian) exitWith {hint "Lass den Scheiß du Lappen"};
if(isNull _building && (player distance fed_bank_dome < 18) && (_building != (nearestObject [fed_bank,"Land_Research_house_V1_F"]))) then {_building = fed_bank_dome};
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

if(fed_bank_dome == _building OR (nearestObject [fed_bank,"Land_Research_house_V1_F"]) == _building) then {
    if({side _x == west} count playableUnits < 8) then {
        hint localize "STR_Civ_NotEnoughCops";
        _blocked = true;
    } else {
        [[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] call life_fnc_MP;
        [objNull,"bankalarm"] call life_fnc_globalSound;
    };
} else {
    if(isNil {(_building getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"; _blocked = true;};
    _uid = (_building getVariable "house_owner") select 0;
    if(!([_uid] call life_fnc_isUIDActiveCiv) && (_building getVariable["HouseSpawnBlockTime",0] < serverTime)) exitWith {hint localize "STR_House_Raid_OwnerOff"; _blocked = true;};
    _securityLvl = _building getVariable "house_security";
    _houseOK = true;
    [[0,"STR_ISTR_Bolt_AlertHouse",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
    _building setVariable["HouseSpawnBlockTime",serverTime + 1200,true]; //set the time to block respawn at house
    
    {
        if(getPlayerUid _x == _uid) exitWith {_person = _x;};
    } forEach playableUnits;
    
    if(_securityLvl > 0) then {
		if(_securityLvl > 2) then {
        [[2,"STR_House_AlertPerson",true,["einer unbekannten Person"], name _person],"life_fnc_broadcast",_person,false] spawn life_fnc_MP;
        [[_person,"housealarm",false],"life_fnc_clientSound",true,false] spawn life_fnc_MP;
		};
    };
};

if(_blocked) exitWith {};
if(_houseOK) then {
	switch (_securityLvl) do
	{
		case 0: {_fail = -1;};
		case 1: {_fail = 10;};
		case 2: {_fail = 20;};
		case 3: {_fail = 30;};
		case 4: {_fail = 40;};
		case 5: {_fail = 50;};
	};
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
    _selPos = _building selectionPosition format["Door_%1_trigger",_i];
    _worldSpace = _building modelToWorld _selPos;
	_offset = (_worldSpace select 2) -(getPosATL player select 2);
    if((player distance2d _worldSpace < 2) && {_offset < 2} && {_offset > 0}) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
    case "Land_Dome_Small_F": {_cpRate = 0.003;};
    case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
    default {_cpRate = 0.005;}
};

while {true} do
{
    if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    uiSleep 0.26;
    if(isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if(_cP >= 1 OR !alive player) exitWith {};
    if(life_istazed) exitWith {}; //Tazed
    if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
    [false,"boltcutter",1] call life_fnc_handleInv;
    life_boltcutter_uses = 0;
};

if(_houseOK) then {
	_dice = floor (random 100);
	if(_dice >= _fail) then {_houseOK = false;};
};

if(!_houseOK) then {
    _building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
    if((_building getVariable["locked",false])) then {
	    _building setVariable["locked",false,true];
    };
    [[getPlayerUID player,profileName,"22"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
    if (_securityLvl > 0) then { [_building,"housealarm"] call life_fnc_globalSound; };
} else { 
    hint "Das Sicherheitssystem des Hauses hat den Einbruch verhindert."; 
    [[getPlayerUID player,profileName,"22"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
    [_building,"housealarm"] call life_fnc_globalSound;
    if(!isNull _person) then {
        switch (_securityLvl) do
        {
            case 3: {
                [[2,"STR_House_AlertPerson",true,[profileName]],"life_fnc_broadcast",_person,false] spawn life_fnc_MP;
                [[_person,"housealarm",false],"life_fnc_clientSound",true,false] spawn life_fnc_MP;
            };
            case 5: {
                [[1,"STR_House_WebcamReceive",true,[]],"life_fnc_broadcast",_person,false] spawn life_fnc_MP;
                sleep 8; // send the film after 8 seconds
                [[_building,player,cursorTarget],"life_fnc_webcamHouse",_person,false] spawn life_fnc_MP;
            };
        };
    };
};