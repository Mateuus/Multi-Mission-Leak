if(isnil "drehen") then {drehen = 2}; 

_mode = _this select 0;

switch(_mode) do {
	case 0: {
		switch(drehen) do {
			case 1: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [8,8,1]); drehen = drehen + 1;}; 
			case 2: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [-8,8,1]); drehen = drehen + 1;}; 
			case 3: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [-8,-8,1]); drehen = drehen + 1;};
			case 4: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [8,-8,1]); drehen = 1};
		};
	};

	case 1: {
		switch(drehen) do {
			case 1: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [8,8,1]); drehen = drehen + 1;}; 
			case 2: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [8,-8,1]); drehen = drehen + 1;}; 
			case 3: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [-8,-8,1]); drehen = drehen + 1;};
			case 4: {life_vehshop_cam camSetPos (veh_shop_vehicle modelToWorld [-8,8,1]); drehen = 1};
		};
	};
};

life_vehshop_cam camCommit 0;