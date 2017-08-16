if (isnil ("SmokeOn")) then 
{
	SmokeOn = 0;
};

if (SmokeOn==0) then
{
	SmokeOn=1;
	hint "Smoke is ON!";
	
	_sCode = 'while {SmokeOn==1} do {';
	_sCode = _sCode + 'Flare = "SmokeShell" createVehicle position vehicle player;Flare attachTo [vehicle player,[0,0,0]];';
	_sCode = _sCode + 'Flare1 = "Smokeshellpurple" createVehicle position vehicle player;Flare1 attachTo [vehicle player,[1,0,0]];';
	_sCode = _sCode + 'Flare2 = "Smokeshellblue" createVehicle position vehicle player;Flare2 attachTo [vehicle player,[2,0,0]];';
	_sCode = _sCode + 'Flare3 = "Smokeshellpurple" createVehicle position vehicle player;Flare3 attachTo [vehicle player,[-1,0,0]];';
	_sCode = _sCode + 'Flare4 = "SmokeshellYellow" createVehicle position vehicle player;Flare4 attachTo [vehicle player,[-2,0,0]];';
	_sCode = _sCode + 'Flare5 = "SmokeshellYellow" createVehicle position vehicle player;Flare5 attachTo [vehicle player,[-3,0,0]];';
	_sCode = _sCode + 'Flare6 = "Smokeshellblue" createVehicle position vehicle player;Flare6 attachTo [vehicle player,[3,0,0]];';
	_sCode = _sCode + 'Flare7 = "SmokeShellRed" createVehicle position vehicle player;Flare7 attachTo [vehicle player,[4,0,0]];';
	_sCode = _sCode + 'Flare8 = "SmokeShellRed" createVehicle position vehicle player;Flare8 attachTo [vehicle player,[-4,0,0]];';
	_sCode = _sCode + 'sleep 28;};';
	
	[] spawn compile _sCode;
}
else
{
	sleep 0.5;
	deleteVehicle Flare;
	deleteVehicle Flare1;
	deleteVehicle Flare2;
	deleteVehicle Flare3;
	deleteVehicle Flare4;
	deleteVehicle Flare5;
	deleteVehicle Flare6;
	deleteVehicle Flare7;
	deleteVehicle Flare8;
	SmokeOn=0;
	hint "Smoke is OFF!";
};