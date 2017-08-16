private["_mode","_display","_list","_name","_ahwold","_satellite"];
disableSerialization;

if(isnull (finddisplay 8100)) exitWith {}; 

_mode = _this select 0;
_display = finddisplay 8100;
_list = _display displayCtrl 8101;
_satellite = _display displayCtrl 8102;
if(call life_ahwlevel < 8) then {ctrlShow[8103,false];};

switch(_mode) do {

	case 0: 
	{
		lnbClear _list;

		{
			_fall = _x select 1;
			_opfer = _x select 2;
			_uhrzeit = _x select 3;
			_ort = _x select 4;
			_zugeteilt = _x select 5;

	    	_list lnbAddRow [_fall,name _opfer,_uhrzeit,_ort,_zugeteilt];

	    	if(_fall == "Todesfall") then 
	    	{
	    		_list lnbSetColor [[((lnbSize _list) select 0)-1,0],[1,0,0,1]];
			} else {
				_list lnbSetColor [[((lnbSize _list) select 0)-1,0],[1,1,0,1]];
			};

	    	if(_zugeteilt == "Niemand") then 
	    	{
	    		_list lnbSetColor [[((lnbSize _list) select 0)-1,4],[1,1,1,1]];
	   		} else {
	   			_list lnbSetColor [[((lnbSize _list) select 0)-1,4],[0,1,0,1]];
	    	};

	        _list lnbSetData [[((lnbSize _list) select 0)-1,0],format ["%1",_x]];

		} foreach ahw_all;
	};

	//Button zuteilen
	case 1: 
	{
		_ahwold = ahw_all;
		_selected = call compile (_list lnbData[lnbCurSelRow _list,0]);
		if(isnil "_selected") exitWith {hint "Du hast nichts ausgewählt!"};

		_opfer = (_selected select 2);

		[0,_selected,name player] remoteExecCall ["SOA_fnc_ahw",2];
		[2,format["[AUFTRAG] AHW-Mitarbeiter %1 wurde ihrem Auftrag zugeordnet. Bitte gedulden Sie sich, bis dieser am Standort eingetroffen ist.",name player]] remoteExecCall ["life_fnc_broadcast",_opfer];
		[1,format["[AUFTRAG] AHW-Mitarbeiter %1 wurde ihrem Auftrag zugeordnet. Bitte gedulden Sie sich, bis dieser am Standort eingetroffen ist.",name player]] remoteExecCall ["life_fnc_broadcast",_opfer];
		[1,format["Mitarbeiter %1 wurde dem Auftrag von %2 zugeordnet und ist nun im Einsatz!",name player,name _opfer]] remoteExecCall ["life_fnc_broadcast",independent];
	};

	//Button löschen
	case 2: 
	{
		_ahwold = ahw_all;
		_selected = call compile (_list lnbData[lnbCurSelRow _list,0]);
		if(isnil "_selected") exitWith {hint "Du hast nichts ausgewählt!"};

		_id = (_selected select 0);
		_opfer = (_selected select 2);

		[1,_selected] remoteExecCall ["SOA_fnc_ahw",2];
		deleteMarker format["AHWMark%1",_id];
		[1,format["Mitarbeiter %1 hat den Auftrag von %2 gelöscht!",name player,name _opfer]] remoteExecCall ["life_fnc_broadcast",independent];
	};

	//Satellitenbild
	case 3: 
	{
		_selected = call compile (_list lnbData[lnbCurSelRow _list,0]);
		if(isnil "_selected") exitWith {};

		_fall = (_selected select 1);
		_opferpos = (_selected select 6);

		[_satellite,1,0.07,_opferpos] call life_fnc_setMapPosition;
	};
};