/*
	File: fn_shopMenus.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config for a thing that will be gone eventually..
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0;};

if(!dialog) then
{
	if(!(createDialog "shop_menu")) exitWith {};
};
disableSerialization;
ctrlSetText[601,format["Cash: $%1",[life_money] call life_fnc_numberText]];

switch (_shop) do
{
	case "reb":
	{
		ctrlSetText[2505,format["%1 Rebel Shop", worldName]];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "cop":
	{
		ctrlSetText[2505,format["%1 Cop Shop", worldName]];
		ctrlShow[2503,false];
	};
	
	case "gun":
	{
		ctrlSetText[2505,format["%1 Gun Store", worldName]];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "gang":
	{
		ctrlSetText[2505,"Gang Shop"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};
	
	case "dive":
	{
		ctrlSetText[2505,format["%1 Diving Shop", worldName]];
		ctrlShow[2503,false];
		ctrlShow[2510,false];
		ctrlShow[2511,false];
		ctrlShow[2513,false];
	};
	
	case "copdive":
	{
		ctrlSetText[2505,format["%1 Diving Shop", worldName]];
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
		ctrlSetText[2505,"Sergeants Shop"];
		ctrlShow[2503,false];
	};
	
	case "gen":
	{
		ctrlSetText[2505,format["%1 General Store", worldName]];
		ctrlShow[2503,false];
	};
	
	case "officer":
	{
		ctrlSetText[2505,"Patrol Officer Shop"];
		ctrlShow[2503,false];
	};
	
	case "admin":
	{
		ctrlSetText[2505,"Admin Shop"];
	};
};

["guns"] call life_fnc_shops_changeMenu;