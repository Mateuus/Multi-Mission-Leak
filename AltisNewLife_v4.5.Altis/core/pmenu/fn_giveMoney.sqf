private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Rien n'a été selectionné !";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Vous avez récemment volé la banque! Vous ne pouvez pas donner de l'argent pour l'instant.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Vous n'avez pas saisi un format de nombre correct.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Vous devez entrer un montant valide que vous voulez donner.";ctrlShow[2001,true];};
if(parseNumber(_amount) > argent_liquide) exitWith {hint "Vous n'avez pas grand-chose à donner!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "L'individu sélectionné est hors de portée";};
hint format["Vous avez donne %1€ a %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
argent_liquide = argent_liquide - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[[player, _unit, _amount, 1, compte_banque, argent_liquide],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; 
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];