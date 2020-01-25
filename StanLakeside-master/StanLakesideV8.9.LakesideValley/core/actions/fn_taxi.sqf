if( life_koil_parachute != 2 ) exitWith { ["FLY GUY: I need your used plane ticket.", false] spawn domsg; };


if(life_action_inUse) exitWith {

};	

if((player getVariable ["tied", false])) exitWith {

};		
if((player getVariable ["restrained", false])) exitWith {

};

life_koil_parachute = 1;
_timer = 300;
_className = 1;

[format ["This car will be deleted after the 5 minute timer - you must be the driver.",_className], false] spawn domsg;

_vehicle = createVehicle ["S_Rangerover_Black", (player), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle disableTIEquipment true; 
_vehicle allowDamage false;

while { _timer > 0 } do {
	uiSleep 1;
	_timer = _timer - 1;
	hintsilent format ["Rental Timer: %1",_timer];
};
_vehicle setVelocity [0, 0, 0];
deleteVehicle _vehicle;
[format ["Your Car service is over.",_className], false] spawn domsg;
