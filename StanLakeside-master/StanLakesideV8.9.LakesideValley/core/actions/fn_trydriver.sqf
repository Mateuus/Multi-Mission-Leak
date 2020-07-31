_passenger = param [0,false,[false]];

if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then {
	_curTarget = cursortarget;
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air") OR (_curTarget isKindOf "Bicycle") OR (_curTarget isKindOf "Motorbike") OR (_curTarget isKindOf "Motorcycle") OR (_curTarget isKindOf "A3L_Tahoe_Base")) then {true} else {false};
	if(_isVehicle) then {
		if(_passenger) then {
			player action ["getInCargo", _curTarget];
		} else {
			player action ["getInDriver", _curTarget];
		};
 	};
};