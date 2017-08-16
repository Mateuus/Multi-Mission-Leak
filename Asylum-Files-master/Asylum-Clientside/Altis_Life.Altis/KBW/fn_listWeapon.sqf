/*
fn_listWeapon.sqf
Kevin Webb
Description: Allows for the "listing" of your weapon on the exchange.
Copyright © 2015 Kevin Webb, All rights reserved
	Written for Asylum Entertainment ™
*/
if(life_offers > 9) exitWith {hint "You may only have up to 10 sell offers at a time."};
if(currentWeapon player in ["","Binocular","Rangefinder"]) exitWith {hint "In order to list a weapon, you must have it within your hands."};
hint "Attempting to list the weapon in your hands currently; please enter the asking price.";
createDialog "STS_KBW_price_diag";
waitUntil{!isNull (findDisplay 13371)};
waitUntil{isNull (findDisplay 13371) || life_priced};
if(!(life_priced)) exitWith {};
life_priced = false;
_price = ctrlText 7331;
if(!([_price] call life_fnc_isNumber)) exitWith {hint "You didn't enter an actual number."; closeDialog 0;};
_price = parseNumber _price;
if(_price < 0) exitWith {hint "Invalid Number"; closeDialog 0;};
if(_price > 75000) exitWith {hint "That price isn't appropriate for the exchange"; closeDialog 0;};
_fee = round(_price * 0.05);
if(life_atmmoney < _fee) exitWith {hint "It seems you don't have enough to pay the 5% listing fee"};
_attach = if(currentWeapon player == primaryWeapon player) then {primaryWeaponItems player} else {handgunItems player};
[[1,[currentWeapon player,_attach],_price,player],"KBW_fnc_listing",false] call life_fnc_MP;
[[801, player, format["Listed %1 on the Exchange.", currentWeapon Player]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
player removeWeapon (currentWeapon player);
["atm","take",_fee] call life_fnc_uC;
closeDialog 0;
hint format["Your weapon has been inserted into the exchange. You have been assessed a fee of $%1. This fee is refunded if your offer sells successfully within 3 days.",_fee];;