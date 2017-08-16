/*
	Darkside Life

	Author:

	Description:
	Returns the DLC associated with a given config
*/

params [["_config",configNull,[configNull]]];

private _dlc = "";
private _addons = configSourceAddonList _config;

if(!(_addons isEqualTo []))then {
    private _mods = configSourceModList (configFile >> "CfgPatches" >> (_addons select 0));
    if (!(_mods isEqualTo []))then{_dlc = _mods select 0;};
};

_dlc