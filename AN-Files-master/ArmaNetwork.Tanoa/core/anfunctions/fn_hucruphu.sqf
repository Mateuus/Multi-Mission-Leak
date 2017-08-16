/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
if (isNull (findDisplay 2620)) then 
{
	if (!(createDialog "an_gangmenu")) exitWith 
	{
		hintSilent "Could not create Gang Dialog";
	};
};

private _ownerID = (group player) getVariable ["gangLeader",""];

if (_ownerID isEqualTo "") exitWith 
{
	closeDialog 0;
};

private _gangName = (group player) getVariable ["gangName",""];
private _gangBank = (group player) getVariable ["gangBank",0];
private _level = (group player) getVariable ["gangLevel", -1];

if !(_ownerID isEqualTo (getPlayerUID player)) then 
{
	private _rank = player getVariable ["gangRank",-1];
	if (_rank isEqualTo -1) exitWith {};
	private _upgrade = if ((getNumber (missionConfigFile >> "CfgGangs" >> format ["gangrank_%1",_rank] >> "upgrade")) isEqualTo 1) then {true} else {false};
	private _kick = if ((getNumber (missionConfigFile >> "CfgGangs" >> format ["gangrank_%1",_rank] >> "kick")) isEqualTo 1) then {true} else {false};
	private _rankup = if ((getNumber (missionConfigFile >> "CfgGangs" >> format ["gangrank_%1",_rank] >> "rankplayer")) isEqualTo 1) then {true} else {false};
	ctrlEnable [2401,_upgrade]; // Upgrade
	ctrlEnable [2402,_kick]; // Kick
	ctrlEnable [2403,false]; // Only leader can do this SetLeader
	ctrlEnable [2409,false]; // Only leader can do this
	ctrlEnable [2406,false];
	ctrlEnable [2404,_rankup]; // Rank up
	ctrlEnable [2405,_rankup]; // Rank down
};

ctrlSetText [1002,format ["Your Gang - %1",_gangName]];
ctrlSetText [1003,format ["Current Gang Level - %1",_level]];
ctrlSetText [1004,format ["Gang Funds - $%1",[_gangBank] call life_fnc_rupadudejat]];

lbClear 1500;

{
	if ((getPlayerUID _x) isEqualTo _ownerID) then 
	{
		private _index = lbAdd [1500, format["%1 (Leader)",(_x getVariable["realname",name _x])]];
		lbSetData [1500,_index,str(_x)];
	} 
	else 
	{
		private _rankMember = _x getVariable ["gangRank",-1];
		private _index = lbAdd [1500, format["%1 (%2)",(_x getVariable["realname",name _x]),getText (missionConfigFile >> "CfgGangs" >> format ["gangrank_%1",_rankMember] >> "name")]];
		lbSetData [1500,_index,str(_x)];
	};
} forEach (units (group player));
