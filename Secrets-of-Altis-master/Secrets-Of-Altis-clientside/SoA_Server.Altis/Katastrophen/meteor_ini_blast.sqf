// by ALIAS
// nul = [] execvm "Katastrophen\meteor_ini_blast.sqf";
// Tutorial: WIP

_falling_meteor_ini = _this select 0;
_poz_ini = getPos _falling_meteor_ini;
_blinding = random 30;
	
if (_blinding<7) then {
	_light = "#lightpoint" createVehicleLocal getpos _falling_meteor_ini;
	_light setpos _poz_ini;
	_light setLightDayLight true;
	_light setLightBrightness 30000;
	_light setLightAmbient [0.5, 0.5, 1];
	_light setlightcolor [1, 1, random 2];
	sleep 0.5;
	deletevehicle _light;
};