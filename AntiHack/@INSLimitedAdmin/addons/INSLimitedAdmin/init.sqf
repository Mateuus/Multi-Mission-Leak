diag_log "INSLimitedAdmin Startup Initiated";
_1st = "
if (!isServer) then
{
CBA_display_ingame_warnings = false;
waituntil {Time > 5};
systemChat ""INSLimitedAdmin: Starting AntiHack Scripts..."";
broadcast00211 = 0;
_hacklock = false;
_player = name player;
sleep 0.2;
_pboclassesdetect = INSLimitedAdminServerVariables select 0;
_pboclasses = INSLimitedAdminServerVariables select 1;
_bannedvarsdetect = INSLimitedAdminServerVariables select 2;
_bannedvars = INSLimitedAdminServerVariables select 3;
_speedhackdetect = INSLimitedAdminServerVariables select 4;
_maxspeed = INSLimitedAdminServerVariables select 5;
_bannedwepsdetect = INSLimitedAdminServerVariables select 6;
_bannedweps = INSLimitedAdminServerVariables select 7;
_bannedvclsdetect = INSLimitedAdminServerVariables select 8;
_bannedvcls = INSLimitedAdminServerVariables select 9;
_banmessage = INSLimitedAdminServerVariables select 11;

_uid = getPlayerUID (vehicle player);

mess_serv00211 = _player + "" Joined The Server UID:"" + _uid;
publicVariableServer ""mess_serv00211"";
broadcast_serv00211 = 1;
publicVariableServer ""broadcast_serv00211"";

if (_pboclassesdetect) then
{
for ""_i"" from 0 to ((count _pboclasses) - 1) do
{
_classname = (_pboclasses select _i);
if (isClass (configFile >> _classname)) then
	{
	_hacklock = true;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Joined With A Banned MOD File UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	};
};
};

if (_bannedvarsdetect) then
{
for ""_i"" from 0 to ((count _bannedvars) - 1) do
{
_varname = (_bannedvars select _i);
if !(isnil _varname) then 
	{
	_hacklock = true;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Passed A Banned Variable UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	};
};
};

sleep 0.2;

if !(_hacklock) then
	{
	systemChat ""INSLimitedAdmin: Done!"";
	};

while {true} do
{
waituntil{((_bannedwepsdetect) && ((currentWeapon player) in _bannedweps)) or ((_bannedvclsdetect) && ((TypeOf (vehicle player)) in _bannedvcls)) or (broadcast00211 == 1) or ((_speedhackdetect) && !((vehicle player) in vehicles) && (round speed (vehicle player) > 30) && (alive player)) or ((_speedhackdetect) && ((vehicle player) in vehicles) && (round speed (vehicle player) > _maxspeed))};
if ((_speedhackdetect) && !((vehicle player) in vehicles) && (round speed (vehicle player) > 30) && (alive player)) then
	{
	sleep 2;
	if (alive player) then
		{
		_hacklock = true;
		mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Speed Hacked As Unit UID:"" + _uid;
		publicVariableServer ""mess_serv00211"";
		broadcast_serv00211 = 1;
		publicVariableServer ""broadcast_serv00211"";
		};
	};
if ((_speedhackdetect) && ((vehicle player) in vehicles) && (round speed (vehicle player) > _maxspeed)) then
	{
	_hacklock = true;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Speed Hacked In Vehicle UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	};
if ((_bannedwepsdetect) && ((currentWeapon player) in _bannedweps)) then
	{
	_hacklock = true;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Used A Banned Weapon UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	};
sleep 0.2;
if ((TypeOf (vehicle player)) in _bannedvcls) then
	{
	_veh = vehicle player;
	deleteVehicle _veh;
	_hacklock = true;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Entered Banned Vehicle UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	};
sleep 0.2;
if (_hacklock) exitWith
	{
	titleCut ["""", ""BLACK"",0];
	disableUserInput true;
	titleText [_banmessage, ""PLAIN""];
	mess_player00211 = ""INSLimitedAdmin: "" + _player + "" Has Been Caught Hacking, Contact An Admin Now! UID:"" + _uid;
	publicVariable ""mess_player00211"";
	broadcast00211 = 1;
	publicVariable ""broadcast"";
	player addScore -5000;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Was Hack-Locked By INSLimitedAdmin UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	_you = vehicle player;
	while {_hacklock} do
	{
		removeAllWeapons player;
		removeBackpack player;
		removeGoggles player;
		removeHeadgear player;
		removeUniform player;
		removeVest player;
		_you setPos [0,0,1000];
		sleep 0.1;
	};
	};
sleep 0.2;
if (broadcast00211 == 1) then
	{
	hint mess_player00211;
	systemChat mess_player00211;
	broadcast00211 = 0;
	};
};
};
";
_l1 = "logic" createUnit [[1,1,1], (createGroup sideLogic), format ["[] spawn {%1}", _1st], 0.5, "corporal"];
diag_log "INSLimitedAdmin Startup Finished";