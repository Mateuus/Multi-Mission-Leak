/*
initRace.sqf
Kevin Webb
starts the race on the client side
*/
disableSerialization;
_point = param [0,[],[[]]];
_stake = param [1,0,[0]];
["atm","take",_stake] call life_fnc_handleCash;
["Wyscig zaraz sie zacznie!", false] spawn domsg;
uiSleep 1;
openMap[true,false];
_finishLine = createMarkerLocal["finishLine",_point];
_finishLine setMarkerTypeLocal "mil_warning";
_finishLine setMarkerColorLocal "ColorRed";
_finishLine setMarkerTextLocal "FINISH POINT";
_task = player createSimpleTask ["Race"];
_task setTaskState "Assigned";
_veh = "Land_ClutterCutter_small_F" createVehicleLocal _point;
_task setSimpleTaskTarget [_veh,true];
_task setSimpleTaskDescription ["Your task is to win the race!","Race","Finish Line"];
player setCurrentTask _task;
_map = ((findDisplay 12) displayCtrl 51);
_map ctrlMapAnimAdd[3,0.1,_point];
ctrlMapAnimCommit _map;
uiSleep 3.1;
openMap[false,false];
for "_i" from 0 to 2 do
{
	uiSleep 1.5;
	switch (_i) do
	{
		case 0: { playSound "racebeep1"; };
		case 1: { playSound "racebeep1"; };
		case 2: { playSound "racebeep2"; };
	};
};
vehicle player enableSimulation true;
["GO!", false] spawn domsg;
while {player distance _point > 10 && !raceDone} do {
	hintSilent format["Distance to finish: %1",round(player distance _point)];
	uiSleep 0.25;
};
[] spawn {
	uiSleep 3;
	raceDone = false;
};
hintSilent "";
deleteMarkerlocal _finishLine;
deleteVehicle _veh;
_task setTaskState "Succeeded";
player removeSimpleTask _task;