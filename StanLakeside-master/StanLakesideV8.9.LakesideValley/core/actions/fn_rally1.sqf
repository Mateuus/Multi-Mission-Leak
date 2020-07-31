_isRally2 = param [3,false,[false]];

if( life_koil_rally == 1 ) exitWith { ["You were recently in a rally, please wait.", false] spawn domsg; };


if(life_action_inUse) exitWith {

};	

if((player getVariable ["tied", false])) exitWith {

};		
if((player getVariable ["restrained", false])) exitWith {

};

_nearVehicles = nearestObjects[getmarkerPos "rally_1_start",["Car","Motorbike","Motorcycle","Bicycle","Bike","Air","Ship"],10];
if(count _nearVehicles > 0) exitWith
{
	["Vehicle to close to rally start, exiting.", false] spawn domsg;
};

_startpos = getpos player;
life_koil_rally = 1;

_className = "A3L_EvoXrally_blue";
_markername = if(_isRally2) then {"rally_2_start"} else {"rally_1_start"};


_vehicle = createVehicle [_className, (getmarkerPos _markername), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle allowDamage false;
_vehicle lock 1;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _markername));
_vehicle setDir (markerDir _markername);
_vehicle setPos (getmarkerPos _markername);
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle disableTIEquipment true; 
uiSleep 1;

_timer = 300;
[player,"start"] spawn life_fnc_nearestSound;
	hint "3";
	uiSleep 1;
	hint "2";
	uiSleep 1;
	hint "1";	
	uiSleep 1;
	hint "GO!";
	while { _timer > 0 } do {
		uiSleep 1;
		_timer = _timer - 1;
		if((player distance (getmarkerpos "rally_1_finish")) < 45) exitwith {
		[player,"endbeep"] spawn life_fnc_nearestSound;
		uiSleep 3;
		};
		if((player distance (getmarkerpos "rally_stop_1")) < 40) exitwith {
			_timer = 0;
		};

		if((player distance (getmarkerpos "rally_stop_2")) < 40) exitwith {
			_timer = 0;
		};

		if((player distance (getmarkerpos "rally_stop_3")) < 40) exitwith {
			_timer = 0;
		};

		if((player distance (getmarkerpos "rally_stop_4")) < 40) exitwith {
			_timer = 0;
		};
	};
	
uiSleep 1;
_vehicle setVelocity [0, 0, 0];
deleteVehicle _vehicle;
player setpos _startpos;
_totalcash = round(_timer * 3);
life_koil_rally = 0;
[format["Your Rally is over - you earned %1 with %2 seconds left.",_totalcash,_timer], false] spawn domsg;
[0,format["%1 pozostalo %2 sekund na probie czasowej.",name player, _timer]] remoteExecCall ["life_fnc_broadcast", -2];

["cash","add",_totalcash] call life_fnc_handleCash;