/*
    Darkside Life

	Author: ColinM9991

	Description:
	Spectates the player
*/

#include "\A3\Functions_F_Exp_A\EGSpectatorCommonDefines.inc"

private ["_unit","_player","_action","_targets"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};
if((DS_realMode)&&(playerSide isEqualTo civilian))then{DS_realMode = false;sleep 0.2;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};
if(_unit isEqualTo player)exitWith{hint "You can not spectate yourself"};

_player = (name player);
_action = format ["(Spectating %1)",name _unit];
_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
[_player,_action] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];

[] spawn {
	while{dialog}do {
		closeDialog 0;
		sleep 0.01;
	};
};

hint format ["You are now spectating %1 \n\n Press F10 to stop spectating",_unit getVariable ["name",name _unit]];

DS_amUnit = _unit;

//Initialize the spectate menu
if(DS_adminLevel < 3)then {
	//Moderator spectator
	["Initialize",[
		player, //spectator
		[], //whitelistedSides
		false, //allowAi
		false, //allowFreeCamera
		true, //allow3PPCamera
		false, //showFocusInfo
		true, //showCameraButtons
		true, //showControlsHelper
		false, //showHeader
		false //showLists
	]] call BIS_fnc_EGSpectator;
} else {
	//Admin+ spectator
	["Initialize",[
		player, //spectator
		[], //whitelistedSides
		false, //allowAi
		true, //allowFreeCamera
		true, //allow3PPCamera
		false, //showFocusInfo
		true, //showCameraButtons
		true, //showControlsHelper
		false, //showHeader
		true //showLists
	]] call BIS_fnc_EGSpectator;

	_locations = [
		["busKavTruck","Kavala"],
		["buspyrgos","Pyrgos"],
		["busAthiraGarage","Athira"],
		["busSofia","Sofia"],
		["busZaros","Zaros"],
		["Rebelop_2_2","Rebel North"],
		["Rebelop_2_1","Rebel Selakano"],
		["hospital_3","Telos Hospital"],
		["hospital_2","Sofia Hospital"],
		["auctionHouse","Black Market Auction House"],
		["gt_1","North Chop Shop"],
		["gt","South Chop Shop"],
		["kos","Rebel KOS"],
		["gangarea","Gang Hideout 1"],
		["gangarea_1","Gang Hideout 2"],
		["gangzone2","Gang Hideout 3"],
		["gangarea_2","Gang Hideout 4"],
		["Police CP_1_1","Checkpoint 1"],
		["Police CP_1_1_2","Checkpoint 2"],
		["Police CP_1_1_1_1","Checkpoint 3"],
		["fed_reserve_1","Bank"],
		["powerMarker","Power Station"],
		["jail","Jail"],
		["relics_1_1","Fort Knox"],
		["relics_1_2","Altis Research Facility"]
	];

	{
		_marker = (_x select 0);
		_name = (_x select 1);
		_description = "";
		_markerPos = getMarkerPos _marker; _markerPos set [2,20];
		_texture = "\A3\3den\Data\Displays\Display3DEN\PanelLeft\locationList_ca.paa";
		_cameraTransform = [_markerPos,[0,0,0],[0,0,0]];
		_dirOverride = [0,false];

		["AddLocation",[_marker,_name,_description,_texture,_cameraTransform,_dirOverride]] call BIS_fnc_EGSpectator;
	} forEach _locations;
};

//Wait until the spectate menu has been fully opened
waitUntil {!isNull (findDisplay 60492)};

//Focus on the spectate target
["SetFocus",[DS_amUnit]] call DISPLAY;
["SetCameraMode",[MODE_FOLLOW]] call CAM;

//Don't let the spectate system make you invulnerable
player allowDamage true;

//Add a KeyDown event handler
AM_Exit = (findDisplay 60492) displayAddEventHandler ["KeyDown",{
	_userAction16 = (actionKeys "User17") select 0;
	_userAction17 = (actionKeys "User18") select 0;
	_userAction18 = (actionKeys "User19") select 0;
	_userAction19 = (actionKeys "User20") select 0;
	_mapKey = (actionKeys "ShowMap") select 0;
	_handled = false;

	switch(_this select 1)do {
		case _userAction16: { //Admin menu
			if(_ctrl)then{[] spawn DS_fnc_adminMenuOpen;};
			_handled = true;
		};
		/*
		case _userAction17: { //Sidechat warning
			[] spawn DS_fnc_sidechatWarning;
			_handled = true;
		};
		case _userAction18: { //Repair buildings
			[] spawn DS_fnc_repairBuildings;
			_handled = true;
		};
		case _userAction19: { //Clean up vehicle
			[] spawn DS_fnc_cleanUpVeh;
			_handled = true;
		};
		*/
		case _mapKey: { //M Key
			if(DS_adminLevel < 3)then {
				_handled = true;
			};
		};
		case 36: { //J Key
			[] spawn DS_fnc_openHelp;
			_handled = true;
		};
		case 3: { //2 Key + Shift
			if((!_shift)&&(!_ctrl))then {
				[] spawn DS_fnc_quickPhone;
				_handled = true;
			};
		};
		case 4: { //3 Key + Shift
			if((!_shift)&&(!_ctrl))then {
				DS_cursorTarget = cursorTarget;
				[false] spawn DS_fnc_menuPhone;
				_handled = true;
			};
		};
		case 2: { //1 Key
			[] call DS_fnc_quickDisplay;
			_handled = true;
		};
		case 10: { //9 Key
			if(player distance spawnIsland > 1000)then {
				closeDialog 0;
				createDialog "bugMenu";
			};

			_handled = true;
		};
		case 21: { //Y Player menu
			[] call DS_fnc_menuPlayer;
			_handled = true;
		};
		case 61: { //F3 Earplugs
			[] spawn DS_fnc_earPlugs;
			_handled = true;
		};
		case 68: { //F10 Close spectate menu
			(findDisplay 60492) displayRemoveEventHandler ["KeyDown",AM_Exit];

			["Terminate"] call BIS_fnc_EGSpectator;
			hint "You have stopped spectating";
			DS_amUnit = player;

			if((playerSide isEqualTo civilian)&&((DS_infoArray select 34) == 1))then {
				DS_realMode = true;
				[] spawn {
					DS_realMode = true;
					while{true}do {
						waitUntil {(cameraView isEqualTo "EXTERNAL")};
						if(!DS_realMode)exitWith{};
						(vehicle player) switchCamera "INTERNAL";
					};
				};
			};

			_handled = true;
		};
	};

	_handled
}];