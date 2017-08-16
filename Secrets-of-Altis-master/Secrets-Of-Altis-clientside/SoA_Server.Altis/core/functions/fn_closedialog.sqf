
_mode = _this select 0;
if(isnil "_mode") then {_mode = -1};

while{dialog} do {
	closedialog 0;
};

switch(_mode) do {
	case 0: {
		[] call life_fnc_tablet;
	};

	case 1: {
		[] call life_fnc_inventory;
	};
	
	case 2: {
		[0] call life_fnc_phone; 
	};
	
	default {};
};