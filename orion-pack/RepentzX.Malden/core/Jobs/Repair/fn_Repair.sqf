// Repair Nearby Objects (within Distance)
if(player getVariable ["Repairing",true])exitWith{
	["You are Already Repairing something.",false,"slow"] call life_fnc_notificationSystem;
};

/*Job system
if (!(player getVariable ["Job", "Repair"] == "Repair")) exitWith {
		["Error", ["Jobs", "You must be a repair man to do this."]] call life_fnc_notificationSystem;
};
*/

_exit = false;
//Job system
//_BetweenJobs = getNumber(missionConfigFile >> "ADT_Jobs" >> "Repair" >> "TimeBetween");
_BetweenJobs = 1;
if (player getVariable ["RepairJobDone", true]) exitWith {
		_Text = format ["You can only do this every %1 minutes", _BetweenJobs];
		hint format ["%1",_Text];
	};
/*
_Distance  = getNumber(missionconfigfile >> "ADT_Jobs" >> "Repair" >> "MaxRepairDistance");
_PerObject = getNumber(missionConfigFile >> "ADT_Jobs" >> "Repair" >> "ExtraPerJob");
*/
_Distance = 10;
_PerObject = 550;
/*
if (player distance getMarkerPos "Jail_Marker" < 200) then {
		_distance  = 500;
		_PerObject = 100;
};
*/
_nearObjects   = nearestObjects [player, [], _distance];
_ArraytoRepair = [];
{
	if(damage _x >= 0.5 && (!(isplayer _x )) && (!(_x isKindOf "Man")) && (!(_x isKindOf "Animal")) && (!(_x iskindof "CAR" || _x isKindOf "AIR" || _x isKindOf "Tank"))) then {
			_ArraytoRepair pushBack _x;
	};
} forEach _nearObjects;

if(count _ArraytoRepair <= 0)then {
	_Text = format ["There are no Objects near you to repair.",count _ArraytoRepair];
		hint format ["%1",_Text];
} else {
	_Text = format ["There are %1 Objects near you to repair",count _ArraytoRepair];
	hint format ["%1",_Text];
};

player setVariable ["Repairing",true,true];

_AmountofObj = count _ArraytoRepair;
{

	if (damage _x >= 0.5 && (!(isplayer _x )) && (!(_x isKindOf "Man")) && (!(_x isKindOf "Animal")) && (!(_x iskindof "CAR" || _x isKindOf "AIR" || _x isKindOf "Tank"))) then {

			[player, "AinvPknlMstpSnonWnonDnon_medic_1", true] remoteExecCall ["life_fnc_animSync", -2];
			player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 3;
			_Text = format ["You have earned an extra $%1 for Repairing an object", _PerObject];
			hint format ["%1",_Text];
			_x setdamage 0;
			[_x] remoteExecCall ["life_fnc_unhideObj", 0];
			life_houseProtect = life_houseProtect + _PerObject;
		};
		sleep 1;
		if (!alive player) exitWith {_exit = true;};
		if !(isNull objectParent player) exitWith {_exit = true;};
		if (life_interrupted) exitWith {_exit = true;};
		_Text = format ["There are %1 Objects Left to repair",_AmountofObj];
		hint format ["%1",_Text];
		_AmountofObj = _AmountofObj - 1;
		if(life_interrupted)exitWith{
			_Text = format ["You have cancelled the repair."];
			hint format ["%1",_Text];
		};
} foreach _ArraytoRepair;
if(_exit)exitWith{
	player setVariable ["Repairing",false,true];
	_Text = format ["You have Cancelled the rapair."];
	hint format ["%1",_Text];
};
_Text = format ["You have repaired everything within your range"];
hint format ["%1",_Text];
player playActionNow "stop";
player setVariable ["Repairing",false,true];

if (getPlayerUID player == "") then {//Put Admin Uids in here to stop the timer...
	//Do nothing
} else {
	player setVariable ["RepairJobDone", true, true];
	sleep (_BetweenJobs * 120);	// Sleeps the time between jobs, then resets the variable.
	player setVariable ["RepairJobDone", false, true];
};