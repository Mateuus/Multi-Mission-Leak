/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Opens the admin menu
*/

private ["_dcedPlayers"];

if((DS_adminLevel != 1)&&(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

disableSerialization;

waitUntil {!isNull (findDisplay 2900)};

_dialog = findDisplay 2900;

//Buttons
_btn1 = _dialog displayCtrl 2400; //Add Note
_btn2 = _dialog displayCtrl 2401; //Unlock Keys
_btn3 = _dialog displayCtrl 2402; //Request Join TS
_btn4 = _dialog displayCtrl 2403; //Remove NLR
_btn5 = _dialog displayCtrl 2404; //Spectate
_btn6 = _dialog displayCtrl 2405; //Spectate EG
_btn7 = _dialog displayCtrl 2406; //Compensate
_btn8 = _dialog displayCtrl 2407; //Jail/Unjail
_btn9 = _dialog displayCtrl 2408; //Quick Kick
_btn10 = _dialog displayCtrl 2409; //Temp Ban
_btn11 = _dialog displayCtrl 2410; //Sync Data
_btn12 = _dialog displayCtrl 2411; //Increase Carry
_btn13 = _dialog displayCtrl 2412; //Teleport
_btn14 = _dialog displayCtrl 2413; //Teleport Here
_btn15 = _dialog displayCtrl 2414; //Freeze/Unfreeze
_btn16 = _dialog displayCtrl 2415; //Script Kill

_btn17 = _dialog displayCtrl 2416; //Sync All
_btn18 = _dialog displayCtrl 2417; //Increase Carry (All)
_btn19 = _dialog displayCtrl 2418; //God Mode
_btn20 = _dialog displayCtrl 2419; //Markers
_btn21 = _dialog displayCtrl 2420; //Debug Console
_btn22 = _dialog displayCtrl 2421; //--Unused--

_btn23 = _dialog displayCtrl 2422; //History
_btn24 = _dialog displayCtrl 2423; //Temp Bans
_btn25 = _dialog displayCtrl 2424; //Close

_btn1 ctrlEnable false;
_btn2 ctrlEnable false;
_btn3 ctrlEnable false;
_btn4 ctrlEnable false;
_btn5 ctrlEnable false;
_btn6 ctrlEnable false;
_btn7 ctrlEnable false;
_btn8 ctrlEnable false;
_btn9 ctrlEnable false;
_btn10 ctrlEnable false;
_btn11 ctrlEnable false;
_btn12 ctrlEnable false;
_btn13 ctrlEnable false;
_btn14 ctrlEnable false;
_btn15 ctrlEnable false;
_btn16 ctrlEnable false;
_btn17 ctrlEnable false;
_btn18 ctrlEnable false;
_btn19 ctrlEnable false;
_btn20 ctrlEnable false;
_btn21 ctrlEnable false;
_btn22 ctrlEnable false;
_btn23 ctrlEnable false;
_btn24 ctrlEnable false;

if(DS_adminLevel > 0)then {
	//Player controls
	_btn1 ctrlSetTooltip "Adds a note to the player if the above text box contains something";
	_btn1 ctrlSetText "Add Note";
	_btn1 buttonSetAction "[] spawn DS_fnc_adminAddNote;";
	_btn1 ctrlEnable true;

    _btn2 ctrlSetTooltip "Unlock a bugged player's keys or unlock the trunk of any vehicle/house they are looking at";
	_btn2 ctrlSetText "Unlock Keys";
	_btn2 buttonSetAction "[] spawn DS_fnc_adminUnlockKeys;";
	_btn2 ctrlEnable true;

    _btn3 ctrlSetTooltip "Sends an alert to the player to join our TS server";
	_btn3 ctrlSetText "Request Join TS";
	_btn3 buttonSetAction "[] spawn DS_fnc_adminRequestJoinTS;";
	_btn3 ctrlEnable true;

	_btn4 ctrlSetTooltip "Removes the player's NLR";
	_btn4 ctrlSetText "Remove NLR";
	_btn4 buttonSetAction "[] spawn DS_fnc_adminRemoveNLR;";
	_btn4 ctrlEnable true;

	_btn23 ctrlSetTooltip "Check recently planted C4's etc for baiting";
	_btn23 ctrlSetText "History";
	_btn23 buttonSetAction "[] spawn DS_fnc_adminBaiters;";
	_btn23 ctrlEnable true;
};

if(DS_adminLevel > 1)then {
    //Player controls
    _btn5 ctrlSetText "Spectate";
    _btn5 ctrlSetTooltip "Starts spectating the player";
	_btn5 buttonSetAction "[] spawn DS_fnc_adminSpectate;";
	_btn5 ctrlEnable true;

	_btn6 ctrlSetText "EG Spectate";
    _btn6 ctrlSetTooltip "Starts spectating the player";
	_btn6 buttonSetAction "[] spawn DS_fnc_adminSpectateEG;";
	_btn6 ctrlEnable true;

	_btn7 ctrlSetText "Compensate";
	_btn7 ctrlSetTooltip "Opens the compensation menu for the player";
	_btn7 buttonSetAction "[] spawn DS_fnc_adminCompensate;";
	_btn7 ctrlEnable true;

    _btn8 ctrlSetText "Jail/Unjail";
    _btn8 ctrlSetTooltip "Sends to or releases the player from jail";
	_btn8 buttonSetAction "[] spawn DS_fnc_adminJail;";
	_btn8 ctrlEnable true;

    _btn9 ctrlSetText "Quick Kick";
    _btn9 ctrlSetTooltip "Quick kicks the player from the server";
	_btn9 buttonSetAction "[] spawn DS_fnc_adminQuickKick;";
	_btn9 ctrlEnable true;

    _btn10 ctrlSetText "Temp Ban";
    _btn10 ctrlSetTooltip "Temporarily bans the player from the server";
	_btn10 buttonSetAction "[] spawn DS_fnc_adminTempBan;";
	_btn10 ctrlEnable true;

    _btn11 ctrlSetText "Sync Data";
    _btn11 ctrlSetTooltip "Syncs the player's data";
	_btn11 buttonSetAction "[] spawn DS_fnc_adminSyncData;";
	_btn11 ctrlEnable true;

    _btn12 ctrlSetText "Increase Carry";
    _btn12 ctrlSetTooltip "Increases or resets the player's carry weight";
	_btn12 buttonSetAction "[] spawn DS_fnc_adminIncreaseWeight;";
	_btn12 ctrlEnable true;

    //Miscellaneous controls
    _btn17 ctrlSetText "Sync All";
    _btn17 ctrlSetTooltip "Syncs everyone's data";
	_btn17 buttonSetAction "[true] spawn DS_fnc_adminSyncData;";
	_btn17 ctrlEnable true;

	//Bottom controls
    _btn24 ctrlSetText "Temp Bans";
	_btn24 ctrlSetTooltip "Opens the temp ban list";
	_btn24 buttonSetAction "[] call DS_fnc_tempBanList;";
	_btn24 ctrlEnable true;
};

if(DS_adminLevel > 2)then {
    //Miscellaneous controls
    _btn18 ctrlSetText "Increase Carry (All)";
    _btn18 ctrlSetTooltip "Increases the carry weight of all players";
	_btn18 buttonSetAction "[] spawn DS_fnc_adminIncreaseWeightAll;";
	_btn18 ctrlEnable true;
};

if((getPlayerUID player) isEqualTo "76561198038366032")then {
	_btn21 ctrlSetText "Debug Console";
	_btn21 ctrlSetTooltip "Opens the debug console";
	_btn21 buttonSetAction "[] call DS_fnc_adminDebugConsole;";
	_btn21 ctrlEnable true;
};

if(DS_adminLevel > 3)then {
    //Player controls
    _btn13 ctrlSetText "Teleport";
	_btn13 ctrlSetTooltip "Teleports you to a selected position";
	_btn13 buttonSetAction "[] call DS_fnc_adminTeleport; hint 'Select where you would like to teleport';";
	_btn13 ctrlEnable true;

    _btn14 ctrlSetText "Teleport Here";
	_btn14 ctrlSetTooltip "Teleports the player to your position";
	_btn14 buttonSetAction "[] call DS_fnc_adminTeleportHere;";
	_btn14 ctrlEnable true;

    _btn15 ctrlSetText "Freeze/Unfreeze";
	_btn15 ctrlSetTooltip "Freezes or unfreezes the player";
	_btn15 buttonSetAction "[] call DS_fnc_adminFreeze;";
	_btn15 ctrlEnable true;

    _btn16 ctrlSetText "Script Kill";
	_btn16 ctrlSetTooltip "Kills the player";
	_btn16 buttonSetAction "[] call DS_fnc_adminKill;";
	_btn16 ctrlEnable true;

    //Miscellaneous controls
    _btn19 ctrlSetText "God Mode";
	_btn19 ctrlSetTooltip "Toggles god mode on/off on yourself";
	_btn19 buttonSetAction "[] spawn DS_fnc_adminGodMode;";
	_btn19 ctrlEnable true;

    _btn20 ctrlSetText "Markers";
	_btn20 ctrlSetTooltip "Toggles admin player markers on/off";
	_btn20 buttonSetAction "[] spawn DS_fnc_adminMarkers;";
	_btn20 ctrlEnable true;

    _btn21 ctrlSetText "Debug Console";
	_btn21 ctrlSetTooltip "Opens the debug console";
	_btn21 buttonSetAction "[] call DS_fnc_adminDebugConsole;";
	_btn21 ctrlEnable true;
};

//Close button
_btn25 ctrlSetText "Close";
_btn25 ctrlSetTooltip "Closes the admin menu";
_btn25 buttonSetAction "closeDialog 0;";

//Combo box
_comboBox = _dialog displayCtrl 2100;
_comboBox lbAdd "All";
_comboBox lbAdd "Civilians";
_comboBox lbAdd "WL Civilians";
_comboBox lbAdd "Police";
_comboBox lbAdd "Staff";
_comboBox lbSetCurSel 0;

//Functions
if(!DS_amFncsLoaded)then {[] spawn DS_fnc_adminMenuFunctions;waitUntil {DS_amFncsLoaded};};

//Search button
_searchBox = _dialog displayCtrl 1400;
_searchBox ctrlAddEventHandler ["KeyDown", {
	params ["_control","_key"];

	if((_key isEqualTo 28)||(_key isEqualTo 156))then {
		playSound ["SoundClick",true];
		[_control] call DS_fnc_amApplySearch;
	};
}];

//Fill the player list
if(DS_amShowIcons)then {
	_checkBox2 = _dialog displayCtrl 2800;
	_checkBox2 cbSetChecked true;
};

DS_amSearchText = "";
[] call DS_fnc_amUpdatePlayerList;

//Show disconnected players
_dcedPlayers = "Recently Logged Out Players\n(And their distance to you)\n\n";
if(!(DS_recentlyLogged isEqualTo []))then {
	{
		_dcedPlayers = _dcedPlayers + format ["%1 (%2m)\n",(_x select 0),(round(player distance (_x select 1)))];
	} forEach DS_recentlyLogged;
};
hint _dcedPlayers;

[] spawn {
	private ["_markers","_marker"];

	_markers = [];

	{
		_marker = createMarkerLocal [format ["Marker%1",_forEachIndex],(_x select 1)];
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format ["%1 logged here",(_x select 0)];
		_markers pushBack _marker;
	} forEach DS_recentlyLogged;

	sleep 60;

	{
		deleteMarkerLocal _x;
	} forEach _markers;
};