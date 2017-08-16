disableSerialization;
_display = finddisplay 11000;
_mode = _this select 0;

LICENSER_POS_BACK = getpos player;

switch (_mode) do {
	case "car": {
		if (license_civ_driver) exitwith {};
		if (licenser_obj getVariable "car") exitwith {hint (localize "STR_Licensing_isin_use")};
		licenser_obj setvariable ["car", true, true];
		[["car", (getPlayerUID player), 120],"TON_fnc_licenseSchools",false,false] call life_fnc_MP;
		_price = (getNumber(missionConfigFile >> "Licenses" >> "driver" >> "price"));
		life_cash = life_cash - _price;
		closedialog 0;
		[] spawn life_fnc_carLicense;
	};
	case "truck": {
		if (license_civ_trucking) exitwith {};
		if (licenser_obj getVariable "truck") exitwith {hint (localize "STR_Licensing_isin_use")};
		licenser_obj setvariable ["truck", true, true];
		[["truck", (getPlayerUID player), 360],"TON_fnc_licenseSchools",false,false] call life_fnc_MP;
		_price = (getNumber(missionConfigFile >> "Licenses" >> "trucking" >> "price"));
		life_cash = life_cash - _price;
		closedialog 0;
		[] spawn life_fnc_truckLicense;
	};
	case "air": {
		if (license_civ_pilot) exitwith {};
		if (licenser_obj getVariable "air") exitwith {hint (localize "STR_Licensing_isin_use")};
		licenser_obj setvariable ["air", true, true];
		[["air", (getPlayerUID player), 480],"TON_fnc_licenseSchools",false,false] call life_fnc_MP;
		_price = (getNumber(missionConfigFile >> "Licenses" >> "pilot" >> "price"));
		life_cash = life_cash - _price;
		closedialog 0;
		[] spawn life_fnc_helicopter;
	};
	case "gun": {
		if (license_civ_gun) exitwith {};
		if (licenser_obj getVariable "gun") exitwith {hint (localize "STR_Licensing_isin_use")};
		licenser_obj setvariable ["gun", true, true];
		[["gun", (getPlayerUID player), 120],"TON_fnc_licenseSchools",false,false] call life_fnc_MP;
		_price = (getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"));
		life_cash = life_cash - _price;
		closedialog 0;
		[] spawn life_fnc_gunLicense;
	};
	case "boat": {
		if (license_civ_boat) exitwith {};
		if (licenser_obj getVariable "boat") exitwith {hint (localize "STR_Licensing_isin_use")};
		licenser_obj setvariable ["boat", true, true];
		[["boat", (getPlayerUID player), 360],"TON_fnc_licenseSchools",false,false] call life_fnc_MP;
		_price = (getNumber(missionConfigFile >> "Licenses" >> "boat" >> "price"));
		life_cash = life_cash - _price;
		closedialog 0;
		[] spawn life_fnc_boat;
	};
	case "home": {
		if (license_civ_home) exitwith {};
		_price = (getNumber(missionConfigFile >> "Licenses" >> "home" >> "price"));
		life_cash = life_cash - (_price);
		closedialog 0;
		hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Home"];
		license_civ_home = true;
	};
	case "cargo": {
		if (license_civ_cargo) exitwith {};
		_price = (getNumber(missionConfigFile >> "Licenses" >> "cargo" >> "price"));
		life_cash = life_cash - (_price);
		closedialog 0;
		hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_CargoL"];
		license_civ_cargo = true;
	};
	case "jagd": {
		if (license_civ_jagd) exitwith {};
		_price = (getNumber(missionConfigFile >> "Licenses" >> "jagd" >> "price"));
		life_cash = life_cash - (_price);
		closedialog 0;
		hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Jagde"];
		license_civ_jagd = true;
	};
};