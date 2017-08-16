#include "..\..\macros.hpp"

private["_display","_units","_type","_data","_rowData","_msg","_pobj","_pname","_update"];
_type = param [0,0];
_data = param [1,[],[[]]];
_update = param [2,false];

if (isNil "DWEV_fwzentral_messages") then {DWEV_fwzentral_messages = [];};
if (isNil "DWEV_fwzentral_Target") then {DWEV_fwzentral_Target = [];};

if !("ItemRadio" in assignedItems player) then {closeDialog 0; Hint "Du hast kein Smartphone!"};

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
switch((side player)) do {
  case independent:{
	  _cMessageHeader ctrlSetText format["Von:                            Einsatzbeschreibung:                               leitender Arzt:"];
  };
  case west: {
    _cMessageHeader ctrlSetText format["Von:                            Einsatzbeschreibung:                               Einsatzleitung:"];
  };
  case east: {
    _cMessageHeader ctrlSetText format["Von:                            Einsatzbeschreibung:                               Einsatzleitung:"];
  };
};
ctrlEnable[887892,false];
switch(_type) do
{
	case 0:
	{
			reverse _data;

			[1,_data] spawn DWEV_fnc_fwzentral;

			if(_update) then {
				[5] spawn DWEV_fnc_fwzentral;
			};

      /*
        0 = pname
        1 = player
        2 = type (deadrequest / request)
        3 = msg
				4 = pobject (mitarbeiter)
				5 = status
				6 = packetid
       */

		ctrlEnable[887892,false];
	};
	case 1:
	{
		lbclear _cMessageList;
		{
		    _msg = [_x select 3,40] call KRON_StrLeft;
				_pobj = [_x,4, objNull,[objNull]] call BIS_fnc_param;
				if(isNull _pobj) then
				{
					if((_x select 5) == 1) then {
						_pname = "---------";
					} else {
						_pname = "nicht im Dienst";
					};

				}
				else
				{
					_pname = getPlayerDName(_pobj);
				};
		    _rowData = [_x select 0, _x select 1];
		    _cMessageList lnbAddRow[_x select 0,format["%1 ...",_msg],_pname];
		    _cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
				switch(_x select 5) do {
					case 1: {	_cMessageList lnbSetColor[[((lnbSize _cMessageList) select 0)-1,2],[0, 0.3554, 0.8359,1]]; }; //Neu
					case 2:	{	_cMessageList lnbSetColor[[((lnbSize _cMessageList) select 0)-1,2],[0.882, 0.560, 0.050,1]]; }; //beabeitung
					case 3:	{	_cMessageList lnbSetColor[[((lnbSize _cMessageList) select 0)-1,2],[0.022, 0.627, 0.022,1]]; }; // beendet
					case 4:	{	_cMessageList lnbSetColor[[((lnbSize _cMessageList) select 0)-1,2],[0.988, 0, 0,1]]; }; //abgelehnt
				};

        false;

		} count _data;
    DWEV_fwzentral_messages = _data;

	};
	case 2:
	{
		ctrlEnable[887892,true];
	};
  case 3: //öffne edit
  {
    createDialog "DWEV_my_fwzentral_edit";
		[4] spawn DWEV_fnc_fwzentral;
  };
	case 4: //setze edit-infos
  {
		ctrlSetText[88886, format["Einsatz: %1",DWEV_fwzentral_Target select 0]];
    if(DWEV_fwzentral_Target select 2 == "deadrequest") then {
      ctrlSetText[88887, "Typ: Todesfall"];
    };
    if(DWEV_fwzentral_Target select 2 == "request") then {
      ctrlSetText[88887, "Typ: Notruf"];
    };
		_pobj = DWEV_fwzentral_Target select 4;
		if(isNull _pobj) then
		{
				_pname = "nicht im Dienst";
		}
		else
		{
			_pname = getPlayerDName(_pobj);
		};
		switch(DWEV_fwzentral_Target select 5) do {
			case 1: {	ctrlSetText[88899, format["Status: Neuer Einsatz"]]; };
			case 2:	{	ctrlSetText[88899, format["Status: Einsatz in Bearbeitung: %1",_pname]]; };
			case 3:	{	ctrlSetText[88899, format["Status: Einsatz beendet: %1",_pname]]; };
			case 4:	{	ctrlSetText[88899, format["Status: Einsatz abgelehnt: %1",_pname]]; };
		};

  };
	case 5: //Updat target array
  {
		_index = (DWEV_fwzentral_Target select 7);
		_data = (DWEV_fwzentral_messages select _index);
		DWEV_fwzentral_Target = _data;
		DWEV_fwzentral_Target pushBack _index;
		[4] spawn DWEV_fnc_fwzentral;
  };

};
