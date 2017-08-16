private["_organThief"];
_organThief = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _organThief) exitWith {};
	[[1,format["%1 a pris un organe sur %2 !",name _organThief,name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	[_organThief,"kidney",1] call life_fnc_handleInv;
	sleep 300;
	_organThief setVariable["hasOrgan",false,true];