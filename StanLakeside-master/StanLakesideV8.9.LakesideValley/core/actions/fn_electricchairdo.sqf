/*
Search Words: 
electric chair do
*/


playSound3D ["cg_sndimg\sounds\electricchair.ogg", cursorTarget, false, getPosASL player, 1, 1, 225];


life_cur_Target = cursorTarget;

_color = "SmokeShell";
_smoke = _color createVehicle position life_cur_Target;
_smoke attachTo [vehicle life_cur_Target, [0,-1,0]];

_num = 170;
while {_num > 0} do {
	life_cur_Target setPos [8779.17,6719.69,0];
	life_cur_Target setDir 278.52;	
	uiSleep 0.1;
	life_cur_Target setPos [8779.08,6719.62,0];
	life_cur_Target setDir 278.32;
	_num = _num - 1;
};

deleteVehicle _smoke;
_color = "SmokeShell";
_smoke = _color createVehicle position life_cur_Target;
_smoke attachTo [vehicle life_cur_Target, [0,-1,0]];

uiSleep 3;

life_cur_Target setDamage 1;

deleteVehicle _smoke;