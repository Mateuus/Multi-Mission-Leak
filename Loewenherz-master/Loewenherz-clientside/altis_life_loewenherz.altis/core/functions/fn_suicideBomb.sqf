/*
	ALAH SNACKBAR!
*/
private["_test"];

[[player,"alahsnackbar"],"lhm_fnc_say3D",nil,false] call lhm_fnc_mp; sleep 1.5; // LHM

if(vest player != "V_HarnessOGL_brn") exitWith {};
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

[[0,format["%1 has set off their suicide vest.",name player]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;