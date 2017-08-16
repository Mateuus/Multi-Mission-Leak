private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(compte_banque < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};
compte_banque = compte_banque - life_bail_amount;
life_bail_paid = true;
[[0,"STR_NOTF_Bail_Bailed",true,[profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;