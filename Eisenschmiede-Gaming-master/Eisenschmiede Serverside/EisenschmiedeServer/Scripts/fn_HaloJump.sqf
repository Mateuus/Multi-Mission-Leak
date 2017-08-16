///////////////////////////////////////////////////////////
//                =ATM= Airdrop       	 				    //
//         		 =ATM=Pokertour        		       		    //
//				version : 6.0							        //
//				date : 12/02/2014						   //
//                   visit us : atmarma.fr                 //
/////////////////////////////////////////////////////////

private ["_position","_cut","_dialog","_s_alt","_s_alt_text","_sound","_sound2","_soundPath"];
waitUntil { !isNull player };
if(HaloJump_Jump) exitwith {};
[] call ES_fnc_functions;

		_position = GetPos player;
		_z = _position select 2;
		Altitude = 600;

	hint Localize "Bitte den auf der Map klicken um zu Jumpen!";
	openMap true;

	createDialog "ES_ALTITUDE_SELECT";
	disableSerialization;
	_dialog = findDisplay 2900;
	_s_alt = _dialog displayCtrl 2901;
	_s_alt_text = _dialog displayCtrl 2902;
	_s_alt_text ctrlSetText format["%1", Altitude];
	_s_alt sliderSetRange [400,10000];
	_s_alt slidersetSpeed [100,100,100];
	_s_alt sliderSetPosition Altitude;


Keys = 0;

_ctrl = _dialog displayCtrl 2903;
{
	_index = _ctrl lbAdd _x;
} forEach ["Fr Keyboard","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","US Keyboard","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
lbSetCurSel [2903, 0];

	ATM_Jump_mapclick = false;
	onMapSingleClick "ATM_Jump_clickpos = _pos; ATM_Jump_mapclick = true; HaloJump_Jump = true; onMapSingleClick ''; true;";
	waitUntil {ATM_Jump_mapclick or !(visiblemap)};
	if (!visibleMap) exitwith {
		systemChat "Halo Jump abgebrochen.";
		breakOut "main";
		onMapSingleClick "";
		HaloJump_Jump = false;
	};

	cutText ["", "BLACK OUT", 3];
	sleep 3;
	cutText["You are approaching the drop zone.  Get ready!","BLACK FADED"];
	0 cutFadeOut 999999;
	0 fadeSound 0;
	2 fadeSound 1;
	for "_i" from 0 to 5 do
	{
		playSound "flug";
		sleep 2.2;
		switch (_i) do
		{
			case 3: { playSound "start"; };
			case 4: { playSound "start"; };
			case 5: { playSound "star"; };
		};
	};

	_pos = ATM_Jump_clickpos;
	ATM_Jump_mapclick = if(true) then{
	call compile format ['
	mkr_halo = createmarker ["mkr_halo", ATM_Jump_Clickpos];
	"mkr_halo" setMarkerTypeLocal "hd_dot";
	"mkr_halo" setMarkerColorLocal "ColorGreen";
	"mkr_halo" setMarkerTextLocal "Jump";'];
	};

	_target = player;

			_loadout=[_target] call Getloadout;

		_posJump = getMarkerPos "mkr_halo";
		_x = _posJump select 0;
		_y = _posJump select 1;
		_z = _posJump select 2;
		_target setPos [_x,_y,_z+Altitude];

	openMap false;
	deleteMarker "mkr_halo";

	0=[_target] call Frontpack;

	removeBackpack _target;
	sleep 0,5;
	_target addBackpack "B_Parachute";
if ((getPos _target select 2) >= 8000) then{
	removeHeadgear _target;
	_target addHeadgear "H_CrewHelmetHeli_I";
	sleep 0,5;
};

if (cameraView == "EXTERNAL") then { player switchCamera "INTERNAL"; };
cutText ["", "BLACK IN", 0.75];

hintsilent "";
hint Localize "Drücke eine Taste um den Fallschirm zu Lösen";
Cut_Rope = (FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyDown"];

	_height = getPos _target select 2;

while {(getPos _target select 2) > 2} do {
	if(isTouchingGround _target and player == vehicle player) then{
	}
	else{
	playSound "Vent";
	playSound "Vent2";
	sleep 2;

	};
	if (getPos _target select 2 < 150) then {
		_target action ["OpenParachute", _target];
	};
	if(!alive _target) then {
	_target setPos [getPos _target select 0, getPos _target select 1, 0];
	0=[_target,_loadout] call Setloadout;
	};
};

	player playMove "amovpercmstpsnonwnondnon";


	hint Localize "Lade altes Gear...";
		deletevehicle (_target getvariable "frontpack"); _target setvariable ["frontpack",nil,true];
		deletevehicle (_target getvariable "lgtarray"); _target setvariable ["lgtarray",nil,true];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", Cut_Rope];
sleep 3;
hintsilent "";
sleep 1;

	0=[_target,_loadout] call Setloadout;

HaloJump_Jump = false;
if (true) exitWith {};