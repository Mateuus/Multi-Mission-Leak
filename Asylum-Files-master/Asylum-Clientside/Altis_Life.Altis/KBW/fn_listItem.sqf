/*
fn_listItem.sqf
Kevin Webb
Allows for the listing of the things we refer to as virtual items...
Copyright © 2015 Kevin Webb, All rights reserved
Written for Asylum Entertainment ™
*/
if(life_offers > 9) exitWith {hint "You may only have up to 10 sell offers at a time."};
_available = [];
_accepted =
[
	"life_inv_barley",
	"life_inv_blindfold",
	"life_inv_boltCutter",
	"life_inv_copperr",
	"life_inv_copperore",
	"life_inv_corn",
	"life_inv_meth",
	"life_inv_demoCharge",
	"life_inv_diamond",
	"life_inv_diamondr",
	"life_inv_diamondf",
	"life_inv_drill",
	"life_inv_ephedrau",
	"life_inv_airalarm",
	"life_inv_hydro",
	"life_inv_ironr",
	"life_inv_ironore",
	"life_inv_lockpick",
	"life_inv_nitro",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_phos",
	"life_inv_rubber",
	"life_inv_rye",
	"life_inv_salt",
	"life_inv_speedbomb",
	"life_inv_tracker",
	"life_inv_turtle",
	"life_inv_coke",
	"life_inv_vammo",
	"life_inv_caralarm",
	"life_inv_ziptie"
];

{
	_amount = call compile _x;
	if(_amount > 0) then {_available pushBack _x};
} forEach _accepted;
if(count _available == 0) exitWith {hint "You don't seem to have any of the resources which can be listed on the market."};
_toSell = "";
if(count _available > 1) then {
	{
		//Yes, I do have an obsession with BIS_fnc_guiMessage, deal with it...
		_action = [
		format["It seems you have more than one type of resource which can be sold. Do you wish to sell your %1?",[_x] call life_fnc_varToStr],
		"Selling Resources",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(_action) exitWith {_toSell = _x};
	} forEach _available; //I'm also obsessed with forEach loops. Fuck you, "for loop" lovers.
} else {
	_toSell = _available select 0;
};
if(_toSell == "") exitWith {hint "It seems you didn't select one of your resources!"};
hint "Please enter the amount you would like to receive PER UNIT of the resource that you are carrying";
createDialog "STS_KBW_price_diag";
waitUntil{!isNull (findDisplay 13371)};
waitUntil{isNull (findDisplay 13371) || life_priced};
if(!(life_priced)) exitWith {};
life_priced = false;
_price = ctrlText 7331;
if(!([_price] call life_fnc_isNumber)) exitWith {hint "You didn't enter an actual number."; closeDialog 0;};
_price = parseNumber _price;
if(_price < 0) exitWith {hint "Invalid Number"; closeDialog 0;};
if(_price > 10000) exitWith {hint "That price isn't appropriate for the exchange"; closeDialog 0;};
_var = [_toSell,1] call life_fnc_varHandle;
_amount = call compile _toSell;
_fee = round(_amount * (_price * 0.05));
if(life_atmmoney < _fee) exitWith {hint "It seems you do not have enough funds to cover the 5% listing fee."};
if([false,_var,_amount] call life_fnc_handleInv) then {
	["atm","take",_fee] call life_fnc_uC;
	[[2,_toSell,_price,_amount,player],"KBW_fnc_listing",false] call life_fnc_MP;
	[[801, player, format["Listed %1 %2 on the Exchange for %3 per unit.", _amount, _toSell, _price]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	hint format["Your resources have been inserted into the exchange; you have been assessed a listing fee of $%1 which will be refunded if your items sell successfully within 3 days",_fee];
};
closeDialog 0;