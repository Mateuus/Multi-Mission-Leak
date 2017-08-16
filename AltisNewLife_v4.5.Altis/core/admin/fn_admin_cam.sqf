private ["_CamPos","_TargPlay","_SpecTime","_PosMarker","_AltM"];
_TargPlay = lbData[2902,lbCurSel (2902)];
_TargPlay = lbData[2902,lbCurSel (2902)];
_TargPlay = call compile format["%1", _TargPlay];
if(isNil "_TargPlay") exitwith {};
if(isNull _TargPlay) exitWith {};
if(_TargPlay == player) exitWith {hint localize "STR_ANOTF_Error";};

_SpecTime = 300; //    |_SpecTime/2 = real time|
_PosMarker = getPos _TargPlay;
_CamPos = [_PosMarker, 20, 200] call BIS_fnc_relPos;
_AltM = (_PosMarker select 2) + 10;
_CamPos set [2,_AltM];
titleText["","BLACK IN", 2];
// create a camera object
CamSpec = "camera" camCreate [_PosMarker select 0, _PosMarker select 1,(_PosMarker select 2)+7];
CamSpec CamPrepareTarget _TargPlay;
CamSpec CamPreparePos _CamPos;
CamSpec CamCommitPrepared 0;
CamSpec CamPreload 1;
CamSpec_skip = false;

[] spawn{waitUntil {time > 0};showCinemaBorder false;};

disableSerialization;
(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
if (!(isNil {uiNamespace getVariable "CamSpec_skipEH"})) then {
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "CamSpec_skipEH"];
	uiNamespace setVariable ["CamSpec_skipEH", nil];
};

// Add skipping eventhandler
private ["_skipEH"];
_skipEH = ([] call BIS_fnc_displayMission) displayAddEventHandler ["KeyDown",
			{
			if (_this select 1 == 57) then {
				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'CamSpec_skipEH'];
				uiNamespace setVariable ['CamSpec_skipEH', nil];
				playSound ['clicksoft', true];
				CamSpec_skip = true;
				};
			}
	
	];
//Displays the Info durring the specatating
_PlayerNm = format ["Joueur: %1",name _TargPlay];	
[_PlayerNm,0,-0.36,500,0.2,0,1800] spawn BIS_fnc_dynamicText;
_PlayerInfo = format ["Gesundheit: %1/100",(getDammage _TargPlay) * 100];	
[_PlayerInfo,0,-0.30,500,0.2,0,1801] spawn BIS_fnc_dynamicText;
["Drücke Leertaste um den Spectate-Modus zu schliessen.",0,1.1,500,0.2,0,1802] spawn BIS_fnc_dynamicText;

uiNamespace setVariable ["CamSpec_skipEH", _skipEH];

//Updates the Cam Pos and Player Info
waitUntil{camCommitted CamSpec};
for "_idx" from 0 to _SpecTime do {
				_PosMarker = getPos _TargPlay;
				_CamPos = [_PosMarker, 20, 200] call BIS_fnc_relPos;
				_AltM = (_PosMarker select 2) + 10;
                _CamPos set [2,_AltM];
				_PlayerInfo = format ["Gesundheit: %1/100",(getDammage _TargPlay) * 100];	
				[_PlayerInfo,0,-0.30,100,0,0,1801] spawn BIS_fnc_dynamicText;
				CamSpec camSetTarget _TargPlay;
				CamSpec cameraEffect ["internal", "BACK"];
				CamSpec camSetPos _CamPos;
				CamSpec camCommit 1;
				waitUntil{camCommitted CamSpec};
				if (CamSpec_Skip) exitWith{};
			};
CamSpec cameraEffect ["terminate", "BACK"];
titleText["","BLACK IN", 2];
//Remove the EH if the player doesn't push space
if (!(isNil {uiNamespace getVariable "CamSpec_skipEH"})) then {
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "CamSpec_skipEH"];
	uiNamespace setVariable ["CamSpec_skipEH", nil];
	};
["",0,-0.36,17,0.2,0,1800] spawn BIS_fnc_dynamicText;
["",0,-0.30,17,0.2,0,1801] spawn BIS_fnc_dynamicText;
["",0,1.1,100,0.2,0,1802] spawn BIS_fnc_dynamicText;
