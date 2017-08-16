private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {hint "Ne peut pas ouvrir cette interface"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format["Ticket %1",_unit getVariable["realname",name _unit]]];
life_ticket_unit = _unit;