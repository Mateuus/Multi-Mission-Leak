enableSaving [false, false];

ASY_UsingHeadless = !(isNil "HC1");
X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

life_versionInfo = "Asylum v7.5.4";

//if (isServer) then { while { !ASY_UsingHeadless && time < 6 } do { ASY_UsingHeadless = !(isNil "HC1"); }; };

diag_log format["Initializing %1 (%2)", life_versionInfo, isServer];

if (isServer) then
{
	diag_log format["isServer %1", isServer];
	if (ASY_UsingHeadless) then { waitUntil { (owner HC1) > 0 }; };
	[] call compile PreprocessFileLineNumbers "\life_server\server_init.sqf";
};

if((isServer && !ASY_UsingHeadless) || (ASY_UsingHeadless && !isServer && !hasInterface)) then
{
	if(!X_Server) then
	{
		X_Server = true;
		[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
		[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
	};
};
if(!isDedicated && hasInterface) then { X_Client = true;};

if(X_Client) then // Not HC
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
	//	[] execVM "zlt_fastrope.sqf";
	};
};

enableSaving[false,false];

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

//if(!StartProgress) then
//{
//	[3,false,false] execFSM "core\fsm\core_time.fsm";
//};
StartProgress = true;

MISSION_ROOT = format ["mpmissions\__CUR_MP.%1\", worldName];
[] spawn {
	if(isServer) exitWith {
		KBW_fnc_chopMyGarage = {
			_newID = param[0];
			_vehicle = param[1];
			_oldID = (_vehicle getVariable "dbInfo") select 0;
			_plate = (_vehicle getVariable "dbInfo") select 1;
			_SQL = format["UPDATE vehicles SET active='0',pid='%1' WHERE pid='%2' AND plate='%3'",_newID,_oldID,_plate];
			deleteVehicle _vehicle;
			[_SQL,1] call DB_fnc_asyncQuery;
		};
	};
	while{true} do
	{
		waitUntil {visibleMap};
		waitUntil {!isNull findDisplay 54 || !visibleMap};
		if(visibleMap) then {
			findDisplay 54 displayCtrl 1 buttonSetAction 
			"
				if(currentChannel in [0,1]) then {
					_ctrl = findDisplay 54 displayCtrl 101;
					_text = ctrlText _ctrl;
					if (_text == '') then {
						_text = format ['%1', name player];
					} else {
						_text = format ['%1: %2', name player, _text];
					};
					_ctrl ctrlSetText _text;
				};
			";
			waitUntil{isNull findDisplay 54};
		};
	};
};

// VOIP channel permissions
0 enableChannel false;			// Global
1 enableChannel [true, false];	// Side
2 enableChannel false;			// Command
3 enableChannel true;			// Group