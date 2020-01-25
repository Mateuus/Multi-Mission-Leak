/*
	fn_getTester.sqf
	Pennyworth	
*/

if(life_requestingTestDrive) exitWith {["You already have a request for a test drive pending.", false] spawn domsg};
if!(isNull objectParent player) exitWith {["You cannot test drive a vehicle while already inside a vehicle, exit the vehicle and send the request again.", false] spawn domsg};
if(life_onTestDrive) exitWith {["You are already on a test drive.", false] spawn domsg};

disableSerialization;

_display = findDisplay 2700;
_salesmanList = _display displayCtrl 2701;
_salesman = _salesmanList lbData (lbCurSel _salesmanList);

if(_salesman isEqualTo "") then {
	[] spawn life_fnc_testDrive;
 } else {
	_salesman = call compile _salesman;
	if(player isEqualTo _salesman) exitWith {["You can't go on a test drive with yourself.", false] spawn domsg};
	[] spawn {
		waitUntil {closeDialog 0; (isNull findDisplay 2700 && isNull findDisplay 17500)};
	};
	life_requestingTestDrive = true;
	life_testDriveRequest = nil;

	[format ["You have sent a test drive request to %1. If they do not respond within 30 seconds you will be able to send another request.",name _salesman], false] spawn domsg;
	[_salesman,player] remoteExec ["life_fnc_requestTestDrive",_salesman];
	_time = time;
	waitUntil {sleep 1; (!isNil "life_testDriveRequest" || (time - _time) > 30)};

	life_requestingTestDrive = false;
	
	if(isNil "life_testDriveRequest") exitWith {["No response was received.", false] spawn domsg};
	if!(life_testDriveRequest) exitWith {[format ["Your request to test drive the vehicle with %1 was declined, the salesman might already be on a test drive.",_salesman],false]; life_testDriveRequest = nil};
	if(life_testDriveRequest) then {
		if!(isNull objectParent player) exitWith {
			["You cannot test drive a vehicle while already inside a vehicle, exit the vehicle and send the request again.", false] spawn domsg;
			life_testDriveRequest = nil;
		};
		[false,_salesman] spawn life_fnc_testDrive;
	};
};
