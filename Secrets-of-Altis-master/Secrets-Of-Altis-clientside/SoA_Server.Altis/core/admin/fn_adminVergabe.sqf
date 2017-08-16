#include <macro.h>
private["_mode","_playerliste","_itemliste","_levelliste","_lizenzliste","_trueorfalse","_trueorfalselist","_player","_item","_itemconverted","_menge","_exp","_toAll"];
DisableSerialization;

_mode = _this select 0;
_playerliste = getControl(9100,9101);
_levelliste = getControl(9100,9103);
_itemliste = getControl(9100,9104);
_lizenzliste = getControl(9100,9109);
_trueorfalselist = getControl(9100,9110);
_toAll = getControl(9100,9107);

if(__GETC__(life_adminlevel < 3)) then {
	createDialog "checkAdmin";
	WaitUntil{isnull (finddisplay 8600)};
};

switch(_mode) do {

	//Listen füllen
	case 0: {
		{_x ctrlEnable false} foreach [_playerliste,_levelliste,_itemliste,_lizenzliste,_trueorfalselist];

		{
			_playerliste lbadd format["%1",name _x];
			_playerliste lbSetdata [(lbSize _playerliste)-1,format["%1",_x]];
		} foreach playableUnits;

		for "_i" from 0 to 12 do {
			_levelliste lbadd format["Level %1",_i];
			_levelliste lbSetValue [(lbSize _levelliste)-1,_i];
		};

		_trueorfalselist lbadd format["Geben",0];
		_trueorfalselist lbSetValue [(lbSize _trueorfalselist)-1,0];
		_trueorfalselist lbadd format["Nehmen",1];
		_trueorfalselist lbSetValue [(lbSize _trueorfalselist)-1,1];

		{
			_itemliste lbadd format["%1",[_x] call life_fnc_varToStr];
			_itemliste lbSetData [(lbSize _itemliste)-1,format["%1",_x]];
			_icon = [_x] call life_fnc_itemIcon;
			_itemliste lbSetPicture [(lbSize _itemliste)-1,_icon];
			_itemliste lbSetPictureColor [(lbSize _itemliste)-1, [1, 1, 1, 1]];
		} foreach life_inv_items;

		{
			if((_x select 1) == "civ") then {
				_lizenzliste lbadd format["%1",[_x select 0] call life_fnc_varToStr];
				_lizenzliste lbSetData [(lbSize _lizenzliste)-1,_x select 0];
			};
		} foreach life_licenses;
		
		lbSort [_playerliste, "ASC"];
		lbSort [_itemliste, "ASC"];

		{_x ctrlEnable true} foreach [_playerliste,_levelliste,_itemliste,_lizenzliste,_trueorfalselist];
	};

	//Level vergeben
	case 1: {
		_player = call compile (_playerliste lbData (lbCurSel _playerliste));
		_level = (_levelliste lbValue (lbCurSel _levelliste));
		
		if(isNil "_player") exitWith {hint "Keinen Spieler ausgewählt!"};
		if(isNil "_level") exitWith {hint "Kein Level gesetzt!"};
		
		_exp = 0;
		
		switch(_level) do {
			case 0: {_exp = 0};
			case 1: {_exp = 50};
			case 2: {_exp = 1500};
			case 3: {_exp = 5000};
			case 4: {_exp = 10000};
			case 5: {_exp = 25000};
			case 6: {_exp = 50000};
			case 7: {_exp = 100000};
			case 8: {_exp = 350000};
			case 9: {_exp = 750000};
			case 10: {_exp = 1300000};
			case 11: {_exp = 2000000};
			case 12: {_exp = 3100000};
		};
		
		[_exp,2] remoteExecCall ["life_fnc_exptoall",_player];
		[name player, name _player,_level,13,"",admingrund] remoteExecCall ["life_fnc_logdat",2];
	};

	//Gegenstand versenden
	case 2: {
		_player = call compile (_playerliste lbData (lbCurSel _playerliste));
		_item = (_itemliste lbData (lbCurSel _itemliste));
		_menge = parseNumber(ctrlText 9106);
		
		if(cbChecked _toAll) then {_player = ObjNull};
		if(isNil "_player") exitWith {hint "Keinen Spieler ausgewählt!"};
		if(isNil "_item") exitWith {hint "Keinen Gegenstand ausgewählt!"};
		if(isNil "_menge") exitWith {hint "Keine Menge eingegeben!"};
		if(_menge <= 0) exitWith {hint "Ungültige Mengenangabe!"};
		if(_menge > 30) exitWith {hint "Du kannst nicht mehr als 30 Stapel versenden!"};
		
		_itemconverted = [_item,1] call life_fnc_varHandle;
		
		if(cbChecked _toAll) then {
			[2,_itemconverted,_menge,"SoA-Support"] remoteExecCall ["life_fnc_mailbox",0];
			[name player, "Alle",[_item] call life_fnc_varToStr,10,_menge,admingrund] remoteExecCall ["life_fnc_logdat",2];
		} else {
			[2,_itemconverted,_menge,"SoA-Support"] remoteExecCall ["life_fnc_mailbox",_player];
			[name player, name _player,[_item] call life_fnc_varToStr,10,_menge,admingrund] remoteExecCall ["life_fnc_logdat",2];
		};
	};

	//Lizenz vergeben
	case 3: {
		_player = call compile (_playerliste lbData (lbCurSel _playerliste));
		_lizenz = (_lizenzliste lbData (lbCurSel _lizenzliste));
		_trueorfalse = (_trueorfalselist lbValue (lbCurSel _trueorfalselist));
		_action = "default";

		if(_trueorfalse == 0) then {_trueorfalse = true} else {_trueorfalse = false};

		if(isNil "_player") exitWith {hint "Keinen Spieler ausgewählt!"};
		if(isNil "_lizenz") exitWith {hint "Keine Lizenz ausgewählt!"};
		if(isNil "_trueorfalse") exitWith {hint "Keine Aktion ausgewählt!"};

		if(_trueorfalse) then {_action = "gegeben"} else {_action = "genommen"};
		hint format["Du hast %1 %2 %3.",name _player,[_lizenz] call life_fnc_varToStr,_action];
		[_lizenz,_trueorfalse] remoteExecCall ["life_fnc_licenseTransfer",_player];

		[name player, name _player,[_lizenz] call life_fnc_varToStr,14,"",admingrund] remoteExecCall ["life_fnc_logdat",2];
	};
};