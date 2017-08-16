#include "..\..\macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_whatIsIt","_handle","_fish"];
_curTarget = cursortarget;
if(DWEV_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(DWEV_interrupted) exitWith {DWEV_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith 
{
	if (_isWater) then
	{
        _fish = (nearestObjects[player,(DWEV_SETTINGS(getArray,"animaltypes_fish")),3]) select 0;
        if (!isNil "_fish") then
		{
            if (!alive _fish) then
			{
                [_fish] call DWEV_fnc_catchFish;
            }
			else
			{
			hint "Du kannst keine lebenden Tiere Sammeln";
			};
        };
    }
	else
	{
		private "_handle";
		if (playerSide isEqualTo civilian && !DWEV_action_gathering) then
		{
		_whatIsIt = [] call DWEV_fnc_whereAmI;
		if (DWEV_action_gathering) exitWith {};                 //Action is in use, exit to prevent spamming.
		
		switch (_whatIsIt) do
		{
			case "mine" : { _handle = [] spawn DWEV_fnc_mine };
			case "insel" : { _handle = [] spawn DWEV_fnc_shovelUse };
			default { _handle = [] spawn DWEV_fnc_gather };
		};
		
		DWEV_action_gathering = true;
		waitUntil {scriptDone _handle};
		DWEV_action_gathering = false;
        };
    };
};

if((((typeOf (_curTarget)) IN  ["Box_IND_Grenades_F","B_supplyCrate_F"] ) || !(isNil "DWEV_currentBox"))&& {player distance _curTarget < 12}) exitWith 
{
	[_curTarget] call DWEV_fnc_houseContainerMenu;
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith 
{
	[_curTarget] call DWEV_fnc_houseMenu;
};


if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
DWEV_action_inUse = true;

//Temp fail safe.
[] spawn 
{
	sleep 60;
	DWEV_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {(side player) isEqualTo independent}) exitWith
{
	if (DWEV_inv_defibrillator > 0) then
	{
		[_curTarget] call DWEV_fnc_revivePlayer;
    }
	else
	{
		hint "Du brauchst einen Defibrillator!"
	};
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then 
{
	if((_curTarget getVariable["restrained",false]) && !dialog) then 
	{
		if((side player) == west) then 
		{
			[_curTarget] call DWEV_fnc_copInteractionMenu;
		};
		if((side player) == east) then 
		{
			[_curTarget] call DWEV_fnc_opforInteractionMenu;
		};
		if((side player) == civilian) then 
		{
			if(lc_rebel && currentWeapon player != "" && currentWeapon player != "Binocular" && currentWeapon player != "Rangefinder") then
			{
					[_curTarget] call DWEV_fnc_civInteractionMenu;
			};
		};
	};
	if((animationState _curTarget == "Incapacitated") && !dialog && (side player) == civilian) then
	{
		[_curTarget] call DWEV_fnc_koInteractionMenu;
	};
	
	if(!dialog && (player distance cursorTarget) < 2 && !(animationState _curTarget == "Incapacitated") && !(_curTarget getVariable["restrained",false])) then
	{
		[_curTarget] call DWEV_fnc_playerInteractionMenu;
	};
}
 else 
 {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money","_list"];
	_list = ["landVehicle","Ship","Air"];
    _isVehicle = if (KINDOF_ARRAY(_curTarget,_list)) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then 
	{
		if(!dialog) then 
		{
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then
			{
				[_curTarget] call DWEV_fnc_vInteractionMenu;
			};
		};
	} 
	else 
	{
		//Is it a animal type?
		if((typeOf _curTarget) in DWEV_SETTINGS(getArray,"animaltypes_fish")) then 
		{
			if(!alive _curTarget) then 
			{
				private["_handle"];
				if((side player) == civilian && !DWEV_action_gathering) then 
				{  
					if((_curTarget getVariable ["catchinuse",false]) && !alive _curTarget) exitWith {hint "Jemand anderes sammelt das Tier bereits"};
					_curTarget setVariable ["catchinuse",true,true];
					_handle = [_curTarget] spawn DWEV_fnc_catchFish;
					waitUntil {scriptDone _handle};
					DWEV_action_gathering = false;
				};
			};
		} 
		else 
		{
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then 
			{
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn DWEV_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			}
			else 
			{
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then 
				{
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn DWEV_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};