/*
fn_obligeOffer.sqf
Kevin Webb
We've decided we like his offer and want to oblige it.
Copyright © 2015 Kevin Webb, All rights reserved
Written for Asylum Entertainment ™
*/
private["_exit"];
if(lbCurSel 2802 == -1) exitWith {hint "You did not select anything"};
_id = lbValue[2802,(lbCurSel 2802)];
_dataArr = lbData[2802,(lbCurSel 2802)];
_dataArr = call compile format["%1",_dataArr];
_price = _dataArr select 1;
_buySell = _dataArr select 2;
_className = _dataArr select 3;
_type = _dataArr select 4;
_amount = _dataArr select 5;
_vehicleID = _dataArr select 6;
_exit = false;
if(_buySell == 0) then {
	if(life_atmmoney < _price) exitWith {hint "You don't seem to have enough money to meet his/her asking price!"; _exit = true};
	if(_type == "Virtual" && (_price * _amount) > life_atmmoney) exitWith {"You don't seem to have enough money to meet his/her asking price!"; _exit = true};
} else {
	//So we are trying to oblige a buy offer. Do we even have the item requested???
	if(_type == "Virtual") then {
		if((call compile _className) == 0) exitWith {hint "You don't have any of this item on your person to sell"; _exit = true};
	};
	if(_type == "Weapon" && primaryWeapon player != _className) exitWith {hint "To sell a weapon to someone, you must be holding it in your hands."; _exit = true};
	if(_type == "Vehicle") exitWith {hint "To oblige someone's vehicle buy offer, You will need to manually make a matching offer from your garage."; _exit = true};
};
if(_exit) exitWith {};
//Now... Let's figure out what the hell we are even trying to do here.
if(_buySell == 0) exitWith {
	_message = format["Are you sure you want to create a matching buy offer? The current price is set at $%1%2",_price,if(_type == "Virtual") then {" per unit"} else {""}];
	_action = [
		_message,
		"Creating matching buy offer",
		"Yes",
		"No"
	] call BIS_fnc_GUIMessage;
	if(!_action) exitWith {};
	_exit = false;
	if(_type == "Virtual") then {
		hint format["Please enter the amount of the product you wish to buy. The price is set at $%1 per unit",_price];
		createDialog "STS_KBW_price_diag";
		waitUntil{!isNull (findDisplay 13371)};
		ctrlSetText[2651,"Type Amount to Buy"];
		waitUntil{isNull (findDisplay 13371) || life_priced};
		if(!(life_priced)) exitWith {_exit = true};
		life_priced = false;
		_amount = ctrlText 7331;
		if(!([_amount] call life_fnc_isNumber)) exitWith {hint "You didn't enter an actual number."; closeDialog 0; _exit = true};
		_amount = parseNumber _amount;
		if(_amount <= 0) exitWith {hint "Invalid Number"; closeDialog 0; _exit = true};
		closeDialog 0;
		if(life_atmmoney < (_price * _amount)) exitWith {hint "You didn't have enough money to buy that many of this item"; _exit = true};
		["atm","take",_price * _amount] call life_fnc_uC;
	} else {
		["atm","take",_price] call life_fnc_uC;
	};
	if(_exit) exitWith {};
	[[4,_className,_type,_amount,_price,player],"KBW_fnc_listing",false] call life_fnc_MP; //Make it easy and use the existing  buy offer function to get us our product
	closeDialog 0;
};
//Made it thus far, indicating it's a buy offer.
switch(_type) do {
	case "Weapon": {
		[[1,[primaryWeapon player,primaryWeaponItems player],_price,player],"KBW_fnc_listing",false] call life_fnc_MP;
		player removeWeapon (primaryWeapon player);
	};
	case "Virtual": {
		_var = [_className,1] call life_fnc_varHandle;
		_amount = call compile _className;
		if([false,_var,_amount] call life_fnc_handleInv) then {
			[[2,_className,_price,_amount,player],"KBW_fnc_listing",false] call life_fnc_MP;
		};
	};
};
closeDialog 0;