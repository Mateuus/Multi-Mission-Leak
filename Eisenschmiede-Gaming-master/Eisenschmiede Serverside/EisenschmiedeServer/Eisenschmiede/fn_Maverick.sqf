/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_init.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!


	if (!isNil "ES_fnc_initClient") then { [] spawn ES_fnc_initClient; };

	if (!isNil "ES_fnc_initClient") then { waitUntil {!isNil "ES_Client_Verified"}; };

--------------------------------------------------------------------*/

if (!MaverickistAn) exitWith {};

if (isServer) then {
	mav_uvs_verify = {
		_steamID = param[0,"",[""]];
		_owner = param[1,-1,[1]];

		if (_steamID == "" || (count _steamID) != 17) exitWith {};
		_response = ([format["REQUEST/%1", _steamID]]) call mav_uvs_request;
		_exit = false;
		if (_response != "CREATED") then {
			if (_response == "OK_OTV") then {
				[_response,_steamID,_owner] spawn mav_uvs_evaluateResponse;
				_exit = true;
			} else {
				([format["REQUEST_RETRY/%1", _steamID]]) call mav_uvs_request;
			};
		};

		if (_exit) exitWith {};

		_success = false;
		_tries = 1;
		while {!_success && _tries <= 3} do {
			sleep 3;
			_tries = _tries + 1;
			_response = ([format["REQUEST/%1", _steamID]]) call mav_uvs_request;
			if (_response != "AWAITING_RESULT") exitWith {
				_success = true;
				[_response,_steamID,_owner] spawn mav_uvs_evaluateResponse;
			};
		};
		if (!_success) then {
			["UKNOWN_ERROR",_steamID,_owner] spawn mav_uvs_evaluateResponse;
		};
	};
	mav_uvs_evaluateResponse = {
		_response = param[0,"",[""]];
		_steamID = param[1,"",[""]];
		_owner = param[2,-1,[1]];

		if (_response in ["OK","OK_OTV"]) exitWith {
			[] remoteExec ["mav_uvs_client_OK",_owner];
		};
		if (_response == "INTERNAL_ERROR") exitWith {
			["Error_P",_steamID,_owner] spawn mav_uvs_endMission;
		};
		if (_response == "PROFILE_PRIVATE") exitWith {
			["Privat",_steamID,_owner] spawn mav_uvs_endMission;
		};
		if (_response in ["ACCOUNT_TOO_YOUNG","NOT_ENOUGH_PLAYTIME","LAST_BAN_NOT_EXPIRED","LAST_BAN_NOT_EXPIRED"]) exitWith {
			["NichtErlaubt",_steamID,_owner] spawn mav_uvs_endMission;
		};
		["Unbekannt",_steamID,_owner] spawn mav_uvs_endMission;
	};
	mav_uvs_endMission = {
		_className = param[0,"",[""]];
		_steamID = param[1,"",[""]];
		_owner = param[2,-1,[1]];
		_className remoteExec ["endMission", _owner];
		_object = [_steamID] call mav_uvs_getObjectBySteamID;

		// If the user is not gone after 4 seconds kick him off manually
		_cp = "DgoNrUnoDobleKkJo142";
		sleep 4;
		with uiNamespace do {
			_cp serverCommand format ["#kick %1", _owner];
		};
	};
	mav_uvs_getObjectBySteamID = {
		_steamID = param[0,"",[""]];
		{
			if (_steamID == (getPlayerUID _x)) then {
				_x;
			};
		} forEach AllPlayers;
	};
	mav_uvs_request = {
		_command = param[0,"",[""]];
		"MaverickUserVerificationService" callExtension _command;
	};

	// Start
	_nil = ["Init"] spawn mav_uvs_request;
	mav_uvs_serverready = true;
};

ES_fnc_initClient = {
	
	// Receiver function
	mav_uvs_client_OK = {
		closeDialog 0;
		ES_Client_Verified = true;
		disableUserInput false;
		showChat true;
	};

	waitUntil {(!isNull (findDisplay 46)) AND (isNull (findDisplay 101)) AND (!isNull player) AND (alive player) AND !dialog};

	// Hide chat
	showChat false;

	// Loading screen
	disableSerialization;
	waitUntil {createDialog "RscDisplayLoadMission"};

	// Disable user input
	disableUserInput true;

	// Call server
	[player] remoteExec ["ES_fnc_connected",2];

};

ES_fnc_connected = {
	
	_player = param[0,objNull,[objNull]];
	waitUntil {!isNil "ES_fnc_connected"};
	[getPlayerUID _player, owner _player] spawn mav_uvs_verify;

};

publicVariable "ES_fnc_initClient";
publicVariable "ES_fnc_connected";