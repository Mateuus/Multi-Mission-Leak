if((smokem getVariable["nightclub_smoke",false])) exitWith
{
	hint "Wait for the smoke to turn off.";
	smokem setVariable["nightclub_smoke",false,true];
};
smokem setVariable["nightclub_smoke",true,true];
hint "Smoke is On!";

while {(smokem getVariable["nightclub_smoke",false])} do
{
	_smoke1 = "SmokeShellRed" createVehicle [3645.93,13371,0.00399303];
	_smoke2 = "SmokeShellGreen" createVehicle [3642.07,13374.6,0.00407839];
	_smoke3 = "SmokeShellBlue" createVehicle [3638.54,13377.8,0.00362682];
	hideObject _smoke1;
	hideObject _smoke2;
	hideObject _smoke3;
	sleep 60;
};