/*
	File: fn_giveItem.sqf
	
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) isEqualTo -1) exitWith {["Nikogo nie wybrales!", false] spawn domsg;ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) isEqualTo -1) exitWith {["Nie wybrales zadnego przedmiotu do dania!", false] spawn domsg;ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit isEqualTo player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};
if(player getVariable["restrained",false] || player getVariable["tied",false]) exitWith {["Jakbys komus cos przekazal, miejac rece za plecami?", false] spawn domsg; closedialog 0;};

//A series of checks *ugh*
if(!([_val] call fnc_isnumber)) exitWith {["Nie wpisales liczby.", false] spawn domsg;ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {["Wpisales zla liczbe.", false] spawn domsg;ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; ["Wybrany gracz nie jest w zasiegu", false] spawn domsg;};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {["Probujesz dac za duzo", false] spawn domsg;ctrlShow[2002,true];};
[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
[format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,_type], false] spawn domsg;
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];