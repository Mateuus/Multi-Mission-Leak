/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_maxMembers"];

_level = (group player) getVariable["gangLevel", -1];


_maxMembers = 6 + ((_level - 1) * 2);
//_plotPole = false;
_newMaxMembers = 6 + (_level * 2);
_message = "It costs $%1 to upgrade to level %2.";

_costs = [_level] call life_fnc_gangGetUpgradePrice;
/*
if (_level == life_gang_plot_rank) then {
	_plotPole = true;
	_message = _message + " This upgrade includes a plotpole to build your base! Make sure you have atleast one virtual inventory slot available.";
};
*/
_message = format[_message, [_costs] call life_fnc_numberText, _level + 1];


if (/*_plotPole && */getPlayerUID player != (group player) getVariable["gangLeader", ""]) exitWith { hint "Only the gang leader can upgrade to level 5 because of the plotpole they'd receive to build your gang base!"; };
_action = [
	_message,
	"Upgrade gang",
	localize "STR_Global_Buy",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	_bank = (group player) getVariable["gangBank", -1];
	if (_bank == -1 || _bank < _costs) exitWith { hint "There's not enough cash in the gang bank for pay for this upgrade."; };

	_bank = _bank - _costs;
	(group player) setVariable["gangBank", _bank, true]; // Combine the update call later
	(group player) setVariable["gangLevel", _level + 1, true];

	_hintMessage = "Congratulations, your gang has been upgraded to level %1!";
	/*
	if (_plotPole) then {
		[true, "build_" + life_build_plot_pole, 1] call life_fnc_handleInv;
		_hintMessage = _hintMessage + " You've been granted a plotpole as part of the upgrade! Click the Toggle Building areas button in your gang menu to see where you can build!";
	};
	*/
	[10, (group player)] remoteExecCall ["life_fnc_gangUpdate",2];

	hint format[_hintMessage, _level + 1];
} else {
	hint format["Upgrade cancelled."];
};
