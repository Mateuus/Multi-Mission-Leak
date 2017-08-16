/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;


if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {hint "Could not create Gang Dialog";};
};

((findDisplay 2620) displayCtrl 2635) ctrlEnable false;
((findDisplay 2620) displayCtrl 2640) ctrlEnable false;
((findDisplay 2620) displayCtrl 2650) ctrlEnable false;
((findDisplay 2620) displayCtrl 2655) ctrlEnable false;

_ownerID = (group player) getVariable["gangLeader",""];
if(_ownerID == "") exitWith {closeDialog 0;}; //Bad juju
_gangName = (group player) getVariable "gangName";
_gangBank = (group player) getVariable "gangBank";
_count = count units group player;
_level = (group player) getVariable["gangLevel", -1];
_gangMax = 6 + ((_level - 1) * 2);

if(_ownerID != getPlayerUID player) then {
	_rank = player getVariable["gangRank", -1];
	if (_rank == -1) exitWith {};

	_rankConfig = [_rank] call life_fnc_gangGetRank;

	((findDisplay 2620) displayCtrl 2622) ctrlEnable (_rankConfig select 5); // Upgrade
	((findDisplay 2620) displayCtrl 2624) ctrlEnable (_rankConfig select 2); // Kick
	((findDisplay 2620) displayCtrl 2625) ctrlEnable false; // Only leader can do this
	((findDisplay 2620) displayCtrl 2630) ctrlEnable (_rankConfig select 7); // Invite Player
	((findDisplay 2620) displayCtrl 2631) ctrlEnable false; // Only leader can do this
	//((findDisplay 2620) displayCtrl 2640) ctrlEnable false; // Only leader can do this
	((findDisplay 2620) displayCtrl 2638) ctrlEnable (_rankConfig select 3); // Rank up
	((findDisplay 2620) displayCtrl 2639) ctrlEnable (_rankConfig select 3); // Rank down
};

((findDisplay 2620) displayCtrl 1100) ctrlSetStructuredText parseText format ["Gang Name: %1<br/>Gang Level: %2<br/>Gang Bank: $%3<br/>Gang Members Online: %4<br/>Gang War Status: Coming Soon<br/>Gang Income (Per Hour): Coming Soon",_gangName,_level,[_gangBank] call life_fnc_numberText,_count];

//Loop through the players.
_members = (findDisplay 2620) displayCtrl 2621;
lbClear _members;
{
	if((getPlayerUID _x) == _ownerID) then {
		_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),(_x getVariable["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} else {
		_rank = [_x getVariable["gangRank", -1]] call life_fnc_gangGetRank;
		_members lbAdd format["%1 (%2)",(_x getVariable["realname",name _x]), _rank select 1];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} foreach (units (group player));

_grpMembers = units (group player);
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gangId"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} forEach _allUnits;
_allUnits = _allUnits - [-1];

_ctrl = (findDisplay 2620) displayCtrl 2632;
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} forEach _allUnits;
