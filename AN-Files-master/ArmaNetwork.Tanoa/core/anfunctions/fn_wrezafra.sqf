/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _mode = param [0,-1,[0]];

try 
{
	if (_mode isEqualTo -1) then 
	{
		throw "Rank Type not given";
	};

	if ((lbCurSel 1500) isEqualTo -1) then
	{ 
		throw "You must select a person to rank.";
	};

	private _unit = call compile (lbData [1500,(lbCurSel 1500)]);
	if (isNull _unit) then 
	{
		throw "Player doesn't exist anymore?";
	};

	if (_unit isEqualTo player) then 
	{
		throw "You can not rank yourself.";
	};

	private _leader = (group player) getVariable ["gangLeader",""];
	if (getPlayerUID _unit isEqualTo _leader) then 
	{
		throw "The leader can't be ranked lower or higher.";
	};

	private _currentRank = _unit getVariable ["gangRank", -1];
	private _gangRankCount = count (getArray(missionConfigFile >> "CfgGangs" >> "amount"));

	switch _mode do 
	{
		case 0:
		{
			private _newRank = _currentRank + 1;

			if (_newRank < 0 || {_newRank >= _gangRankCount}) then 
			{
				throw "You can't rank this player any higher/lower.";
			};

			_unit setVariable ["gangRank", _newRank, true];

			[0, _unit, _newRank, (getText (missionConfigFile >> "CfgGangs" >> format ["gangrank_%1",_newRank] >> "name"))] remoteExecCall ["life_fnc_gangRankPlayerRequest",2];
		};
		case 1: 
		{
			private _newRank = _currentRank - 1;

			if (_newRank < 0 || {_newRank >= _gangRankCount}) then 
			{
				throw "You can't rank this player any higher/lower.";
			};

			_unit setVariable ["gangRank", _newRank, true];

			[1, _unit, _newRank, (getText (missionConfigFile >> "CfgGangs" >> format ["gangrank_%1",_newRank] >> "name"))] remoteExecCall ["life_fnc_gangRankPlayerRequest",2];
		};
		default {};
	};
	closeDialog 0;
}
catch
{
	hintSilent _exception;
};
