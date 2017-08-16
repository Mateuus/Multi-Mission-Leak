/*
fn_buyTicket.sqf
Authors: Kevin Webb & Mike McCrow
Description: Client portion of lottery system
*/
[] spawn {
If (argent_liquide < 500) exitWith {Hint format["Le ticket de ce super Loto coute 500€. Il vous manque %1€ pour en acheter un !",[(500 - argent_liquide)] call life_fnc_numberText]};
_Entry = [];
createDialog "STS_KBW_price_diag";
waitUntil{!isNull (findDisplay 13371)};
ctrlSetText[2651,"Combien de ticket (500€ piece) ?"];
waitUntil{isNull (findDisplay 13371) || life_charged};
if(!(life_charged)) exitWith {};
life_charged = false;
_amount = ctrlText 7331;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Vous n'avez pas choissit la quantité."; closeDialog 0;};
_amount = parseNumber (_amount);
if(_amount <= 0) exitWith { hint "Nombre invalide"; closeDialog 0; };
if(_amount > 250) exitWith { hint "Vous ne pouvez pas acheter plus de 250 tickets à la fois !"; closeDialog 0; };
_price = 500 * _amount;
if(argent_liquide < _price) exitWith { hint "Vous n'avez pas assez de liquide!"; closeDialog 0;};
//["cash","take",_price] call life_fnc_handlePaper;
argent_liquide = argent_liquide - _price;
_uid = getPlayerUID player;
_Entry = [_uid,_amount];
Hint format["Vous avez acheter %1 tickets du super Loto pour %2€, bonne chance !",_amount,[_price] call life_fnc_numberText];
[_Entry] remoteExec ["TON_fnc_manageLottery",2];
closeDialog 0;
};