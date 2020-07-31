//if in progress EXIT
_civs = (civilian countSide playableUnits) + (east countSide playableUnits);
if(_civs < 30) exitwith { hint "Not enough Civilians and mafia (30)"; };

if(rebelshipment getVariable["progress",FALSE]) exitwith { hint "Already being captured by someone else - or it was attempted to be captured recently."; };

//start progress
rebelshipment setvariable ["progress", true, true];

//start server side checks incase of disconnect etc
["dochecks", player] remoteExec ["TON_fnc_doRebel",2];

_success = false;

 
_calcT = 0;
_startpos = getpos player;

//Starting Messages

["The Police are raiding the South Rebel Weapon Shipment! (20 Minutes)", false] remoteExec ["domsg",-2]; 
["dgang", false] remoteExec ["fnc_dispatch",west];

//Client side checks
while {true} do {
	if(player distance _startpos > 15 || deadPlayer) exitwith { _success = false;};
	_calcT = _calcT + 1;
	if(_calcT > 1200) exitwith { _success = true; ["You finished capturing!", false] spawn domsg;  };
	if(_calcT == 120 || _calcT == 180 || _calcT == 240 || _calcT == 300 || _calcT == 360 || _calcT == 420 || _calcT == 480 || _calcT == 540 ) then {
		["The Police are raiding the Rebel Weapon Shipment!", false] remoteExec ["domsg",-2]; 

	};
	if(_calcT == 60) then {
		["The Police are raiding the Rebel Weapon Shipment in 1 minute!", false] remoteExec ["domsg",-2]; 
	};

	uisleep 1;
	hintSilent parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You have taken %1 seconds. <br/> Needed: 1200 seconds total.",_calcT];
};

//Client side checks have finished - turn off progress.
rebelshipment setvariable ["progress", nil, true];
deletemarker "rebelShipment";

//Set final variables and server side functions for resets.
if(_success) then {
	rebelshipment setvariable ["finished", true, true];
	rebelshipment setvariable ["notCaptured", true, true];
	["The Police have seized the Rebel Weapon Shipment and Cash!", false] remoteExec ["domsg",-2]; 
	["The Rebel Store is shut down for the next 30 minutes!", false] remoteExec ["domsg",-2]; 
	["cash","add",25000] remoteExecCall ["life_fnc_handlecash",west];
	["finishRebel", player] remoteExec ["TON_fnc_finishRebel",2];	
} else {
	["An attempt at capturing a rebel shipment has failed!", false] remoteExec ["domsg",-2]; 
	["All Civilians have earned $4000", false] remoteExec ["domsg",-2]; 
	["cash","add",4000] remoteExecCall ["life_fnc_handlecash",civilian];
};