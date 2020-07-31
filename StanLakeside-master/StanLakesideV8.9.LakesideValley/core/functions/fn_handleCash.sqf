/*
handleCash.sqf
Modular cash manipulation, takes 3 params
index 0: "cash" or "bank"
index 1: "add", "take", or "set"
index 2: amount (number)
*/
params [["_type", "", [""]], ["_modify", "", [""]], ["_amount", 0, [0]]];

_amount = round(_amount);
if(_modify == "set") exitWith {
	if(_type == "cash") exitWith {
		cash_in_hand = _amount;
		player setVariable["cash",cash_in_hand,true];
	};
	cash_in_bank = _amount;
	player setVariable["bank",cash_in_bank,true];
};
if(_modify == "take") then {_amount = _amount * -1};
switch(_type) do {
	case "cash": {
		cash_in_hand = cash_in_hand + _amount; 
		player setVariable["cash",cash_in_hand,true];
	};
	case "bank": {
		cash_in_bank = cash_in_bank + _amount; 
		player setVariable["bank",cash_in_bank,true];
	};
};