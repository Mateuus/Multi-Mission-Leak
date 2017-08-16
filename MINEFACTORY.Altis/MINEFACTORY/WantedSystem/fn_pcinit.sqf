#include "..\..\script_macros.hpp"
private["_list","_text","_display","_Btn1","_Btn2"];
disableSerialization;

waitUntil {!isNull (findDisplay 6025)};
_list = CONTROL(6025,6031);
lbClear _list;

{
	if (side _x != west) then 
	{
		_side = switch(side _x) do {case civilian: {"Zivilist"}; case independent: {"Sanitäter"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x GVAR ["realname",name _x],_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach playableUnits;

//6026  //zeit datum

_display = findDisplay 6025;
_Btn1 = _display displayCtrl 6030;
_Btn1 ctrlEnable false;
_Btn2 = _display displayCtrl 6029;
_Btn2 ctrlEnable false;


while {true} do 
{		
	CONTROL(6025,6026) ctrlSetStructuredText parseText format ["<t font='EtelkaNarrowMediumPro' size='0.5' align='center'>%1:%2<br/>%3.%4.%5</t>",life_zeit select 0,life_zeit select 1,life_zeit select 2,life_zeit select 3,life_zeit select 4];
	sleep 5;
	if (isNull (findDisplay 6025)) exitwith {};
};