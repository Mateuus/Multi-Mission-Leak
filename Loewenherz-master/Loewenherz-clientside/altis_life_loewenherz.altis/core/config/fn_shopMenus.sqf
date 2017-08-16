0/*
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
ctrlSetText[601,format["Cash: $%1",[lhm_cash] call lhm_fnc_numberText]];

switch (_shop) do
{
	case "reb":
	{
		ctrlSetText[2505,"Rebellen Dealer"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "cop":
	{
		ctrlSetText[2505,"Polizei-Equipment"];
		ctrlShow[2503,false];
	};

	case "gun":
	{
		ctrlSetText[2505,"Waffenhaendler"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "gang":
	{
		ctrlSetText[2505,"Gang Dealer"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "dive":
	{
		ctrlSetText[2505,"Tauchshop"];
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
		ctrlSetText[2505,"Warenhandel"];
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
	case "secstore":
	{
		ctrlSetText[2505,"Security-Equipment"];
		ctrlShow[2503,false];
	};
};

["guns"] call lhm_fnc_shops_changeMenu;
