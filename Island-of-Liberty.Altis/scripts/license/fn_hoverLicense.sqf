disableSerialization;
_display = finddisplay 11000;
_mode = _this select 0;

switch (_mode) do {
	case "car": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_Driver"), (localize "STR_Licensing_driver")]);
	};
	case "truck": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_Truck"), (localize "STR_Licensing_truck")]);
	};
	case "air": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_Pilot"), (localize "STR_Licensing_pilot")]);
	};
	case "gun": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_Firearm"), (localize "STR_Licensing_gun")]);
	};
	case "boat": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_Boat"), (localize "STR_Licensing_boat")]);
	};
	case "home": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_Home"), (localize "STR_Licensing_home")]);
	};
	case "cargo": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_cargo"), (localize "STR_License_CargoL")]);
	};
	case "jagd": {
		(_display displayCtrl 1100) ctrlSetStructuredText 
		(parseText format["<t color='#19B03D'>%1</t> - %2", (localize "STR_License_jagd"), (localize "STR_License_Jagde")]);
	};
};