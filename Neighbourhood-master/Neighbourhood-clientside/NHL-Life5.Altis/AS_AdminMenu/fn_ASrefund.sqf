disableSerialization;
_dialog = findDisplay 16100;
_tochangePrice = _dialog displayCtrl 16101;
_tochangePriceText = ctrlText _tochangePrice;
_tochangePriceNumber = parseNumber _tochangePriceText;
if ((_tochangePriceText=="")) exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>INVALID INPUT</t>";};

[[2,_tochangePriceNumber],"life_fnc_ASreceiver",AS_toRefund,false] spawn life_fnc_mp;
hint format ["You have refunded %1 to player %2",_tochangePriceNumber,name AS_toRefund];
[] spawn life_fnc_openMenu;