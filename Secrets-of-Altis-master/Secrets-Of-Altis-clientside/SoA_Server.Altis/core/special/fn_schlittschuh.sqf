
_mode = _this select 3;

switch(_mode) do {
	case 0: {
		schlittschuhfahrt = true;	
		player setpos getmarkerpos "schlittschuhstart";
		schlittschuhaction = player addaction ["Schlittschuhfahrt beenden",life_fnc_schlittschuh,1];

		while{schlittschuhfahrt} do {
			player allowdamage false;
			_v2 = 5.15;
			_dir = direction player; 
			_vel = velocity player;  
			player setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)];
			sleep 0.01;
		};
	};
	case 1: {
		schlittschuhfahrt = false;
		player setpos getmarkerpos "schlittschuhend";
		player allowdamage true;
		player removeaction schlittschuhaction;
	};
};