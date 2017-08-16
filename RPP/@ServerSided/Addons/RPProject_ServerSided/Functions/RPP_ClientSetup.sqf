#include "\RPProject_ServerSided\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_ClientSetup.sqf

Description:
Loads the client
*/
["RPP_Client_Load", {
	[] spawn {
		private ["_t","_timeold","_msg","_radioBack"];

		hint "Starting client...";
		sleep 1;
		RPP_SRV_READY = true;
		waitUntil{!isNil "RPP_SRV_READY"};
		waitUntil{RPP_SRV_READY};

		_t = "::Framework System::";
		if (side player isEqualTo west) then {
			playSound "RPP_BadBoys";
		};
		if (side player isEqualTo independent) then {
			playSound "RPP_FireFighters";
		};
		if (side player isEqualTo civilian) then {
			playSound "RPP_TheySeeMeRolling";
		};

		RPP_Server = 0;
		RPP_AntiCheat_Loaded = 0;
		player enableSimulation false;
		player allowDamage false;

		if (side player == west) then {
			_radioBack = "tf_rt1523g";
		} else {
			_radioBack = "tf_anprc155";
		};
		player unassignItem "NVGoggles";
		player removeItem "NVGoggles";
		removeAllWeapons player;
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		removeGoggles player;
		removeBackpack player;
		player addRating 99999999;


		_msg = format ["%1 CONNECTED TO THE FRAMEWORK",NAME PLAYER];
		[_msg] call RPP_Message_Global;


		titleText [ format ["%1 Loading Client information...",_t], "BLACK"];

		titleText [ format ["%1 Loading Configurations...",_t], "BLACK"];

		[] call RPP_Variables;
		waitUntil {!isNil "RPP_Server"};
		["Variables Set", RPP_Green] call RPP_MessageSystem;

		titleText [ format ["%1 Configurations Loaded.",_t], "BLACK"];

		titleText [ format ["%1 Loading Player Stats.",_t], "BLACK"];
		["Loading Player...", RPP_Yellow] call RPP_MessageSystem;
		session_login = false;
		[] call RPP_fetchLogin;
		waitUntil{session_login};

		session_finished = false;
		[] call RPP_fetchPlayer;
		waitUntil {session_finished};
		["Player Loaded", RPP_Green] call RPP_MessageSystem;

		titleText [ format ["%1 Player Stats loaded.",_t], "BLACK"];

		{
			_UID = _x select 0;
			_Name = _x select 1;
			if (_UID isEqualTo getPlayerUID player) exitWith {
				_msg = format ["Framework Owner %1 Just Connected!",_Name];
				[_msg] call RPP_Message_Global;
			};
		} count RPP_ProjectLead_Array;

		if (RPP_TaskForceRadio) then {
			if (isNil "TFAR_fnc_isTeamSpeakPluginEnabled") exitwith {

				999999 cutText ["Task Force Radio is not running on your computer. Please re-sync and retry","BLACK FADED"];
				999999 cutFadeOut 99999999;

				_msg = "Please disconnect and install Task Force Radio!";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;

				_msg = format ["%1 DID NOT HAVE TASK FORCE RADIO INSTALLED!",NAME PLAYER];
				[_msg] call RPP_Message_Global;
			};

			_TFenabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;

			if (!(_TFenabled)) then {
				while {!([] call TFAR_fnc_isTeamSpeakPluginEnabled)} do {
					titleText ["Please enable Task Force Radio in your TS3 Plugins! || TS3 -> Settings -> Plugins", "BLACK"];
					sleep 2;
				};
			};

			_timeold = time;

		};

		titleText [ format ["%1 Client information loaded.",_t], "BLACK"];


		titleText ["","PLAIN"];

		/*while {!RPP_Server_Housing_Ready} do {
			999999 cutText [ format ["%1 Waiting for server to load housing, May take some time for first startup.",_t], "BLACK FADED"];
			999999 cutFadeOut 99999999;
			sleep 1;
			999999 cutText [ format ["%1 Waiting for server to load housing, May take some time for first startup..",_t], "BLACK FADED"];
			sleep 1;
			999999 cutText [ format ["%1 Waiting for server to load housing, May take some time for first startup...",_t], "BLACK FADED"];
			sleep 1;
			999999 cutText [ format ["%1 Waiting for server to load housing, May take some time for first startup..",_t], "BLACK FADED"];
			sleep 1;
		};

		sleep 1;

		waitUntil {RPP_Server_Housing_Ready};
		999999 cutText [ format ["",_t], "BLACK FADED"];*/

		titleText [ format ["%1 Housing loaded.",_t], "BLACK IN"];

		/*RPP_dutyloaded = false;
		[] call RPP_Duty_CheckSide;
		waitUntil{RPP_dutyloaded};

		if (RPP_IsCiv) then {
			player setVariable ["RPP_Civilian",1,true];
			player setVariable ["RPP_Police",0,true];
			player setVariable ["RPP_EMS",0,true];
		};
		if (RPP_IsCop) then {
			player setVariable ["RPP_Police",1,true];
			player setVariable ["RPP_Civilian",0,true];
			player setVariable ["RPP_EMS",0,true];
		};

		if (RPP_IsEMT) then {
			player setVariable ["RPP_EMS",1,true];
			player setVariable ["RPP_Civilian",0,true];
			player setVariable ["RPP_Police",0,true];
		};*/

		sleep 1;

		titleText [ format ["%1 Server ready.",_t], "PLAIN"];


		_countHome = 0;

		{
			RPP_HouseAdded = _x;
			_classname = typeof RPP_HouseAdded;
			_x addAction ["House Menu",{[cursorTarget] call RPP_Housing_Menu},[false],1,false,true,"","(player distance _this) < 25"];
			_x addAction ["Break Into",{[cursorTarget] call RPP_Housing_Breakinto},[false],1,false,true,"","(player distance _this) < 25"];
			_getpos = getPos RPP_HouseAdded;
			[_getpos,RPP_HouseAdded,getPlayerUID player,player] remoteExec ["RPP_DB_House_MarkersGet",2];

			{
				if (_classname == _x select 0) exitWith {
					_price = _x select 1;
					RPP_HouseAdded addAction [format["Buy House ($%1)",_price],{[cursorTarget] call RPP_Housing_BuyHouse},[false],1,false,true,"","(player distance _this) < 25"];
				};
			} count RPP_House_Class_Cfg;
		} foreach nearestObjects [player, RPP_House_Class, 999999];

		player allowDamage true;
		player enableSimulation true;
		[] call RPP_Login_Dialog;
		RPP_AntiCheat_Bypass = false;
	};
}] call RPP_Function;
publicVariable "RPP_Client_Load";

["RPP_fetchPlayer", {
	[getPlayerUID player, player] remoteExec ["RPP_DB_fetchPlayer", 2];
}] call RPP_Function;
publicVariable "RPP_fetchPlayer";

["RPP_fetchLogin", {
	[getPlayerUID player, player] remoteExec ["RPP_DB_fetchLogin", 2];
}] call RPP_Function;
publicVariable "RPP_fetchLogin";

["RPP_insertPlayer", {
	[
	getPlayerUID player, profileName, RPP_Cash, RPP_Bank, player,
	RPP_Weight,
	RPP_Skill_Vehicle,
	RPP_Skill_Crafting,
	RPP_Skill_Mining,
	RPP_Skill_Gathering,
	RPP_Skill_Fishing,0] remoteExec ["RPP_DB_insertPlayer", 2];
}] call RPP_Function;
publicVariable "RPP_insertPlayer";

["RPP_loadLogin", {
	_info = param[0, []];
  	session_login = false;

	if(count _info == 0) then {
		RPP_LoginSys_Username = "EMPTY";
		RPP_LoginSys_Password = "EMPTY";
	} else {
		RPP_LoginSys_Username = _info select 0;
		RPP_LoginSys_Password = _info select 1;
	};

	["Login loaded.",RPP_Green] call RPP_MessageSystem;
	session_login = true;
}] call RPP_Function;
publicVariable "RPP_loadLogin";

["RPP_loadPlayer", {
	session_finished = false;
	0 cutText ["Got Player Data","BLACK FADED"];
	0 cutFadeOut 9999999;

	RPP_Cash = parseNumber (_this select 2);
	RPP_Bank = parseNumber (_this select 3);

	hint "Moving to gear loading.";

	[_this select 4] spawn RPP_loadGear;

	RPP_Thirst = parseNumber (_this select 12);
	RPP_Hunger = parseNumber (_this select 13);

	RPP_CopLevel = parseNumber (_this select 8); //These should be const
	RPP_EMTlevel = parseNumber (_this select 9); //These should be const
	RPP_Adminlevel = parseNumber (_this select 10); //These should be const
	RPP_Donatorlevel = parseNumber (_this select 11); //These should be const

	RPP_Skill_Vehicle = parseNumber (_this select 19);
	RPP_Skill_Crafting = parseNumber (_this select 20);
	RPP_Skill_Mining = parseNumber (_this select 21);
	RPP_Skill_Gathering = parseNumber (_this select 22);
	RPP_Skill_Fishing = parseNumber (_this select 23);

	RPP_Inventory = _this select 5;
	RPP_License = _this select 6;
	RPP_Vehicle_Storage = _this select 24;
	_CompanyOwning = _this select 25;
	RPP_InGangName= _this select 26;

	if (RPP_InGangName != "") then {
		[] call RPP_Gang_Init;
	};

	if (_CompanyOwning isEqualTo "false") then {
		RPP_Company_Owning = false;
	} else {
		RPP_Company_Owning = true;
	};

	session_finished = true;

  	0 cutText ["","BLACK IN"];
}] call RPP_Function;
publicVariable "RPP_loadPlayer";

["RPP_loadGear", {
	_gear = param[0];
  waitUntil {!(isNull (findDisplay 46))};

  _handle = [] spawn RPP_stripPlayer;
  waitUntil {scriptDone _handle};

  if(count _gear isEqualTo 0) then {
    _clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
    player addUniform (_clothings select (floor(random (count _clothings))));

    /* ITEMS */
    player addItem "ItemMap";
    player assignItem "ItemMap";
    player addItem "ItemCompass";
    player assignItem "ItemCompass";
    player addItem "ItemWatch";
    player assignItem "ItemWatch";

		[] call RPP_saveGear;
  } else {
  	player setUnitLoadout _gear;
  };
}] call RPP_Function;
publicVariable "RPP_loadGear";

["RPP_saveGear", {
	private["_playerGear"];
	  _playerGear = getUnitLoadout player;
	  [4, _playerGear, getPlayerUID player] remoteExec ["RPP_DB_partialSync", 2];
}] call RPP_Function;
publicVariable "RPP_saveGear";

["RPP_stripPlayer", {
	removeAllWeapons player;
  {player removeMagazine _x;} forEach (magazines player);
  removeUniform player;
  removeVest player;
  removeBackpack player;
  removeGoggles player;
  removeHeadGear player;

  {
  	player unassignItem _x;
  	player removeItem _x;
  } forEach (assignedItems player);

  if(hmd player != "") then {
  	player unlinkItem (hmd player);
  };
}] call RPP_Function;
publicVariable "RPP_stripPlayer";
