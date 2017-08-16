/*
*
* void houseExecCommand [STRING COMMAND, ARGUMENTS, SQL]
* Executes COMMAND (switch case)
*/

private["_cmd", "_house", "_args", "_data"];

_cmd = _this select 0;
_house = _this select 1;
_args = _this select 2;
_data = _this select 3;

//hintSilent format["Successful input cmd: %1", _cmd];
hintSilent "Abfrage von Datenbank wurde beantwortet.";

//uisleep 2;

switch (_cmd) do
{
	case "EMonkeys_fnc_execHouseMenu":
	{
		hintSilent "Gehe ins Hausmenü";
		[_house, _args, _data] call EMonkeys_fnc_execHouseMenu;
	};
	case "EMonkeys_fnc_execBuyHouse":
	{
		[_house, _args, _data] call EMonkeys_fnc_execBuyHouse;
	};
	case "EMonkeys_fnc_execSellHouse":
	{
		[_house, _args, _data] call EMonkeys_fnc_execSellHouse;
	};
	case "EMonkeys_fnc_execHouseSleep":
	{
		[_house, _args, _data] call EMonkeys_fnc_execHouseSleep;
	};
	case "EMonkeys_fnc_execHouseInventory":
	{
		[_house, _args, _data] call EMonkeys_fnc_execHouseInventory;
	};
	case "EMonkeys_fnc_execHouseInventory_apply":
	{
		[_house, _args, _data] call EMonkeys_fnc_execHouseInventory_apply;
	};
	case "EMonkeys_fnc_execHouseSearch":
	{
		[_house, _args, _data] call EMonkeys_fnc_execHouseSearch;
	};
	case "EMonkeys_fnc_execHouseImpound":
	{
		[_house, _args, _data] call EMonkeys_fnc_execHouseImpound;
	};
	case "EMonkeys_fnc_execHouseUseFurniture":
	{
		[_house, _args, _data] call EMonkeys_fnc_execHouseUseFurniture;
	};
	//Key stuff
	case "EMonkeys_fnc_houseExecGiveKey":
	{
		[_house, _args, _data] call EMonkeys_fnc_houseExecGiveKey;
	};
	case "EMonkeys_fnc_houseExecResetKeys":
	{
		[_house, _args, _data] call EMonkeys_fnc_houseExecResetKeys;
	};
	case "EMonkeys_fnc_open_house_inventory":
	{
		[_house, _args, _data] call EMonkeys_fnc_open_house_inventory;
	};
	
	default
	{
		hint format ["ERR: houseExecCommand: %1 not found", _cmd];
	};
};