#include "..\..\script_macros.hpp"

private ["_playTimeFormat"];
disableSerialization;

waitUntil {isNull findDisplay 101};
cutText ["","BLACK IN"];

//hide other units
player switchMove "";
player setBehaviour "CARELESS";

//cam setup
spawn_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
spawn_cam cameraEffect ["Internal", "Back"];
spawn_cam camSetTarget (player modelToWorld [-0.5,0,1]);
spawn_cam camSetPos (player modelToWorld [1,4,2]);
spawn_cam camSetFOV .33;
spawn_cam camSetFocus [50, 0];
spawn_cam camCommit 0;

//createDialog "mainMenu";
if(!(createDialog "mainMenu")) exitWith {[] call life_fnc_initMainMenu;};
(findDisplay 5000) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

//setup text
(CONTROL(5000,5001)) ctrlSetText format ["Welcome, %1",(name player)];

//statslist
//format playtime
_playTimeFormat = format["%1",[life_play_time,"HH:MM:SS"] call BIS_fnc_secondsToString];


(CONTROL(5000,5002)) ctrlSetStructuredText parseText format ["
<t align = 'right' size = '1'>
$%1 - CASH<br/>
$%2 - BANK<br/>
%3 - LEVEL<br/>
%4 - EXP<br/>
%5 - POINTS<br/>
%6 - PLAYTIME<br/>
</t>",
//-- Players Cash
[life_cash]call life_fnc_numberText,
//-- Players Bank Account
[life_atmbank]call life_fnc_numberText,
//-- Current Skill Level
[life_currentExpLevel]call life_fnc_numberText,
//-- Current Player Exp
[life_currentExp]call life_fnc_numberText,
//-- Current Skill Points
[life_currentPerkPoints]call life_fnc_numberText,
//-- Players Game Time
_playTimeFormat];


//Skin player
[] call life_fnc_playerSkins;

//check for display being closed, hide every other player until then
while {true} do {
	//this is reversed - hides you when other players join
	if (isNull (findDisplay 5000)) exitWith {};
	{
		 if (_x != player) then {_x hideObject true;};
	}forEach playableUnits;
};

//waitUntil {isNull (findDisplay 5000)};

spawn_cam cameraEffect ["TERMINATE","BACK"];
camDestroy spawn_cam;
{if (_x != player) then {_x hideObject false;};} forEach playableUnits;

//[] call life_fnc_hudSetup;
//[] call life_fnc_hudUpdate;
