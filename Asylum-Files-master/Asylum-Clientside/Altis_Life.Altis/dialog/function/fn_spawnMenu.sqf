/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_menu","_from"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_exited = false;
if(life_respawned) then {
	[] call life_fnc_respawned;
	if (48 in life_talents) then
	{
		_lucky = (floor (random 8) == 0);
		if (_lucky) exitWith
		{
			["Hospital", true] spawn life_fnc_revived;
			_exited = true;
		};
	};
};
if (_exited) exitWith {};

disableSerialization;

if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;

ctrlShow[38514,(playerSide != independent)];

/*if(playerSide == civilian) then
{
	if (life_donator > 1) then { ctrlEnable[38514,true]; }
	else { ctrlEnable[38514,false]; };
};*/
ctrlEnable[38514,true]; // REMOVE THIS LINE WHEN TOWN IS CHANGED

if (playerSide == west) then
{
	if (life_last_airhq > (time - (60 * 5))) then { ctrlEnable[38513,false]; }
	else { ctrlEnable[38513,true]; };
};

if (count life_houses < 1) then
{
	ctrlShow[38520,false];
}
else
{
	_menu = (findDisplay 38500) displayCtrl 38520;
	lbClear _menu;
	_from = 4;
	if (worldName in ["Altis","Australia","Tanoa"]) then { (_menu) ctrlSetEventHandler ["LBSelChanged","[(lbCurSel 38520)+4] call life_fnc_spawnPointSelected"]; }
	else { _from = 2; (_menu) ctrlSetEventHandler ["LBSelChanged","[(lbCurSel 38520)+2] call life_fnc_spawnPointSelected"]; };
	
	for "_i" from _from to (count _spCfg)-1 do
	{
		_menu lbAdd ((_spCfg select _i) select 1);
		_menu lbSetData [(lbSize _menu)-1,((_spCfg select _i) select 0)];
	};
};

for "_i" from 0 to (count _spCfg)-1 do
{
	_ctrl = ((findDisplay 38500) displayCtrl ((call compile format["3851%1",_i])));
	_ctrl ctrlSetText ((_spCfg select _i) select 1);
	_ctrl ctrlEnable (!(((_spCfg select _i) select 0) in life_disabled_spawns));
};

if (count life_disabled_spawns > 0) then
{
	[_spCfg] spawn
	{
		disableSerialization;
		private ["_ctrl","_spCfg"];
		_spCfg = _this select 0;
		while {count life_disabled_spawns > 0} do
		{
			sleep 1;
			for "_i" from 0 to (count _spCfg)-1 do
			{
				_ctrl = ((findDisplay 38500) displayCtrl ((call compile format["3851%1",_i])));
				_ctrl ctrlEnable (!(((_spCfg select _i) select 0) in life_disabled_spawns));
			};
		};
	};
};

if (worldName == "Stratis") then
{
	ctrlShow[38512,false];
	ctrlShow[38513,false];
	ctrlShow[38514,false];
};

if !(worldName == "Australia" && playerSide == west) then
{
	ctrlShow[38515,false];
};

_sp = _spCfg select 0; //First option is set by default
ctrlSetFocus ((findDisplay 38500) displayCtrl 38510);

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["Current Spawn Point: %1",_sp select 1]];