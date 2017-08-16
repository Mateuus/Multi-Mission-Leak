#include "..\..\script_macros.hpp"
private["_unit","_lizenz","_display","_arrested","_wanted","_Btn1","_Btn2","_text","_list"];
_unit = _this select 0;
_lizenz = _this select 1;
_arrested = _this select 2;
_wanted = _this select 3;

createdialog "life_polizei1computer";
disableSerialization;
_list = CONTROL(6000,6012);

switch (_lizenz) do
{
	case 0:{_text = "/";};
	case 1:{_text= "PKW";};
	case 2:{_text= "LKW";};
	case 3:{_text= "PKW, LKW";};
	case 4:{_text= "Pilot";};
	case 5:{_text= "PKW, Pilot";};
	case 6:{_text= "LKW, Pilot";};
	case 7:{_text= "PKW, LKW, Pilot";};
};

_arrested = if(_this select 2) then {"In gewahrsam"} else {"Frei"};
_wanted = if(_this select 3) then {"Wird gesucht"} else {"Wird nicht gesucht"};

CONTROL(6000,6001) ctrlSetStructuredText parseText format["<t font='EtelkaNarrowMediumPro' size='0.85' align='center'>%1</t>",_unit GVAR ["realname",name _unit]];
CONTROL(6000,6002) ctrlSetStructuredText parseText format["<t font='EtelkaNarrowMediumPro' size='0.85' align='center'>%1</t>",_text];
CONTROL(6000,6003) ctrlSetStructuredText parseText format["<t font='EtelkaNarrowMediumPro' size='0.85' align='center'>%1</t>",_arrested];
CONTROL(6000,6004) ctrlSetStructuredText parseText format["<t font='EtelkaNarrowMediumPro' size='0.85' align='center'>%1</t>",_wanted];


lbClear _list;
_display = findDisplay 6000;
_Btn1 = _display displayCtrl 6010;
_Btn1 ctrlEnable false;
_Btn1 = _display displayCtrl 6014;
_Btn1 ctrlEnable false;

_strafliste1 = [];
while {true} do 
{	
	_strafliste = straftat GVAR [life_computergesucht,[]];
	
	if(count _strafliste != 0 && !(_strafliste isequalto _strafliste1)) then
	{
	lbClear _list;
		{
			_id = _x select 0;
			_array = _x select 1;	
			_uhrzeit = _array select 0; 
			_minuten = _uhrzeit select 1;
			_stunden = _uhrzeit select 0;
			_datum = _array select 1;
			_grund = _array select 2;		
			_list lbAdd format["%1:%2 - %3 %4",_stunden,_minuten,_datum select 0 ,_grund select 0]; 
			_list lbSetdata [(lbSize _list)-1,str(_id)];
			_list lbSetValue [(lbSize _list)-1,_id];
		} foreach _strafliste;
		_strafliste1 = _strafliste;
	};
	if(count _strafliste == 0) then {lbClear _list;};
	CONTROL(6000,6005) ctrlSetStructuredText parseText format ["<t font='EtelkaNarrowMediumPro' size='0.5' align='center'>%1:%2<br/>%3.%4.%5</t>",life_zeit select 0,life_zeit select 1,life_zeit select 2,life_zeit select 3,life_zeit select 4];
	sleep 1;
	if (isNull (findDisplay 6000)) exitwith {};
};
