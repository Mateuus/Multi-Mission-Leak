/*
	File: fn_swatSpawnMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	SWAT deployment point selection menu.
*/
private["_spCfg","_sp","_menu","_from"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
disableSerialization;

life_swatSpawn = true;

if(!(createDialog "life_spawn_selection")) exitWith {};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];
((findDisplay 38500) displayCtrl 38599) ctrlSetText "SWAT Deployment Selection";
((findDisplay 38500) displayCtrl 38525) ctrlSetText "Deploy";

ctrlShow[38520,false];

for "_i" from 0 to 5 do
{
	_ctrl = ((findDisplay 38500) displayCtrl ((call compile format["3851%1",_i])));
	if (_i < (count life_swatPosOptions)) then
	{
		_ctrl ctrlSetText ((life_swatPosOptions select _i) select 0);
		_ctrl ctrlShow true;
	}
	else
	{
		_ctrl ctrlShow false;
	};
};

_sp = life_swatPosOptions select 0; //First option is set by default
ctrlSetFocus ((findDisplay 38500) displayCtrl 38510);

[((findDisplay 38500) displayCtrl 38502),1,0.1,_sp select 1] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["Current Deploy Point: %1",_sp select 0]];

waitUntil {isNull (findDisplay 38500)};

life_swatSpawn = false;