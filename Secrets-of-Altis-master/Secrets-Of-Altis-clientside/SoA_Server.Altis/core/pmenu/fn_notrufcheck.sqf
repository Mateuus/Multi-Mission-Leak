#include <macro.h>
disableSerialization;

_dialog = finddisplay 3960;
_text = ctrlText 3961;
_textfield = _dialog displayCtrl 3961;
_sendbutton = _dialog displayCtrl 3962;
_auswahl = _dialog displayCtrl 3963;
_ortcheck = _dialog displayCtrl 3964;
_mode = _this select 0;

switch(_mode) do {

	case 0: {
		_sendbutton ctrlEnable false;
	
		_fraktionen = [
			["Polizeidienststelle",2],
			["Altis Hilfswerk",4],
			//["Mechanikzentrum",8],
			["Secrets of Altis Support",3]
		];
		
		switch(playerside) do {
			case west: {_fraktionen pushback ["An Alle (Polizei)",9]};
			case independent: {_fraktionen pushback ["An Alle (AHW-M)",10]; _fraktionen pushback ["An Alle (AHW-A)",11]};
		};
		
		if((__GETC__(life_adminlevel) > 0)) then {
			_fraktionen pushback ["An Alle (Support)",7];
		};
		
		{
			_auswahl lbadd format["%1",(_x select 0)];
			_auswahl lbSetValue [(lbSize _auswahl)-1,(_x select 1)];
		} foreach _fraktionen;
	};

	case 1: {
		_Village = (text (nearestLocations [(getpos player),["NameVillage","NameCity","NameCityCapital"],5000]select 0));
		_textfield ctrlSetText format["%1 [GPS-Daten: %2 bei %3]",_text,(mapgridposition player),_Village];
	};
};