/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Place your bid to the server
*/
private ["_value","_careful"];

_value = ctrlText 1401;
_careful = false;
//if(!([parseNumber _value] call DS_fnc_isNumber)) exitWith {hint "Invalid input"};
if((parseNumber _value) < 1) exitWith {hint "You can not bid less than $1";closeDialog 0;};
if([(parseNumber _value),true] call DS_fnc_checkMoney) exitWith {hint "You do not have enough money in your bank to place this bid";closeDialog 0;};
if((parseNumber _value) <= (DS_auctionPrice + 9999))exitwith {hint format ["Bid failed, the lowest bid you can make is $%1",[(DS_auctionPrice + 10000)] call DS_fnc_numberText];closeDialog 0;};
if(!DS_canBid)exitwith{hint "You missed your chance to place your bid";closeDialog 0;};

_careful = [
	format ["Your bidding $%1, is this your intent?",[(parseNumber _value)] call DS_fnc_numberText],
	"Just Incase",
	"Bid",
	"No Thanks"
	] call BIS_fnc_guiMessage;
if(!_careful)exitwith{hint "Bid cancelled";closeDialog 0;};

[[(parseNumber _value),player],"HUNT_fnc_placeBidServer",false,false] spawn BIS_fnc_MP;
closeDialog 0;
hint "Bid Placed, please wait.....";