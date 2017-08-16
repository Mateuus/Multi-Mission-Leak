/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens the admin menu
*/
private ["_dcedPlayers"];
if(!((getPlayerUID player) in DS_adminlist1))exitwith{closeDialog 0;};//Fuck of haxor
if(DS_adminlevel < 2) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
_btn1 = _display displayCtrl 1600; 
_btn2 = _display displayCtrl 1601; 
_btn3 = _display displayCtrl 1602; 
_btn4 = _display displayCtrl 1603; 
_btn5 = _display displayCtrl 1604; 
_btn6 = _display displayCtrl 1605; 
_btn7 = _display displayCtrl 1606; 
_btn8 = _display displayCtrl 1607; 
_btn9 = _display displayCtrl 1608; 
_btn10 = _display displayCtrl 1609; 
_btn11 = _display displayCtrl 1610; 
_btn12 = _display displayCtrl 1611; 
_btn13 = _display displayCtrl 1612;
_btn14 = _display displayCtrl 1613;
_btn15 = _display displayCtrl 1614;
_btn16 = _display displayCtrl 1615;
_btn17 = _display displayCtrl 1616;

_btn1 ctrlShow false;
_btn2 ctrlShow false;
_btn3 ctrlShow false;
_btn4 ctrlShow false;
_btn5 ctrlShow false;
_btn6 ctrlShow false;
_btn7 ctrlShow false;
_btn8 ctrlShow false;
_btn9 ctrlShow false;
_btn10 ctrlShow false;
_btn11 ctrlShow false;
_btn12 ctrlShow false;
_btn13 ctrlShow false;
_btn14 ctrlShow false;
_btn15 ctrlShow false;
_btn16 ctrlShow false;

if(DS_adminLevel > 1)then
	{
	_btn1 ctrlSetTooltip "Spectate Player";
	_btn1 ctrlSetText "Spectate";
	_btn1 buttonSetAction "[] spawn DS_fnc_adminSpectate;";
	_btn1 ctrlShow true;

	_btn2 ctrlSetTooltip "Quick Kick also strips a player of his gear and syncs his data";
	_btn2 ctrlSetText "Quick Kick";
	_btn2 buttonSetAction "[] spawn DS_fnc_quickKick;";
	_btn2 ctrlShow true;
	
	_btn3 ctrlSetTooltip "Temp ban until next restart also strips a player of his gear and syncs his data";
	_btn3 ctrlSetText "Temp Ban";
	_btn3 buttonSetAction "[] spawn DS_fnc_tempBan;";
	_btn3 ctrlShow true;
	
	_btn4 ctrlSetTooltip "Releases target from jail";
	_btn4 ctrlSetText "Jail Release";
	_btn4 buttonSetAction "[] spawn DS_fnc_haxorKeysDisable;";
	_btn4 ctrlShow true;
	
	_btn5 ctrlSetTooltip "Sync all players data - DO not use lightly as it can cause server lag";
	_btn5 ctrlSetText "Sync All";
	_btn5 buttonSetAction "[] call DS_fnc_adminSync;";
	_btn5 ctrlShow true;
	
	_btn6 ctrlSetTooltip "Send target to jail for 30 minutes for glitching out of restraints";
	_btn6 ctrlSetText "Jail Target";
	_btn6 buttonSetAction "[] spawn DS_fnc_toJail;";
	_btn6 ctrlShow true;
	
	_btn7 ctrlSetTooltip "Unlock a bugged players keys or unlock the trunk of any vehicle/house he is looking at || Also adds a note to the player if the above textbox contains something";
	_btn7 ctrlSetText "Unlock Keys/Add Note";
	_btn7 buttonSetAction "[] spawn DS_fnc_unlockBugged;";
	_btn7 ctrlShow true;
	};
if(DS_adminLevel > 2)then
	{
	_btn8 ctrlSetTooltip "Compensates the targets bank account";
	_btn8 ctrlSetText "Compensate";
	_btn8 buttonSetAction "[] call DS_fnc_adminCompensate;";
	_btn8 ctrlShow true;
	
	_btn9 ctrlSetTooltip "Increases everybodies carry weight to 5000 kg, this shouldn't be used lightly";
	_btn9 ctrlSetText "Increase Carry Weight";
	_btn9 buttonSetAction "[] spawn DS_fnc_adminRestart;";
	_btn9 ctrlShow true;
	};
	
if(DS_adminLevel > 3)then
	{
	_btn10 ctrlSetTooltip "Teleport to chosen location";
	_btn10 ctrlSetText "Teleport";
	_btn10 buttonSetAction "[] call DS_fnc_adminTeleport; hint 'Select where you would like to teleport';";
	_btn10 ctrlShow true;
	
	_btn11 ctrlSetTooltip "Teleport player to you";
	_btn11 ctrlSetText "Teleport Here";
	_btn11 buttonSetAction "[] call DS_fnc_adminTpHere;";
	_btn11 ctrlShow true;
	
	_btn12 ctrlSetTooltip "God Mode On/Off";
	_btn12 ctrlSetText "God Mode";
	_btn12 buttonSetAction "[] call DS_fnc_adminGodMode;";
	_btn12 ctrlShow true;
	
	_btn13 ctrlSetTooltip "Freeze/Unfreeze Target (You can only freeze one person at a time)";
	_btn13 ctrlSetText "Freeze";
	_btn13 buttonSetAction "[] call DS_fnc_adminFreeze;";
	_btn13 ctrlShow true;
	
	_btn14 ctrlSetTooltip "Player Map Markers";
	_btn14 ctrlSetText "Markers";
	_btn14 buttonSetAction "[] spawn DS_fnc_adminMarkers;";
	_btn14 ctrlShow true;
	
	_btn15 ctrlSetTooltip "Script Kill Target";
	_btn15 ctrlSetText "Script Kill";
	_btn15 buttonSetAction "[] call DS_fnc_adminKill;";
	_btn15 ctrlShow true;
	
	_btn16 ctrlSetTooltip "Opens the Debug Console";
	_btn16 ctrlSetText "Debug";
	_btn16 buttonSetAction "[] call DS_fnc_adminDebugCon;";
	_btn16 ctrlShow true;
	};
	
_btn17 ctrlSetTooltip "WTF Do you think it does?";
_btn17 ctrlSetText "Close";
_btn17 buttonSetAction "closeDialog 0;";
//Purge List
lbClear _list;

{
	_gangName = (group _x) getVariable ["gangName",""];
	if(_gangName == "")then{_gangName = "No Gang"};
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"WL"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2  (%3)", _x getVariable["name",name _x],_side,_gangName];
	_toolTip = format ["Slot - %1  (%2)",_x,_gangName];
	_list lbSetTooltip [(lbSize _list)-1, _toolTip];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
lbSort [_list, "ASC"];
if(DS_adminlevel < 2) exitWith {closeDialog 0;};
if(!((getPlayerUID player) in DS_adminlist1))exitwith{closeDialog 0;};//Fuck of haxor
_dcedPlayers = "Recently Logged Out Players\n(And their distance to you)\n\n";
if(count(DS_recentlyLogged) > 0)then
	{
		{
			_dcedPlayers = _dcedPlayers + format ["%1 (%2m)\n",(_x select 0),(round(player distance (_x select 1)))];
		}forEach DS_recentlyLogged;
	};
_dcedPlayers = format ["%1\n\nRecently placed markers\n\n",_dcedPlayers];	
if(count(DS_markerArray) > 0)then
	{
		{
			_dcedPlayers = _dcedPlayers + format ["%1 || %2 || %3\n",(_x select 0),(_x select 1),((_x select 3) select 1)];
		}forEach DS_markerArray;

	};
hint _dcedPlayers;