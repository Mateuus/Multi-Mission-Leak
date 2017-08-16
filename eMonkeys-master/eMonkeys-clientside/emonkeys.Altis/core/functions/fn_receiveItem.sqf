/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receive an item from a player.
*/
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if(_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;

if(_diff != (parseNumber _val)) then
{
	if(([true,_item,_diff] call EMonkeys_fnc_handleInv)) then
	{
		hint format["%1 gab dir %2 Du kannst aber nur %3 nehmen und gibst %4 zurück.",_from getVariable["realname",name _from],_val,_diff,((parseNumber _val) - _diff)];
		[[_from,_item,str((parseNumber _val) - _diff),_unit],"EMonkeys_fnc_giveDiff",_from,false] call EMonkeys_fnc_mp;
		
		_text = format ["*** Item geben | SpielerID Empfänger: %1 | Name Empfänger: %2 | SpielerID: %3 | Name: %4 | Item: %5 | Anzahl: %6 |",getPlayerUID player,name player,getPlayerUID _from ,name _from,_item,_diff];
		[[2,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	}
		else
	{
		[[_from,_item,_val,_unit,false],"EMonkeys_fnc_giveDiff",_from,false] call EMonkeys_fnc_mp;
	};
}
	else
{
	if(([true,_item,(parseNumber _val)] call EMonkeys_fnc_handleInv)) then
	{
		private["_type"];
		_type = [_item,0] call EMonkeys_fnc_varHandle;
		_type = [_type] call EMonkeys_fnc_varToStr;
		hint format["%1 gab dir %2 %3",_from getVariable["realname",name _from],_val,_type];
		_text = format ["*** Item geben | SpielerID Empfänger: %1 | Name Empfänger: %2 | SpielerID: %3 | Name: %4 | Item: %5 | Anzahl: %6 |",getPlayerUID player,name player,getPlayerUID _from ,name _from,_type,_val];
		[[2,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	}
		else
	{
		[[_from,_item,_val,_unit,false],"EMonkeys_fnc_giveDiff",_from,false] call EMonkeys_fnc_mp;
	};
};