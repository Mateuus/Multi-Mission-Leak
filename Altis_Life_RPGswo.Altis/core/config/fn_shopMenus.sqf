/*
	File: fn_shopMenus.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config for a thing that will be gone eventually..
*/
private["_shop"];
_shop = param [0,"",[""]];
if(_shop == "") exitWith {closeDialog 0;};

if(!dialog) then
{
	if(!(createDialog "shop_menu")) exitWith {};
};
disableSerialization;
ctrlSetText[601,format["Geld: %1€",[dwf_cash] call DWEV_fnc_numberText]];

switch (_shop) do
{
	case "reb":
	{
		ctrlSetText[2505,"Altis Rebellen Laden"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "cop":
	{
		ctrlSetText[2505,"Ausrüstung I"];
		ctrlShow[2503,false];
	};
	
	case "gun":
	{
		ctrlSetText[2505,"Waffengeschäft"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "gang":
	{
		ctrlSetText[2505,"Gang Laden"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "dive":
	{
		ctrlSetText[2505,"Tauchausrüstung"];
		ctrlShow[2503,false];
		ctrlShow[2510,false];
		ctrlShow[2511,false];
		ctrlShow[2513,false];
	};
	
	case "donator":
	{
		ctrlSetText[2505,"Donator Shop"];
	};
	
	case "sergeant":
	{
		ctrlSetText[2505,"Ausrüstung III"];
		ctrlShow[2503,false];
	};
	
	case "gen":
	{
		ctrlSetText[2505,"Gemischtwarenhändler"];
		ctrlShow[2503,false];
	};
	
	case "officer":
	{
		ctrlSetText[2505,"Ausrüstung II"];
		ctrlShow[2503,false];
	};
	
	case "admin":
	{
		ctrlSetText[2505,"Admin Shop"];
	};
};

["guns"] call DWEV_fnc_shops_changeMenu;