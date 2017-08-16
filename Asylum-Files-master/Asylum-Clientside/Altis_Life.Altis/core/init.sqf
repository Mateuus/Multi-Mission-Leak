/*
	Master client initialization file
*/

private["_handle","_timeStamp"];
cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Asylum Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

[] spawn life_fnc_abortEnabled; // Monitor for restrain and modify UI menus accordingly
waitUntil {!isNull player && player == player}; //Wait till the player is ready
enableSentences false; // disable the AI radio chatter
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
//[player] execVM "core\client\disable_respawn.sqf";
//Monitor player chat
execVM "core\chatEvents\init.sqf";
diag_log "::Life Client:: Monitoring player chat input";
waitUntil {!isNil "aniChatEvents_initated"};
// Event Handlers
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Emptying all world fuel pumps..";

_pumps = switch (worldName) do
{
	case "Altis": { nearestObjects [getMarkerPos "corrections", ["Land_fs_feed_F"], 15000] };
	case "Stratis": { nearestObjects [getMarkerPos "corrections", ["Land_fuelstation_feed_F"], 15000] };
	case "Tanoa": { nearestObjects [getMarkerPos "corrections", ["Land_fs_feed_F","Land_fuelstation_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 15000] };
	case "Australia": { nearestObjects [getMarkerPos "corrections", ["Land_fs_feed_F","Land_Ind_FuelStation_Feed_EP1","Land_E76_gasstation"], 15000] };
	default { [] };
};
{
	_x setFuelCargo 0;
	_x addAction ["Refuel nearest vehicle", life_fnc_refuelVehicle, 1, 3, true, true, "", ' _this distance _target < 5 && cursorTarget == _target '];
	_x addAction["Repair Vehicle ($50)",life_fnc_pumpRepair,"",999,false,false,"",'vehicle player != player && (vehicle player) distance cursorObject < 6 '];
} forEach _pumps;

diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {life_fnc_clientGroupLeader})};
diag_log "::Life Client:: Received server functions.";
[] call life_fnc_sessionSetup;
waitUntil {life_session_completed};
cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;
//[] execVM "core\client\group_base_respawn.sqf";
//diag_log "::Life Client:: Group Base Execution";

// Before stealing this bit of code for your own server, please contact Asylum and ask
// for permission to use it.  We usually say yes; there's no need to steal.
/*player setVariable ["life_queued", true, true];
player allowDamage false;
disableUserInput true;
cutText["Requesting availability from server, please wait...","BLACK FADED"];
{ _x enableSimulation false; } foreach allPlayers;
{ _x enableSimulation false; } foreach vehicles;
0 cutFadeOut 9999999;
[[player,life_adminlevel],"ASY_fnc_requestQueue",false,false] spawn life_fnc_MP;
waitUntil {life_queue_place > -1};

_queue = life_queue_place;
while {true} do
{
	{ _x enableSimulation false; } foreach allPlayers;
	{ _x enableSimulation false; } foreach vehicles;
	if (life_queue_place == 0) exitWith {};
	if (life_queue_place > 0) then
	{
		cutText [format["Server full, you are in queue to join.  Current position in queue is %1.", life_queue_place],"BLACK FADED"];
		0 cutFadeOut 9999999;
	};
	waitUntil {_queue != life_queue_place};
	_queue = life_queue_place;
};
[[player,true],"life_fnc_simDisable",false,false] spawn life_fnc_MP;
player allowDamage true;
disableUserInput false;
player setVariable ["life_queued", nil, true];
{
	_q = _x getVariable ["life_queued", false];
	if (!_q) then { _x enableSimulation true; };
} foreach allPlayers;
{
	_db = _x getVariable ["dbInfo", []];
	if (count _db > 0) then { _x enableSimulation true; };
} foreach vehicles;
*/

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};

	case sideLogic:
	{
		_handle = [] spawn life_fnc_initZeus;
		waitUntil {scriptDone _handle};
	};
};

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call life_fnc_keyUpHandler"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyDownHandler"];
(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call life_fnc_mouseDownHandler"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", "_this call life_fnc_mouseUpHandler"];
(findDisplay 46) displayAddEventHandler ["MouseZchanged", "_this spawn life_fnc_enableActions"];
player addRating 99999999;
//[] execVM "core\client\init_survival.sqf";
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Asylum Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_ringer = (profileNamespace getVariable["AsylumSettings",[1200,1200,1600,true,false]]) select 3;
cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
//[player] execVM "core\client\intro.sqf";
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player, true];

if (playerSide != sideLogic) then
{
	[] execVM "core\init_survival.sqf";
	//[true] spawn life_fnc_sessionUpdate;
	// Force session DB save every 5 + random mins
	[] spawn  {
		while{true} do
		{
			sleep (300 + (random 180));
			[] call life_fnc_sessionUpdate;
			{
				if(local _x && {(count units _x == 0)}) then {
					deleteGroup _x;
				};
			} forEach allGroups;
		};
	};

};

setPlayerRespawnTime life_respawn_timer; //Set our default respawn time.

[] spawn
{
	while {true} do
	{
		_rem = [];
		_units = getPosATL player nearEntities [["Man","Car","Air","Ship"],20];
		_units = _units - [vehicle player];
		{ if (_x isKindOf "Animal") then { _rem pushBack _x} } forEach _units;
		_units = _units - _rem;
		life_tag_cache = life_tag_units;
		life_tag_units = _units;
		sleep 1.3;
	};
};

[] spawn
{
	while {true} do {
		waitUntil{!isNull(findDisplay 49)}; //Wait for ESC menu to be opened
		((findDisplay 49) displayCtrl 122) ctrlEnable false;
		((findDisplay 49) displayCtrl 122) ctrlShow false;
		waitUntil {isNull (findDisplay 49)}; //Wait for it to be closed
		showChat true; //Restore chat
	};
};

// Disallow Ghillie and update uniform textures
[] spawn
{
	private ["_prev","_diff"];
	while {true} do
	{
		_prev = uniform player;
		_diff = str difficultyEnabledRTD;
		switch (_prev) do
		{
			case "U_B_HeliPilotCoveralls": { if (!difficultyEnabledRTD) then { removeUniform player } };
			case "V_HarnessOGL_brn": { if (!(33 in life_talents)) then { removeUniform player } };
			case "U_NikosAgedBody": { if (getPlayerUID player != (life_configuration select 0)) then { removeUniform player } };
			case "U_O_GhillieSuit": { if (!(30 in life_talents) || !(8 in life_lootRewards)) then { removeUniform player } };
			case "U_O_PilotCoveralls": { if (!(9 in life_lootRewards)) then { removeUniform player } };
		};
		[] call life_fnc_equipGear;
		waitUntil {sleep 4;(_prev != (uniform player) || _diff != (str difficultyEnabledRTD))};
	};
};

// Head gear monitor
[] spawn
{
	private ["_prev"];
	while {true} do
	{
		_prev = headgear player;
		switch (_prev) do
		{
			case "H_PilotHelmetHeli_O": { if !((vehicle player) isKindOf "Air") then { removeHeadgear player } };
			case "H_HelmetB_light": { if (!(6 in life_lootRewards)) then { removeHeadgear player } };
			case "H_HelmetB_light_snakeskin": { if (!(7 in life_lootRewards)) then { removeHeadgear player } };
			case "H_HelmetB_light_black": { if (!(6 in life_lootRewards) && !(7 in life_lootRewards)) then { removeHeadgear player } };
		};
		waitUntil {sleep 10;_prev != (headgear player)};
	};
};

// Vehicle change monitor
[] spawn
{
	private ["_prev", "_diff"];
	while {true} do
	{
		_prev = vehicle player;
		_diff = str difficultyEnabledRTD;
		if ((vehicle player) isKindOf "Car" && life_seatbelt) then
		{
			life_seatbelt = false;
		};
		if ((vehicle player) isKindOf "Air" && driver (vehicle player) == player) then
		{
			//(vehicle player) enableRopeAttach difficultyEnabledRTD;
			//(vehicle player) enableCopilot !difficultyEnabledRTD;
			if (difficultyEnabledRTD && uniform player == "U_B_HeliPilotCoveralls" && headgear player == "") then { player addHeadgear "H_PilotHelmetHeli_O"; };
			while {_prev == (vehicle player) && driver (vehicle player) == player } do
			{
				_ropes = ropes (vehicle player);
				if (!(isNull (gunner (getSlingLoad (vehicle player)))) && (count _ropes) > 0) then
				{
					{
						deleteVehicle _x;
					} forEach _ropes;
					hint "Your vehicle ropes snapped from someone in the gunner seat!";
				};
				sleep 4;
			};
		};
		if(vehicle player != player) then {
			if (typeOf (vehicle player) == "B_G_Offroad_01_armed_F" && gunner (vehicle player) == player) then {
				(vehicle player) enableRopeAttach false;
			} else {
				//(vehicle player) enableRopeAttach true;
			};
			if(!isNull life_holding_barrel) exitWith {[true,true,dropOilAction,_barrel] call life_fnc_dropOil;};
		};
		if (!((vehicle player) isKindOf "Air") && headgear player == "H_PilotHelmetHeli_O") then { removeHeadgear player; };
		waitUntil {sleep 5; (_prev != (vehicle player) || _diff != (str difficultyEnabledRTD))};
	};
};

[] spawn
{
	while {true} do
	{
		sleep (4 * 60);
		{
			_tex = _x getVariable ["customTexture", ["",""]];
			_tex2 = _x getVariable ["customTextureBP", ["",""]];
			if (_tex select 0 == uniform _x) then
			{
				[_x, _tex] call life_fnc_setUniform;
			};
			if (_tex2 select 0 == backpack _x) then
			{
				[_x, _tex2, true] call life_fnc_setUniform;
			};
		} forEach allPlayers;
		if !([player getVariable ["isBountyHunter", false], license_civ_bounty] call BIS_fnc_areEqual) then
		{
			player setVariable ["isBountyHunter", license_civ_bounty, true];
		};
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil { !isNull (findDisplay 602) };
		[true] spawn life_fnc_inventory;
		waitUntil { isNull (findDisplay 602) };
	};
};

[] spawn
{
	waitUntil {!isNil "life_bank_gates"};
	[] spawn
	{
		diag_log "Beginning gate scan.";
		while {true} do
		{
			sleep 0.5;
			{
				if ((_x animationPhase "Door_1_rot") > (_x getVariable ["gate_max",0])) then
				{
					if ((player distance _x) < 20) then
					{
						_x animate ["Door_1_rot", _x getVariable ["gate_max",0]];
					};
				};
			} forEach life_bank_gates;
			
			if (cameraView == "GROUP") then
			{
				hint "BABS sees you!";
				player switchCamera "EXTERNAL";
			}
		};
	};
};

[] spawn 
{
	waitUntil {!isNil "life_capturePos"};
	{
		if (count _x > 0) then
		{
			_pos = _x select 0;
			if (!isNil "_pos" && {count _pos > 0}) then
			{
				(call compile (format["capture_%1",_forEachIndex + 1])) setPos _pos;
				(call compile (format["capture_flag_%1",_forEachIndex + 1])) setPosATL _pos;
				(call compile (format["capture_pole_%1",_forEachIndex + 1])) setPosATL _pos;
				(call compile (format["capture_container_%1",_forEachIndex + 1])) setPosATL _pos;
				(format["capture_label_%1",_forEachIndex + 1]) setMarkerPosLocal _pos;
				(format["capture_area_%1",_forEachIndex + 1]) setMarkerPosLocal _pos;
			};
		};
	} forEach life_capturePos;
};

[] spawn
{
	waitUntil {!isNil "life_turf_list"};
	[] spawn life_fnc_updateTurfMarkers;
};

// If player has any vehicles in the world, get the key
[] spawn
{
	{
		_v = _x;
		{ 
			if (_x select 0 == getPlayerUID player) then { life_vehicles pushBack _v; };
		} forEach (_v getVariable["vehicle_info_owners",[["",""]]]);
	} forEach vehicles;
};
	
//[] spawn SPY_fnc_payLoad;

[player] spawn life_fnc_intro;
[player] spawn life_fnc_messenger;
[] execVM "IgiLoad\IgiLoadInit.sqf";

life_abort_enabled = true;
//enableEnvironment false;

player switchCamera "EXTERNAL";

player setVariable ["BIS_noCoreConversations", true];
0 fadeRadio 0;
enableRadio false;
enableSentences false;
[] call life_fnc_configChanged;