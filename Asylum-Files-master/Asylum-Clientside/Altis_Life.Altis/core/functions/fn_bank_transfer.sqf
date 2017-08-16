if (life_corruptData) exitWith { hint "YOUR PLAYER DATA IS DAMAGED. You must log out to the lobby and rejoin. Your progress will not save until you do this. Most likely caused by a script-kiddie." };
private["_val","_unit","_tax"];
disableSerialization;
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "You need to select someone to transfer to"};
if(isNil "_unit") exitWith {hint "The player selected doesn't seem to exist?"};
if(_val > 999999) exitWith {hint "You can't transfer more then $999,999";};
if(_val < 31) exitWith {hint "You must transfer over $30"};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumber)) exitWith {hint "That isn't in an actual number format."};
if(_val > life_atmmoney) exitWith {hint "You don't have that much in your bank account!"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > life_atmmoney) exitWith {hint format["You do not have enough money in your bank account, to transfer $%1 you will need $%2 as a tax fee.",_val,_tax]};

//Confirm Menu
/* _handle = [format["Are you sure you wish to transfer $%1 to %2? ", [_val] call life_fnc_numberText, name _unit]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {hint "Cancelled Transfer";}; */

["atm","take",(_val + _tax)] call life_fnc_uC;

bank_addfunds = _tax;
publicVariableServer "bank_addfunds";
[[_val,name player],"life_fnc_clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
hint format["You have transferred $%1 to %2.\n\nA tax fee of $%3 was taken for the wire transfer.",[_val] call life_fnc_numberText,name _unit,[_tax] call life_fnc_numberText];
[[159, player, format["Transferred $%1 to %2 (%3) with tax fee of $%4", _val, name _unit, getPlayerUID _unit, _tax]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
//[] call life_fnc_sessionUpdate;