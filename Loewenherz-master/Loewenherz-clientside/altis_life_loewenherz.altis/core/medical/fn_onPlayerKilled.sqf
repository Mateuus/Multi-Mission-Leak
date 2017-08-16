/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_backupGear"];
disableSerialization;

_unit = param [0,ObjNull,[ObjNull]];
_killer = param [1,ObjNull,[ObjNull]];

if ((vehicle _unit) != _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

if(playerside isEqualTo civilian && lhm_is_arrested != 1 && lhm_is_arrested != 2) then {
	lhm_is_arrested = 2;
	[5] call SOCK_fnc_updatePartial;
};

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64ID",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["missingOrgan",FALSE,TRUE]; // NEU!!!
_unit setVariable["hasOrgan",FALSE,TRUE]; // NEU!!!
_unit setVariable["lhm_finger",[true,true,true,true,true,true,true,true,true,true],TRUE]; //Neu cut Finger System

LHM_BANK_Way = "";
BankHeistState = -1;

//delete the current hud
[] call lhm_fnc_huddelete;

//Setup our camera view
lhm_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
lhm_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
lhm_deathCamera camSetTarget _unit;
lhm_deathCamera camSetRelPos [0,3.5,4.5];
lhm_deathCamera camSetFOV .5;
lhm_deathCamera camSetFocus [50,0];
lhm_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);

	_maxTime = time + (lhm_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;

	if (playerSide != civilian) then { // Cops,Meds,Secs
		_this setPosATL [0,0,0];
		_maxTime = time + (lhm_respawn_timer * 5);
		waitUntil {_Timer ctrlSetText format["Du kannst respawnen in: %1",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0 || isNull _this};
	} else {
		// Civs
		waitUntil {_Timer ctrlSetText format["Du kannst respawnen in: %1",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0 || isNull _this || lhm_request_timer};

		if (lhm_request_timer) then {
			lhm_request_timer = false; //resets increased respawn timer
			_maxTime = time + (lhm_respawn_timer * 300);

			waitUntil
			{
				_Timer ctrlSetText format
				[
					"Du kannst respawnen in: %1",
					[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString
				];
	            sleep 0.49;
	            _this setVariable ["healthState",(_maxTime - time),true];
				round(_maxTime - time) <= 0 || isNull _this
			};

		};

	};

	lhm_request_timer = false; //resets increased respawn timer
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn lhm_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit isEqualTo 0) exitWith {true}; lhm_deathCamera camSetTarget _unit; lhm_deathCamera camSetRelPos [0,3.5,4.5]; lhm_deathCamera camCommit 0;};
};

	//Make the killer wanted
	if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {side _killer != east} && {alive _killer}) then {
		if(vehicle _killer isKindOf "LandVehicle") then {
			if((side _killer) != Independent)then{
				[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
				//Get rid of this if you don't want automatic vehicle license removal.
				if(!local _killer) then {
				[[2],"lhm_fnc_removeLicenses",_killer,FALSE] call lhm_fnc_mp;
				};
			};
		} else {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;

			if(!local _killer) then {
				[[3],"lhm_fnc_removeLicenses",_killer,FALSE] call lhm_fnc_mp;
			};
		};
	};

lhm_save_gear = [player] call lhm_fnc_fetchDeadGear;

_containers = nearestObjects[getPosATL player,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;

//Killed by cop stuff...
if(side _killer isEqualTo west && playerSide != west) then {
	lhm_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!lhm_use_atm && {lhm_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[lhm_cash] call lhm_fnc_numberText],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
		lhm_cash = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	lhm_removeWanted = true;
};

_handle = [_unit] spawn lhm_fnc_dropItems;
waitUntil {scriptDone _handle};

lhm_hunger = 100;
lhm_thirst = 100;
lhm_carryWeight = 0;
lhm_cash = 0;
lhm_gear set [16, []];

[] call lhm_fnc_hudUpdate; //Get our HUD updated.
[[player,lhm_sidechat,playerSide],"TON_fnc_managesc",false,false] call lhm_fnc_mp;

if(playerSide isEqualTo civilian) then {[] call SOCK_fnc_updateRequest;};

//fix for kill in vehicle
if(primaryWeapon _unit != "") then {
	_unit removeWeapon (primaryWeapon _unit);
};

if(secondaryWeapon _unit != "") then {
	_unit removeWeapon (secondaryWeapon _unit);
};

//[0] call SOCK_fnc_updatePartial;
//[3] call SOCK_fnc_updatePartial;
//[4] call SOCK_fnc_updatePartial;
