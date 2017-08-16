#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
_curTarget = cursorObject;
if(life_action_inUse) exitWith {};
if(life_is_processing) exitWith {};
if(dialog) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);
if(!isNull life_objectPlacing) exitWith {[life_objectPlacing] call life_fnc_naswubapra;};
if(!isNull life_escortTarget) exitWith {[life_escortTarget] call life_fnc_pareregekesw;};
if(vehicle player != player) exitWith {[vehicle player] call life_fnc_inVehicleInteraction;};
if((call life_fnc_cecustanecr) && {!dialog}) exitWith {
	call life_fnc_zajudreme;
};

if((call life_fnc_pkiup) && {!dialog}) exitWith {
	call life_fnc_ujaua;
};


if(isNull _curTarget && {isNull objectParent player}) exitWith {
	if(_isWater) then {
		private "_fish";
		_fish = (nearestObjects[visiblePosition player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_tasaphudrepr;
		};
	};
};

life_action_inUse = true;
if(_curTarget isKindOf "Man" && {playerSide isEqualTo independent} && {isNull objectParent player}) exitWith {[_curTarget] call life_fnc_medicInteractionMenu;};

if(isPlayer _curTarget && {_curTarget isKindOf "Man"} && !(player getVariable ["restrained",false]) && {player distance _curTarget < 5} && {isNull objectParent player}) then {
	if(!(_curTarget getVariable["restrained",false])) then {
		[_curTarget] call life_fnc_generalInteractionMenu;
		life_action_inUse = false;
	};
	if((_curTarget getVariable ["restrained",false]) && {playerSide isEqualTo west} && {player distance _curTarget < 5}) then {
		[_curTarget] call life_fnc_copInteractionMenu;
		life_action_inUse = false;
	};
	if((_curTarget getVariable ["restrained",false]) && {(_curTarget getVariable "restrainedtype") isEqualTo "civ"} && {playerSide isEqualTo civilian} && {player distance _curTarget < 5}) then {
        [_curTarget] call life_fnc_civInteractionMenu;
		life_action_inUse = false;
	};
} else {
	private["_isVehicle","_miscItems","_money","_list"];
	_list = ["landVehicle","Ship","Air"];
	_isVehicle = if(KINDOF_ARRAY(_curTarget,_list)) then {true} else {false};
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < SEL(SEL(boundingBox _curTarget,1),0)+2 && {isNull objectParent player}) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		if((typeOf _curTarget) in _animalTypes && {isNull objectParent player}) then {
				[_curTarget] call life_fnc_tasaphudrepr;
		} else {
			if(((typeOf _curTarget) isEqualTo _money) && {!(_curTarget getVariable ["inUse",false])} && {isNull objectParent player}) then {
				[_curTarget,player,true] remoteExecCall ["AN_server_pickupAction",2];
			} else {
				if(((_curTarget getVariable "item") isEqualTo "objectDeployed") && {!(_curTarget getVariable ["inUse",false])} && {isNull objectParent player}) then {
					_curTarget setVariable ["inUse",true,true];
					[_curTarget] call life_fnc_precacatre;
				};
			};
		};
	};
};
