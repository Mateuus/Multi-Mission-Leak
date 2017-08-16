if (isNull findDisplay 2900) then {
	if (!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

private ["_display", "_tags", "_side"];
_display = findDisplay 2900;
_tags = _display displayCtrl 2970;
_side = _display displayCtrl 2971;

if (isNil "GTA_tagsOn") then {
	GTA_sidechat = true;
	GTA_tagsOn = true;
};

if (GTA_tagsOn) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "[false] call GTA_fnc_nameTags; GTA_tagsOn = false; [] call life_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "[true] call GTA_fnc_nameTags; GTA_tagsOn = true; [] call life_fnc_settingsMenu;";
};

if (GTA_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
	_side buttonSetAction "1 enableChannel false; GTA_sidechat = false; [] call life_fnc_settingsMenu;";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
	_side buttonSetAction "1 enableChannel true; GTA_sidechat = true; [] call life_fnc_settingsMenu;";
};
