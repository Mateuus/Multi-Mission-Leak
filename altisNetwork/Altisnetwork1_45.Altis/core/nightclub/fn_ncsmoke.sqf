/* 
	File: fn_ncsmoke.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Creates a smoke canister, that then is constantly recreated and hidden to create a smoke machine effect.
*/
if((smokem getVariable["nightclub_smoke",false])) exitWith
{
	hint "Wait for the smoke to turn off.";
	smokem setVariable["nightclub_smoke",false,true];
};
smokem setVariable["nightclub_smoke",true,true];
hint "Smoke is On!";

while {(smokem getVariable["nightclub_smoke",false])} do
{
	_smoke = "SmokeShell" createVehicle getMarkerPos "smoke";
	hideObject _smoke;
	sleep 60;
	
};