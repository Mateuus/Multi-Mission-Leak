/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Evidence.sqf

Description:
Drops evidence when player fires a shot
*/
["RPP_Evidence_Create", {
	if (RPP_isCop) exitWith {};
	if (RPP_EvidenceCreated) exitWith {};
	if (player getVariable "RPP_Paintball_Playing") exitWith {};
		
	private ["_suspect","_mag","_name","_EvidenceBox"];
	_suspect = _this select 0;
	_Weapon = _this select 1;
	_name = name _suspect;

	RPP_EvidenceCreated = true;

	_EvidenceBox = "EvKobalt" createVehicle (getpos player);

	[[_EvidenceBox,_Weapon,_name], "RPP_Evidence_CreateGlobal", true] call BIS_FNC_MP;

	[] spawn {
		while {RPP_EvidenceCreated} do {
			sleep 15;
			RPP_EvidenceCreated = false;
			if (!(RPP_EvidenceCreated)) exitWith {};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Evidence_Create";

["RPP_Evidence_CreateGlobal", {
	private ["_EvidenceBox","_Weapon","_name"];
	_EvidenceBox = _this select 0;
	_Weapon = _this select 1;
	_name = _this select 2;

	_EvidenceBox setVariable ["EvidenceBox",true,true];
	_EvidenceBox setVariable ["Suspect_Name",_name,true];
	_EvidenceBox setVariable ["Suspect_Weapon",_Weapon,true];

	if (RPP_isCiv) then {
		_EvidenceBox addAction ["Destroy Evidence",{[] call RPP_Evidence_Destroy}];
	};
	if (RPP_isCop) then {
		_EvidenceBox addAction ["Search Evidence",{[] call RPP_Evidence_Search}];
		_EvidenceBox addAction ["Remove Evidence",{[] call RPP_Evidence_Remove}];
	};
	[_EvidenceBox] call RPP_Evidence_Delete;
}] call RPP_Function;
publicVariable "RPP_Evidence_CreateGlobal";

["RPP_Evidence_Delete", {
	[_this select 0] spawn {
		private ["_EvidenceBox"];
		_EvidenceBox = _this select 0;
		while {true} do {
			sleep 3600;
			deleteVehicle _EvidenceBox;
			if (isPlayer player) exitWith {};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Evidence_Delete";

["RPP_Evidence_Destroy_Loop", {
	private ["_EvidenceBox","_progress_p","_ui","_progress","_pgText","_msg","_color"];
	_EvidenceBox = _this select 0;
	disableSerialization;
	5 cutRsc ["RPP_ProgressBar","PLAIN"];
	_progress_p = 0.01;
	_ui = uiNameSpace getVariable "RPP_ProgressBar";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	RPP_Evidence_Destroying = true;
	while {RPP_Evidence_Destroying} do {
		_pgText ctrlSetText "Destroying Evidence...";
		_progress progressSetPosition _progress_p;
		sleep 0.4;
		_progress_p = _progress_p + 0.01;
		if (player getVariable "RPP_Handcuff") exitWith {
			_msg = "You failed to Destroy the Evidence.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player getVariable "RPP_Revive") exitWith {
			_msg = "You failed to Destroy the Evidence.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player getVariable "RPP_Tased") exitWith {
			_msg = "You failed to Destroy the Evidence.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player distance _EvidenceBox > 5) exitWith {
			_msg = "You are to far away from the Evidence";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			5 cutText ["","PLAIN"];
			RPP_Evidence_Destroyed = false;
			RPP_Evidence_Destroying = false;
			RPP_Evidence_DontDestory = true;
		};
		if (_progress_p >= 1) exitWith {
			RPP_Evidence_DontDestory = false;
			RPP_Evidence_Destroyed = true;
			_pgText ctrlSetText "EVIDENCE DESTORYED!";
			5 cutText ["","PLAIN"];
			RPP_Evidence_Destroying = false;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Evidence_Destroy_Loop";

["RPP_Evidence_Destroy", {
	[] spawn {
		private ["_EvidenceBox","_msg","_color"];
		_EvidenceBox = cursorTarget;
		if (player distance _EvidenceBox > 5) exitWith {
			_msg = "Too far away from the target";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (_EvidenceBox getVariable "EvidenceBox") then {
			if (player distance _EvidenceBox > 5) exitWith {
				_msg = "Too far away from the target";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};
			if (RPP_Evidence_Destroying) exitWith {};
			RPP_Evidence_Destroyed = false;
			[_EvidenceBox] call RPP_Evidence_Destroy_Loop;
			waitUntil{!RPP_Evidence_Destroying};
			sleep 0.2;
			if (RPP_Evidence_DontDestory) exitWith {};
			deleteVehicle _EvidenceBox;
			_msg = "Evidence Destroyed.";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;
		} else {
			_msg = "No Evidence found.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Evidence_Destroy";

["RPP_Evidence_Search", {
	[] spawn {
		private ["_EvidenceBox","_Weapon","_name","_msg","_color","_pic","_text","_image"];
		_EvidenceBox = cursorTarget;
		if (player distance _EvidenceBox > 5) exitWith {
			_msg = "Too far away from the Target";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		_name = _EvidenceBox getVariable "Suspect_Name";
		_Weapon = _EvidenceBox getVariable "Suspect_Weapon";
		_pic = getText (configFile >> "CfgWeapons" >> _Weapon >> 'picture');
		_text = getText (configFile >> "CfgWeapons" >> _Weapon >> 'displayName');
		_image = format ["<img size='4' image='%1' align='center'/><br/>",_pic];
		if (_EvidenceBox getVariable "EvidenceBox") then {
			player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 3;
			_msg = format ["POLICE EVIDENCE<br />WEAPON<br /> %1<br />%2<br />SUSPECT: %3",_image,_text,_name];
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		} else {
			_msg = "Target not found.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Evidence_Search";

["RPP_Evidence_Remove", {
	[] spawn {
		private ["_EvidenceBox","_msg","_color"];
		_EvidenceBox = cursorTarget;
		if (player distance _EvidenceBox > 5) exitWith {
			systemChat "Too far away from the target";
		};
		if (_EvidenceBox getVariable "EvidenceBox") then {
			player playmove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 3;
			deleteVehicle _EvidenceBox;
			_msg = "Evidence Removed.";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;
		} else {
			_msg = "No Evidence found.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Evidence_Remove";