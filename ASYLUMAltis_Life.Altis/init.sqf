enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

life_versionInfo = "Asylum v6.9.0";

if(isServer) then
{
	if(!X_Server) then
	{
		[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
	};
	X_Server = true;
};
if(!isDedicated) then { X_Client = true;};

if(hasInterface) then // Not HC
{
	if(isNull player) then
	{
		if(!X_JIP && !isServer) then
		{
			[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
		};
		X_JIP = true;
	};

	if(X_Client && !isServer) then
	{
		[] execVM "core\init.sqf";
		[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
	};
};

enableSaving[false,false];

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

if(!StartProgress) then
{
	[3,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;

MISSION_ROOT = format ["mpmissions\__CUR_MP.%1\", worldName];
if(isServer) exitWith {};
[] spawn {
	while{true} do
	{
		waitUntil {visibleMap};
		waitUntil {!isNull findDisplay 54 || !visibleMap};
		if(visibleMap) then {
			findDisplay 54 displayCtrl 1 buttonSetAction 
			"
				_ctrl = findDisplay 54 displayCtrl 101;
				_text = ctrlText _ctrl;
				if (_text == '') then {
					_text = format ['%1', name player];
				} else {
					_text = format ['%1: %2', name player, _text];
				};
				_ctrl ctrlSetText _text;
			";
			waitUntil{isNull findDisplay 54};
		};
	};
};