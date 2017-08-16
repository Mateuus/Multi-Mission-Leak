#include <macro.h>
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_securityLvl","_blocked","_uid","_houseOK","_fail","_dice","_person"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_blocked = false;
_houseOK = false;
_person = ObjNull;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Vous ne cherchez pas sur une porte de maison"};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

//if((nearestObject [[3172.168,12918.9,0],"Land_i_Barracks_V2_F"]) == _building) then {
//[[[1,2],"!!! Quelqu'un essaie d'entrer dans la salle informatique !!!"],"life_fnc_broadcast",true,false] call life_fnc_MP;
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
} else {
		if(isNil {(_building getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"; _blocked = true;};
		_uid = (_building getVariable "house_owner") select 0;
		if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"; _blocked = true;};
		_securityLvl = _building getVariable "house_security";
		_houseOK = true;
		[[0,"STR_ISTR_Bolt_AlertHouse",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		{
			if(getPlayerUid _x == _uid) exitWith {_person = _x;};
		}forEach playableUnits;
		if(_securityLvl in [4,5]) then {
			[[2,"STR_ISTR_Bolt_AlertPerson",true,[profileName]],"life_fnc_broadcast",_person,false] spawn life_fnc_MP;
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
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint "Vous n'etes pas a coté de la porte"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "Cette porte est deja déverouillé"};
life_action_inUse = true;
disableSerialization;
_title = "Crochetage de la porte";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
switch (typeOf _building) do {
	case "Land_Dome_Small_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	//case "Land_i_Barracks_V2_F": {_cpRate = 0.008;};
	default {_cpRate = 0.006;}
};
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] call life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulée","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 1) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};
if(_houseOK) then {
	_dice = floor (random 100);
	if(_dice >= _fail) exitWith {_houseOK = false;};
};
if(!_houseOK) then {
    _building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
    if((_building getVariable["locked",false])) then {
	    _building setVariable["locked",false,true];
    };
    [[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
    //[[_building],"life_fnc_boltcuttersound",nil,true] spawn life_fnc_MP;
	[[_building, "Alarm_maison",75],"life_fnc_playSound",true,false] spawn life_fnc_MP;
} else { 
		hint "Le systeme de securite de cette maison a bloque l'intrusion."; 
		[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		//[[_building],"life_fnc_boltcuttersound",nil,true] spawn life_fnc_MP;
		[[_building, "Alarm_maison",75],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		if(_securityLvl in [3,5]) then {
			if(!isNull _person) then {
				if(_securityLvl == 3) then {
					[[2,"STR_ISTR_Bolt_AlertPerson",true,[profileName]],"life_fnc_broadcast",_person,false] spawn life_fnc_MP;
				};
				if(_securityLvl == 5) then {
					[[1,"STR_WebcamReceive",true,[]],"life_fnc_broadcast",_person,false] spawn life_fnc_MP;
					uiSleep 8;
					[[_building,player,cursorTarget],"life_fnc_webcamHouse",_person,false] spawn life_fnc_MP;
				};
			};
		};
};