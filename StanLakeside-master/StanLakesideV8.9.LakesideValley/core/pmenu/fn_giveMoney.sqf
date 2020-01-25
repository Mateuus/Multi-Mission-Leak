/*
	File: fn_giveMoney.sqf
	
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) isEqualTo -1) exitWith {["Nikogo nie wybrales!", false] spawn domsg;ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit isEqualTo player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(player getVariable["restrained",false] || player getVariable["tied",false]) exitWith {["Jakbys komus cos przekazal miejac rece za plecami?", false] spawn domsg; closedialog 0;};

//A series of checks *ugh*
if(!life_use_atm) exitWith {["Nie dawno rabowales bank! Nie mozesz tego zrobic!", false] spawn domsg;ctrlShow[2001,true];};
if(!([_amount] call fnc_isnumber)) exitWith {["Nie wpisales liczby.", false] spawn domsg;ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {["Wpisz poprawna liczbe.", false] spawn domsg;ctrlShow[2001,true];};
if(parseNumber(_amount) > cash_in_hand) exitWith {["Nie masz tylu pieniedzy przy sobie!", false] spawn domsg;ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; ["Wybrany gracz nie jest w zasiegu", false] spawn domsg;};
[format["You gave $%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]], false] spawn doquickmsg;

["cash","take",(parseNumber(_amount))] call life_fnc_handleCash;
[_unit,(parseNumber(_amount)),player,name _unit] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];