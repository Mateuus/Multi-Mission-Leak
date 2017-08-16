_ok = createDialog "cris_license";
disableSerialization;
waitUntil {!isNull (findDisplay 11000)};
_display = findDisplay 11000;

_buttons = [2408,2409,2410];
(_display displayCtrl 1100) ctrlSetStructuredText
(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_intros"), (localize "STR_Licensing_infos")]);
	
{	
	ctrlEnable [_x, false];
	ctrlShow [_x, false];
}foreach _buttons;

if (license_civ_driver) then {
	ctrlEnable [2400, false];
	(_display displayCtrl 1101) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "driver" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1101) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1101) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2400, false];
	};
};

if (license_civ_trucking) then {
	ctrlEnable [2401, false];
	(_display displayCtrl 1102) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "trucking" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1102) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1102) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2401, false];
	};
};
if (license_civ_boat) then {
	ctrlEnable [2402, false];
	(_display displayCtrl 1103) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "boat" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1103) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1103) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2402, false];
	};
};
if (license_civ_pilot) then {
	ctrlEnable [2403, false];
	(_display displayCtrl 1104) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "pilot" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1104) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1104) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2403, false];
	};
};
if (license_civ_gun) then {
	ctrlEnable [2404, false];
	(_display displayCtrl 1105) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1105) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1105) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2404, false];
	};
};
if (license_civ_home) then {
	ctrlEnable [2405, false];
	(_display displayCtrl 1106) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "home" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1106) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1106) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2405, false];
	};
};
if (license_civ_cargo) then {
	ctrlEnable [2406, false];
	(_display displayCtrl 1107) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "cargo" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1107) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1107) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2406, false];
	};
};
if (license_civ_jagd) then {
	ctrlEnable [2407, false];
	(_display displayCtrl 1108) ctrlSetStructuredText (parseText format["%1", (localize "STR_Licensing_got_it")]);
} else {
	_price = (getNumber(missionConfigFile >> "Licenses" >> "jagd" >> "price"));
	if (_price <= life_cash) then {
		(_display displayCtrl 1108) ctrlSetStructuredText (parseText format["<t color='#19B03D'>%1$ </t>", _price]);
	} else {
		(_display displayCtrl 1108) ctrlSetStructuredText (parseText format["<t color='#CA0000'>%1$ </t>", _price]);
		ctrlEnable [2407, false];
	};
};
