/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/
_mode = _this select 0;
_itemArray = param [1,[],[[]]];
if(isNil "DYNAMICMARKET_boughtItems") then {DYNAMICMARKET_boughtItems = [];};

switch (_mode) do {
	case 0: {
		[DYNAMICMARKET_boughtItems] remoteExec ["TON_fnc_getUpdate",2];
		DYNAMICMARKET_boughtItems = [];
	};
	case 1: {
		_needToUpdate = false;
		if (!isNil "DYNMARKET_prices") then {DYNMARKET_pricesOld = DYNMARKET_prices;} else {_needToUpdate=true;};
		sell_array = _itemArray;
		DYNMARKET_prices = _itemArray;
		if(_needToUpdate) then {DYNMARKET_pricesOld = DYNMARKET_prices;};
	};
};
