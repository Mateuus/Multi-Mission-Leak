// by ALIAS
// nul = [_fall_star] execvm "Katastrophen\star_lumina.sqf";
// Tutorial: WIP

_fall_star_light = _this select 0;
_bri_li = 3000;
_li = "#lightpoint" createVehicleLocal [(getPos _fall_star_light select 0),(getPos _fall_star_light select 1),(getPos _fall_star_light select 2)];
_li lightAttachObject [_fall_star_light, [0,0,0]];
_li setLightIntensity _bri_li;
_li setLightAttenuation [/*start*/ 500, /*constant*/300, /*linear*/ 3000, /*quadratic*/ 0, /*hardlimitstart*/5,/* hardlimitend*/500]; 
_li setLightUseFlare true;
_li setLightFlareSize 10;
_li setLightFlareMaxDistance 2000;	
_li setLightAmbient[1,.8,.7];
_li setLightColor[1,1,1];	

sleep 0.2;

_li setLightFlareSize 5;

while {_bri_li>-50} do {
	_li setLightIntensity _bri_li;
	_bri_li=_bri_li-50;
sleep 0.05;
};
waitUntil {_bri_li==0};
deleteVehicle _li;