#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerKilled.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    When the player dies collect various information about that player
    and pull up the death dialog / camera functionality.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};
//Set some vars
_unit setVariable ["Revive",true,true];
_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.
"ColorCorrections" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
"esg_injured" cutFadeOut 1;
_unit setVariable ["esg_bewusstlos",false,true];
_unit setVariable ["esg_damagestore",0,true];
_unit setVariable ["esg_bewusstlos_delay",0,true];
_unit setVariable ["esg_bewusstlos_stab",0,true];
_unit setVariable ["esg_stabinpro",false,true];
_unit setVariable ["esg_laststab",0,true];
[]spawn {
	disableSerialization;
	_displayhealth = uinamespace getvariable "RscHealthTextures"; 
	_texLower = _displayhealth displayctrl 1211; 
	_texLower ctrlsetfade 1; 
	_texLower ctrlcommit 0; 
	 
	_texMiddle = _displayhealth displayctrl 1212; 
	_texMiddle ctrlsetfade 1;  
	_texMiddle ctrlcommit 0; 
	 
	_texUpper = _displayhealth displayctrl 1213; 
	_texUpper ctrlsetfade 1;  
	_texUpper ctrlcommit 0;
};
_log = format["%1 (%2) hat %3 (%4) getötet. Waffe: %5 Distanz: %6", _killer getVariable["realname", name _killer], getPlayerUID _killer, _unit getVariable["realname", name _unit], getPlayerUID _unit, currentWeapon _killer, _unit distance _killer];
["KILL_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder true;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;
[
	"<t size='0.40' color='#c02525' align='right'>Warte auf die Feuerwehr...<br /></t><t size='0.70' color='#FFFFFF' align='right'>Du hast noch eine Chance wiederbelebt zu werden!</t>",
	[safezoneX + safezoneW - 0.8,0.50],
	[safezoneY + safezoneH - 0.8,0.7],
	5,
	0.5
] spawn BIS_fnc_dynamicText;
(findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu
[]spawn {
	((findDisplay 7300) displayCtrl 7302) ctrlEnable false;
	sleep 7;
	((findDisplay 7300) displayCtrl 7302) ctrlEnable true;
};
//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
    private ["_unit"];
    _unit = _this select 0;
    waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};
//Make the killer wanted
if (!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
    if (vehicle _killer isKindOf "LandVehicle") then {

        [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",RSERV];

        //Get rid of this if you don't want automatic vehicle license removal.
        if (!local _killer) then {
            [2] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    } else {
        [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",RSERV];

        if (!local _killer) then {
            [3] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    };
};
life_save_gear = [];
life_save_gear = [_unit] call life_fnc_fetchDeadGear;

_unit removeWeapon (primaryWeapon _unit);
_unit removeWeapon (handgunWeapon _unit);
_unit removeWeapon (secondaryWeapon _unit);


//Killed by cop stuff...
if (side _killer isEqualTo west && playerSide != west) then {
    life_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!life_use_atm && {CASH > 0}) then {
        [format [localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        CASH = 0;
    };
};

if (!isNull _killer && {_killer != _unit}) then {
    life_removeWanted = true;
};

[_unit] call life_fnc_dropItems;

life_action_inUse = false;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0;
life_is_alive = false;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
if (playerSide isEqualTo civilian) then {
    [4] call SOCK_fnc_updatePartial;
};
