private["_display","_vehiclelist","_range","_houselist"];
disableSerialization;

_mode = _this select 0;

_display = finddisplay 2700;
_vehiclelist = _display displayCtrl 2701;
_houselist = _display displayCtrl 2705;
_range = _display displayCtrl 2706;

switch(_mode) do {
	case "vehicle": {
		_vehicleArray = []; 
		{
			if(!(_x isKindOf "House") && alive _x) then {_vehicleArray pushback _x}; 
		} foreach life_vehicles;

		_range ctrlSetText format["%1m entfernt",round((_vehicleArray select (lbCurSel _vehiclelist)) distance player)];
	};

	case "house": {
		_houseArray = []; 
		{
			if(_x isKindOf "House") then {_houseArray pushback _x}; 
		} foreach life_vehicles;

		_range ctrlSetText format["%1m entfernt",round((_houseArray select (lbCurSel _houselist)) distance player)];
	};
};