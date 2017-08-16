private["_respondmode"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;

if (_respondmode==1) then {
	hint "Du hast dein Geld zurück bekommen";
    EMonkeys_c164 = EMonkeys_c164 + 30000;
	
};

if (_respondmode==2) then {
_geld = [_this,1,0,[0]] call BIS_fnc_param;
 EMonkeys_c164 = EMonkeys_c164 + _geld;
 hint format ["Du hast %1€ im Lotto Gewonnen!",[_geld] call EMonkeys_fnc_numberText];
};

if (_respondmode==3) then {
_message = [_this,1,"",[""]] call BIS_fnc_param;
hint format ["%1",_message];
};