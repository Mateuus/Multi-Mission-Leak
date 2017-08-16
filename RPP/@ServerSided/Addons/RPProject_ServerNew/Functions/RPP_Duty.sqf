/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Duty.sqf

Description:
Going off duty or on duty

TODO:
	Redo this, the code could be so much nicer. - Maurice Moss
*/
["RPP_Duty_Dialog", {
	private ["_side","_text","_HeaderText"];
	params["_side"];

	createDialog "RPP_DutyDialog";
	disableSerialization;
	_text = uiNameSpace getVariable ["RPP_DutyDialog",displayNull];
	_HeaderText = _text displayCtrl 1001;

	RPP_DutySide = _side;

	switch (_side) do {
		case "EMS": {
			_HeaderText ctrlSetText "EMS Department";

			lbAdd[1500, "=== Online EMS ==="];
			{
				if (_x getVariable ["RPP_EMS", false]) then {
					lbAdd[1500,format["%1",name _x]];
				};
			} foreach playableUnits;
		};

		case "Police": {
			_HeaderText ctrlSetText "Police Department";

			lbAdd[1500, "=== On Duty Police Officers ==="];
			{
				if (_x getVariable ["RPP_Police", false]) then {
					lbAdd[1500,format["%1",name _x]];
				};
			} foreach playableUnits;
		};
	};

	buttonSetAction[1600, "[] spawn Shared_goOnDuty;"];
	buttonSetAction[1601, "[] spawn Shared_goOffDuty;"];

}] call RPP_Function;
publicVariable "RPP_Duty_Dialog";

["RPP_Duty_CheckSide",{
	[getPlayerUID player, player] remoteExec ["RPP_DB_fetchDuty", 2];
}] call RPP_Function;
publicVariable "RPP_Duty_CheckSide";

["RPP_Duty_FirstInstert",{
	[getPlayerUID player, player] remoteExec ["RPP_insertDuty", 2];
}] call RPP_Function;
publicVariable "RPP_Duty_FirstInstert";

["RPP_Duty_load", {
	private ["_Duty_civ","_Duty_cop","_Duty_ems"];
	hint "Idk why this is even a thing";
}] call RPP_Function;
publicVariable "RPP_Duty_load";


["Shared_goOnDuty", {
	closeDialog 1;

	if ((player getVariable ["RPP_Police", false]) || (player getVariable ["RPP_EMS", false])) exitWith { ["You are already on duty.",RPP_Red] call RPP_MessageSystem; };

	switch (RPP_DutySide) do {
		case "Police": {
			if (RPP_CopLevel < 1) exitWith {
				["You are not a member of the Police Department!",RPP_Red] call RPP_MessageSystem;
			};

			player setVariable ["RPP_Police", true, true];
			player setVariable ["RPP_Civilian", false, true];
			player setVariable ["RPP_EMS", false, true];
			player setVariable ["Coplevel", 1, true];

			RPP_IsEMT = false;
			RPP_IsCiv = false;
			RPP_IsCop = true;

			diag_log format["Duty Status Cop: %1, Civ: %2, EMS: %3", RPP_IsCop, RPP_IsCiv, RPP_IsEMT];

			["You are now on Duty as a Police Officer",RPP_Yellow] call RPP_MessageSystem;
		};
		case "EMS": {
			if (RPP_EMTLevel < 1) exitWith {
				["You are not a member of the EMS Department!",RPP_Red] call RPP_MessageSystem;
			};

			player setVariable ["RPP_Police", false, true];
			player setVariable ["RPP_Civilian", false, true];
			player setVariable ["RPP_EMS", true, true];
			player setVariable ["Coplevel", 0, true];

			RPP_IsEMT = true;
			RPP_IsCiv = false;
			RPP_IsCop = false;

			diag_log format["Duty Status Cop: %1, Civ: %2, EMS: %3", RPP_IsCop, RPP_IsCiv, RPP_IsEMT];

			["You are now on Duty as an EMT",RPP_Yellow] call RPP_MessageSystem;
		};
	};

}] call RPP_Function;
publicVariable "Shared_goOnDuty";


["Shared_goOffDuty", {
	RPP_IsEMT = false;
	RPP_IsCiv = true;
	RPP_IsCop = false;
	player setVariable ["RPP_Police", false, true];
	player setVariable ["RPP_Civilian", true, true];
	player setVariable ["RPP_EMS", false, true];
	player setVariable ["Coplevel", 0, true];

	["You are now off duty.",RPP_Yellow] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable "Shared_goOnDuty";

["RPP_Duty_On", {
	[] spawn {
		closeDialog 1;
		private ["_Locker_civ","_Locker_cop","_Locker_ems","_Duty_civ","_Duty_cop","_Duty_ems"];

		_Duty_civ = player getVariable "RPP_Civilian";

		if (_Duty_civ isEqualTo 0) exitWith {
			["You are already on duty.",RPP_Red] call RPP_MessageSystem;
		};

		_c = true;


		switch (RPP_DutySide) do {
			case "Police": {
				player setVariable ["RPP_Civilian",0,true];
				player setVariable ["RPP_Police",1,true];
				player setVariable ["RPP_EMS",0,true];
				player setVariable ["Coplevel",1,true];

				RPP_IsCop = true;
				RPP_IsEMT = false;
				RPP_IsCiv = false;

				if (RPP_CopLevel < 1) then {
					_c = false;
					["You are a member of the Police Department!",RPP_Red] call RPP_MessageSystem;
				};

				["You are now on Duty as a Police Officer",RPP_Yellow] call RPP_MessageSystem;
			};
			case "EMS": {
				player setVariable ["RPP_Civilian",0,true];
				player setVariable ["RPP_Police",0,true];
				player setVariable ["RPP_EMS",1,true];

				player setVariable ["Coplevel",0,true];

				RPP_IsCop = false;
				RPP_IsEMT = true;
				RPP_IsCiv = false;

				if (RPP_EMTLevel < 1) then {
					_c = false;
					["You are not whitelisted for EMS!",RPP_Red] call RPP_MessageSystem;
				};

				["You are now on Duty for EMS",RPP_Yellow] call RPP_MessageSystem;
			};
		};

		if (!(_c)) exitWith {};

		_Duty_civ = player getVariable "RPP_Civilian";
		_Duty_ems = player getVariable "RPP_EMS";
		_Duty_cop = player getVariable "RPP_Police";

		[10,[_Duty_civ,_Duty_ems,_Duty_cop],getPlayerUID player] remoteExec ["RPP_DB_partialSync",2];

		sleep 0.2;

		RPP_Duty_GearSaved = false;
		[] call RPP_Duty_CheckSide;
	};
}] call RPP_Function;
publicVariable "RPP_Duty_On";

["RPP_Duty_Off", {
	[] spawn {
		closeDialog 1;
		private ["_Locker_civ","_Locker_cop","_Locker_ems","_Duty_civ","_Duty_cop","_Duty_ems"];

		if (player getVariable "RPP_Civilian") exitWith {
			["You are already off duty.",RPP_Red] call RPP_MessageSystem;
		};


		RPP_Duty_GearSaved = false;
		[] call RPP_Duty_saveGear;
		waitUntil{RPP_Duty_GearSaved};


		player setVariable ["RPP_Civilian", true, true];
		player setVariable ["RPP_Police", false, true];
		player setVariable ["RPP_EMS", false, true];
		player setVariable ["Coplevel", 0, true];
		RPP_IsCiv = true;
		RPP_IsCop = false;
		RPP_IsEMT = false;

		_Duty_civ = player getVariable "RPP_Civilian";
		_Duty_cop = player getVariable "RPP_Police";
		_Duty_ems = player getVariable "RPP_EMS";

		RPP_Duty_GearSaved = false;
		[] call RPP_Duty_CheckSide;
		waitUntil{RPP_Duty_GearSaved};

		//why do i need this here?? fucking arma
		player setVariable ["RPP_Civilian", true, true];
		player setVariable ["RPP_Police", false, true];
		player setVariable ["RPP_EMS", false, true];
		player setVariable ["Coplevel", 0, true];
		RPP_IsCiv = true;
		RPP_IsCop = false;
		RPP_IsEMT = false;

		_Duty_civ = player getVariable "RPP_Civilian";
		_Duty_cop = player getVariable "RPP_Police";
		_Duty_ems = player getVariable "RPP_EMS";

		["You are now off duty.",RPP_Green] call RPP_MessageSystem;


		[10,[_Duty_civ,_Duty_ems,_Duty_cop],getPlayerUID player] remoteExec ["RPP_DB_partialSync",2];

		sleep 0.3;

		[] call RPP_Duty_CheckSide;
	};
}] call RPP_Function;
publicVariable "RPP_Duty_Off";


["RPP_Duty_loadGear", {
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

		[] call RPP_Duty_saveGear;
  } else {
  	player setUnitLoadout _gear;

  	RPP_Duty_GearSaved =  true;
	};
}] call RPP_Function;
publicVariable "RPP_Duty_loadGear";

["RPP_Duty_saveGear", {
	private["_playerGear"];
	_playerGear = getUnitLoadout player;

	if (player getVariable ["RPP_Civilian", false]) exitWith {
		[7, _playerGear, getPlayerUID player] remoteExec ["RPP_DB_partialSync", 2];
		RPP_Duty_GearSaved = true;
	};
	if (player getVariable ["RPP_Police", false]) exitWith {
		[8, _playerGear, getPlayerUID player] remoteExec ["RPP_DB_partialSync", 2];
		RPP_Duty_GearSaved = true;
	};
	if (player getVariable ["RPP_EMS", false]) exitWith {
		[9, _playerGear, getPlayerUID player] remoteExec ["RPP_DB_partialSync", 2];
		RPP_Duty_GearSaved = true;
	};
}] call RPP_Function;
publicVariable "RPP_Duty_saveGear";
