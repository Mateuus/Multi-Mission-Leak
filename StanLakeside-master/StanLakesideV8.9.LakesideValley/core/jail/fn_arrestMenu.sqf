/*
	fn_arrestMenu.sqf
*/

createdialog "a3l_jail_menu";
private["_unit","_id"];
_unit = param [0,ObjNull,[ObjNull]];
personyouwanjail = _unit;
if(isNull _unit) exitWith {};
if(isNil "_unit") exitwith {}; 
if(!(_unit isKindOf "Man")) exitWith {}; 
if(!isPlayer _unit) exitWith {};
if((_unit getVariable ["life_is_arrested", false])) exitWith {["This person is already arrested!",20,"red"] spawn domsg;};
if(!(_unit getVariable ["restrained", false])) exitWith {["This person is not restrained!",20,"red"] spawn domsg;}; 
if(!((side _unit) in [civilian,independent,east])) exitWith {}; 
if(isNull _unit) exitWith {}; 

_display = findDisplay 5546;
_nameofperson = _display displayCtrl 2200;
_nametext = format ["%1",name _unit];
_nameofperson ctrlSetText _nametext;