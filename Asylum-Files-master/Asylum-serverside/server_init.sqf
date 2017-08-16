






life_radio_dispatch = radioChannelCreate [[0, 0, 1, 1], "APD Dispatch", "%UNIT_NAME", []];
life_radio_RF = [
radioChannelCreate [[0.8,0,0.6,0.9], "Radio Chan 1", "%UNIT_NAME", []],
radioChannelCreate [[0.8,0,0.6,0.9], "Radio Chan 2", "%UNIT_NAME", []],
radioChannelCreate [[0.8,0,0.6,0.9], "Radio Chan 3", "%UNIT_NAME", []]
];
life_phone_groups =
[
[radioChannelCreate [[0.8,0,0.6,0.9], "Cell Phone", "%UNIT_NAME", []], []],
[radioChannelCreate [[0.8,0,0.6,0.9], "Cell Phone", "%UNIT_NAME", []], []],
[radioChannelCreate [[0.8,0,0.6,0.9], "Cell Phone", "%UNIT_NAME", []], []],
[radioChannelCreate [[0.8,0,0.6,0.9], "Cell Phone", "%UNIT_NAME", []], []],
[radioChannelCreate [[0.8,0,0.6,0.9], "Cell Phone", "%UNIT_NAME", []], []]
];

diag_log format["ASY_UsingHeadless = %1", ASY_UsingHeadless];
if (ASY_UsingHeadless) then
{
publicVariable "life_radio_dispatch";
publicVariable "life_radio_RF";
publicVariable "life_phone_groups";
};

addMissionEventHandler ["HandleDisconnect", {
if (isServer && ASY_UsingHeadless) then
{
if (_this select 0 == HC1 && isNil "life_shuttingDown") exitWith { [["EndHC",false],"BIS_fnc_endMission", true, false] spawn BIS_fnc_MP; };
[[_this select 3,_this select 2, _this select 0],"ASY_fnc_playerDisconnected",(owner HC1),false] spawn life_fnc_MP;
}
else { [_this select 3,_this select 2, _this select 0] spawn ASY_fnc_playerDisconnected; };
}];

[] execVM "\life_server\eventhandlers.sqf";

[] spawn 
{
_lastMultiplyer = -1;
while {true} do
{
_multiplier = 12; 
if (sunOrMoon < 1) then { _multiplier = _multiplier * 4.5; }; 
if (_lastMultiplyer != _multiplier) then { setTimeMultiplier _multiplier; _lastMultiplyer = _multiplier; };
sleep 200;
};
};

[] spawn
{
waitUntil {!isNil "life_restart_delay"}; 
sleep life_restart_delay;	
[] spawn ASY_fnc_rebootMonitor;
};