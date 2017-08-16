private["_nX","_nY","_dI","_dJ","_class","_front","_right","_dir","_origin","_pos","_randomclass","_veh"];
_nX = 2;
_nY = 2;
_dI = 3;
_dJ = 5;
//_class = "C_Kart_01_F"; 
_class=["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"];
_front = [sin(getDir player), cos(getDir player), 0];
_front = _front vectorMultiply _dI;
_right = [sin((getDir player) + 90), cos((getDir player) + 90), 0];
_right = _right vectorMultiply _dJ;
_dir = (getDir player) - 90;
_origin = (position player) vectorAdd _front;
for "_i" from 0 to _nX do {
	for "_j" from 0 to _nY do {
		_pos = _origin vectorAdd ( (_front vectorMultiply _i) vectorAdd (_right vectorMultiply _j) );
		_randomclass= _class call BIS_fnc_selectRandom;
		_veh = createVehicle [_randomclass, _pos, [], 0, "CAN_COLLIDE"];
		_veh allowDamage false;
		_veh setDir _dir;
	};
};