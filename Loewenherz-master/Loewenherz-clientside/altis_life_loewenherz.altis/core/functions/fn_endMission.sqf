/*
	Author: Karel Morricky

	Description:
	Ends mission with specific ending.

	Parameter(s):
		0 (Optional):
			STRING - end name (default: "end1")
			ARRAY in format [endName,ID], will be composed to "endName_ID" string
		1 (Optional): BOOL - true to end mission, false to fail mission (default: true)
		2 (Optional):
			BOOL - true for signature closing shot (default: true)
			NUMBER - duration of a simple fade out to black
		3 (Optional): BOOL - false to disable automatic music during signature shot (default: true)
		4 (Optional): BOOL - true to cancel all pending tasks (default: false)

	Returns:
	BOOL
*/
private ["_var","_spawn"];
_var = str floor random 99999;

onEachFrame {};
[] call lhm_fnc_resetStackedEVH;

while {dialog} do
{
	closeDialog 0;
};
500 cutFadeOut 0.5;

_spawn = [_var,_this] spawn {
	scriptname "lhm_fnc_endMission";
	_fnc_scriptName = "lhm_fnc_endMission";

	//--- Reminder button - only for internal use
	if ((!isNil {BIS_fnc_dbg_reminder_value}) && {!isNil {BIS_fnc_dbg_reminder}}) then {
		[] call BIS_fnc_dbg_reminder;
	};

	(findDisplay 46) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

	private ["_end","_win","_fade","_winPrevious","_playmusic","_completeTasks"];
	_var = _this select 0;
	_this = _this select 1;
	_end = [_this,0,"end1",["",[]]] call bis_fnc_param;
	_win = [_this,1,true,[true]] call bis_fnc_param;
	_fade = [_this,2,true,[true,0]] call bis_fnc_param;

	//--- Replace already running end
	if !(isnil {lhm_fnc_endMission_effects}) then {
		terminate lhm_fnc_endMission_effects;
	};
	lhm_fnc_endMission_effects = missionnamespace getvariable [_var,[] spawn {}];
	missionnamespace setvariable [_var,nil];

	if (typename _end == typename []) then {
		_endName = [_end,0,"end",[""]] call bis_fnc_paramIn;
		_endID = [_end,1,1,[0]] call bis_fnc_paramIn;
		_end = _endName + "_" + str _endID;
	};
	if (_end == "") then {_end = "end1"};

	if (typename _fade == typename true) then {
		_fade = [0,-1] select _fade;
	};
	enablesaving [false,false];

	//--- Save for external use
	missionnamespace setvariable ["BIS_fnc_missionHandlers_win",_win]; //--- ToDo: Detect win type in engine
	missionnamespace setvariable ["BIS_fnc_missionHandlers_end",_end]; //--- ToDo: Detect end type in engine

	if (_fade < 0) then {

		_layerNoise = "lhm_fnc_endMission_noise" call bis_fnc_rscLayer;
		_layerInterlacing = "lhm_fnc_endMission_interlacing" call bis_fnc_rscLayer;
		_layerStatic = "lhm_fnc_endMission_static" call bis_fnc_rscLayer;
		_layerEnd = "lhm_fnc_endMission_end" call bis_fnc_rscLayer;
		{_x cuttext ["","plain"]} foreach [_layerNoise,_layerInterlacing,_layerStatic,_layerEnd]; //--- Clear existing effects

		setacctime 1;
		_layerStatic cutrsc ["RscStatic","plain"];

		sleep 0.3;


		showhud false;
		RscMissionEnd_end = _end;
		RscMissionEnd_win = _win;
		_layerEnd cutrsc ["RscMissionEnd","plain"];

		sleep 1;


		RscNoise_color = [1,1,1,0];
		_layerNoise cutrsc ["RscNoise","black"];
		_layerStatic cutrsc ["RscStatic","plain"];

		sleep 0.5;


		RscNoise_color = [1,1,1,1];
		_layerInterlacing cutrsc ["RscInterlacing","plain"];

		1 fadesound 0;
		1 fademusic 0;

		sleep 1;


		RscDisplayDebriefing_noise = true;
	} else {
		cuttext ["","black out",_fade];
		sleep _fade;
	};

	//--- Respawn player to close all respawn menus
	[] call bis_fnc_forceEnd;

	activateKey format ["BIS_%1.%2_done", missionName, worldName];
	endmission _end;
};
missionnamespace setvariable [_var,_spawn];
true