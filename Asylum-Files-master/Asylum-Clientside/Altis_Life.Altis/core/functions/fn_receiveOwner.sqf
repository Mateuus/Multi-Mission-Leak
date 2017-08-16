/*
	File: fn_receiveOwner.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Received home owner ID from server.
*/

private["_id","_unit","_owner","_price","_sale"];

_id = [_this,0,0,[0]] call BIS_fnc_param;
_owner = [_this,1,"",[""]] call BIS_fnc_param;
_sale = [_this,2,0,[0]] call BIS_fnc_param;

if (isNull (findDisplay 12500)) exitWith {};

_price = [typeOf life_menu_house] call life_fnc_housePrice;

if ((getPlayerUID player) == _owner) then
{
	_price = _price * 0.75;	// Sell price is 3/4 full cost
	ctrlSetText[12504,format["You are the current owner of this house."]];
	if (_sale > 0) then
	{
		ctrlSetText[12508,format["Listed price: $%1",[_sale] call life_fnc_numberText]];
	}
	else
	{
		ctrlSetText[12508,format["Market value: $%1",[_price] call life_fnc_numberText]];
	};
	ctrlShow[12512,false];
	ctrlShow[12516,true];
	ctrlShow[12518,true];
}
else
{
	ctrlShow[12516,false];
	
	if (_owner != "") then
	{
		if (_sale > 0) then
		{
			life_menu_house setVariable ["salePrice", _sale, true];
			life_menu_house setVariable ["saleOwner", _owner, true];
			ctrlSetText[12504,format["This property is for sale by owner!"]];
			ctrlSetText[12508,format["Listed price: $%1",[_sale] call life_fnc_numberText]];
			ctrlShow[12512,true];
		}
		else
		{
			ctrlSetText[12504,format["This property is already owned."]];
			ctrlSetText[12508,format["Property value: $%1",[_price] call life_fnc_numberText]];
			ctrlShow[12512,false];
		};
		
		ctrlShow[12516,false];
		ctrlShow[12518,false];
	}
	else
	{
		ctrlSetText[12504,format["This property is on the market!"]];
		ctrlSetText[12508,format["Property value: $%1",[_price] call life_fnc_numberText]];
		ctrlShow[12512,true];
		ctrlShow[12516,false];
		ctrlShow[12518,false];
	};
};

if ((life_menu_house getVariable['life_houseId',-1]) > -1) then { ctrlShow[12518, false]; };