/*
	File: fn_sellHouse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sell a house and initiates DB removal
*/
private["_house", "_buildingID", "_buildingName", "_val", "_bankSale", "_uid", "_price"];

_bankSale = [_this,0,true,[true]] call BIS_fnc_param;
_house = life_menu_house;

if (player distance _house > 20) exitWith {};
if (!(_house isKindOf "House")) exitWith {};

_uid = getPlayerUID player;
_price = [typeOf _house] call life_fnc_housePrice;
_buildingID = [_house] call life_fnc_getBuildID;
_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
_price = _price * 0.75; // 75% of buy price for sale

if (!(_house in life_houses)) exitWith {hint "You do not own this property!";};

if (_bankSale) then
{
	["atm","add",_price] call life_fnc_uC;
	titleText[format["You have sold %1 for $%2!", _buildingName, [_price] call life_fnc_numberText],"PLAIN"];
	life_houses = life_houses - [_house];
	[[_buildingID, _house],"DB_fnc_deleteHouse",false,false] spawn life_fnc_MP;
	[[_buildingID],"life_fnc_gangDisbanded",civilian,false] spawn life_fnc_MP;
	[[598, player, format["%1 sold house %2 for $%3", profileName, _buildingID, _price]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
}
else
{
	_val = parseNumber(ctrlText 7702);
	if(_val > 999999) exitWith {hint "You can't list for more then $999,999";};
	if(_val < 0) exitwith {};
	if(!([str(_val)] call life_fnc_isnumber)) exitWith {hint "Enter only numbers, no other characters, for the list price."};
	titleText[format["You have listed %1 on the market for $%2!", _buildingName, [_val] call life_fnc_numberText],"PLAIN"];
	[[_buildingID, _house, _val],"KBW_fnc_listHouse",false,false] spawn life_fnc_MP;
	life_forSaleHouses pushBack getpos _house;
	publicVariable "life_forSaleHouses";
	_house setVariable["salePrice",_val,true];
	[[_buildingID],"life_fnc_gangDisbanded",civilian,false] spawn life_fnc_MP;
	[[599, player, format["%1 listed house %2 for $%3", profileName, _buildingID, _val]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
};

closeDialog 0;
closeDialog 0;