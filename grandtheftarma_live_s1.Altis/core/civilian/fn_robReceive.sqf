private "_cash";
_cash = [ _this, 0, 0, [0] ] call GTA_fnc_param;
if ( _cash == 0 ) exitWith { titleText [ localize "STR_Civ_RobFail", "PLAIN" ] };

GTA_money_cash = GTA_money_cash + _cash;
titleText [ format [ localize "STR_Civ_Robbed", [ _cash ] call life_fnc_numberText ], "PLAIN" ];

//--- Update cash
[ 0 ] call GTA_fnc_updatePlayerPartial;