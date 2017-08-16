
/*
	File: fn_clientDisconnect.sqf
	Author: Blackd0g

	Description:
	safely exit session
*/
//Make it so nothing goes wrong with the player.
private ["_abort","_camera","_video"];
lhm_session_completed = missionNamespace getVariable["lhm_session_completed",false];

closeDialog 0;
closeDialog 0;
uiNamespace setVariable ["BIS_fnc_guiMessage_status", false];

    _abort = [
        localize"STR_Global_Disconnect",
        localize"STR_Global_Cancel",
        localize"STR_Global_Yes",
        localize"STR_Global_No"
    ] call bis_fnc_GUImessage;
    if(!_abort) exitWith {
        uiNamespace setVariable ["BIS_fnc_guiMessage_status", true];
    };

if(!lhm_session_completed) exitWith {
	["Aborted",true,false] call LHM_fnc_endMission;
};

// remove the PlayerTags
[lhm_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
[lhm_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;

lhm_sidechat = false;
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
showHud false;
hintSilent "";

//delete the current hud
[] call lhm_fnc_huddelete;

// create Camera flyby
_camera = "camera" camCreate (position player);
_camera cameraEffect ["internal","back"];
_camera camSetTarget player;
_camera camCommit 0;
_camera camSetPos (player modelToWorld [0,0,60]);
_camera camCommit 1;
sleep 1;
_camera camSetTarget (player modelToWorld[0,0,10000]);
_camera camCommit 3;

cutText ["","BLACK",2]; //Fade the screen to black, in prep for the outro.
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;

_video = ["core\video\lp_intro.ogv"] spawn BIS_fnc_playVideo;
sleep 0.25;

	for "_i" from 0 to 100 do {
		if(_i == 10) then {
			if(lhm_is_arrested == 0) then {
				player setPos (getMarkerPos "respawn_civilian");
			};
		};
		if(_i == 20) then {
			[] call SOCK_fnc_updateRequest;
			[] call SOCK_fnc_PlayerStatUpdateRequest;
			sleep (random 0.5);
			hintSilent "";
		};
		if(_i == 30) then {
			sleep (random 0.2);
			uiNamespace setVariable ["BIS_fnc_guiMessage_status", true];
		};
		if(_i == 40) then {
			0 fadeSound 1;
			sleep (random 0.1);
		};
		if(_i == 50) then {
			0 fadeMusic 1;
			sleep (random 0.1);
		};
		if(_i == 60) then {
			0 fadeRadio 1;
			sleep (random 0.1);
		};
		if(_i == 70) then {
			0 fadeSpeech 1;
			sleep (random 0.1);
		};
		if(_i == 80) then {
			[[player],"TON_fnc_cleanupRequest",false,false] call lhm_fnc_mp;
			sleep (random 0.3);
		};
		if(_i == 90) then {
			showChat true;
			showHud true;
			sleep (random 0.2);
		};
		if(_i == 100) then {
			disableUserInput false;
			["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
			sleep (random 0.2);
		};

	[format["<t size='1.3' color='#FF0000'>Logout...</t><br/>synchronisiere Charakter mit Server %1%2<br/><t size='1.1'>Besuche uns auf www.lhzp.de</t>",_i,"%"],0,0.95,10,0,0,8] spawn BIS_fnc_dynamicText;

	sleep 0.025;
	};

	["Aborted",true,false] spawn LHM_fnc_endMission;

	[] call lhm_fnc_resetStackedEVH;

diag_log "";
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Loewenherz RPG Client ended --------------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "";