/*
	ALAH SNACKBAR!
*/
private["_test"];
if(vest player != "V_HarnessOGL_brn") exitWith {};
if(vehicle player != player) exitWith {hint "You cannot detonate your vest from within a vehicle."};
if((getPosATL player) select 2 > 20) exitWith {hint "You cannot detonate your vest when not on the ground."};
removeVest player;
_test = "Bo_Mk82" createVehicle [0,0,9999];
//Begin Edit: Change position to spawn bomb on player for towers, docks, and buildings. ~Gnash
_test setPosATL (getPosATL player);
//End Edit
_test setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

serv_killed = [player,"1080"];
publicVariableServer "serv_killed";

[[0,format["%1 has detonated their suicide vest.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

//[[46, player, format["Detonated suicide vest"]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;