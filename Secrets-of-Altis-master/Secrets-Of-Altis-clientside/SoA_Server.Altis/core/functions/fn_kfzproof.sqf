/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_kfzproof.sqf
       Description: Eine Kennzeichenabfrage.

------------------------------------------------------------------------------*/
disableSerialization;
private["_mode","_badchar","_array","_display","_eingabe","_alreadyvorhanden","_kfz","_life_kfzall_old"];

_mode = _this select 0;
if!(_mode in [0,1,2]) then {_mode = 0};
_badchar = false;
_alreadyvorhanden = false;

switch(_mode) do {
	
	case 0: {

		if(playerside != civilian) exitWith {hint "Du bist im Dienst!"};
		createdialog "kennzeichen";
		[player] remoteExecCall ["DB_fnc_kennzeichen",2];		

		_display = finddisplay 7700;
		_citylist = _display displayCtrl 7701;

		{
			_citylist lbadd format["%1",_x];
			_citylist lbSetdata [(lbSize _citylist)-1,_x];
		} foreach ["KA","AT","PY","SO","SE","VI","KR","TE","MO","AD"];
	};

	case 1: {

		if(playerside != civilian) exitWith {hint "Du bist im Dienst!"};

		_display = finddisplay 7700;
		_citylist = _display displayCtrl 7701;
		_text = _display displayCtrl 7702;

		_city = _citylist lbData (lbCurSel _citylist);
		_kfz = ctrltext _text;
		_packet = [];

		if(_city == "") exitWith {titleText ["Du hast kein Städtekürzel gewählt!","PLAIN DOWN"]};
		if(_kfz == "" OR (count _kfz) != 5) exitWith {titleText ["Das eingegebene Kennzeichen ist unzulässig.","PLAIN DOWN"]};

		//_life_kfzall_old = life_kfzall;
		//WaitUntil {!(_life_kfzall_old IsEqualTo life_kfzall)};

		//serious checks
		{
			_kennzeichensuche = _x select 1;
			if(format["%1%2",_city,_kfz] == _kennzeichensuche) exitWith {_alreadyvorhanden = true};
		} foreach life_kfzall;

		if(_alreadyvorhanden) exitWith {titletext ["Dieses Kennzeichen ist bereits vergeben!","PLAIN DOWN"]};

		_array = toarray _kfz;
		_abc = [65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90];
		_ziffern = [48,49,50,51,52,53,54,55,56,57];

		if(
			(_array select 0) == 83 && (_array select 1) == 83 OR
			(_array select 0) == 72 && (_array select 1) == 74 OR
			(_array select 0) == 72 && (_array select 1) == 72 OR
			(_array select 0) == 75 && (_array select 1) == 90 OR
			(_array select 0) == 83 && (_array select 1) == 65
		) then {_badchar = true};

		if(_badchar) exitWith {titleText ["Stellen 1-2 im Kennzeichen ist eine unzulässige Buchstabenkombination.","PLAIN DOWN"]};

		if!((_array select 0) in _abc && (_array select 1) in _abc) exitWith {titleText ["Stellen 1-2 im Kennzeichen müssen Buchstaben sein!","PLAIN DOWN"]};
		if!((_array select 2) in _ziffern && (_array select 3) in _ziffern && (_array select 4) in _ziffern) exitWith {titleText ["Stellen 3-5 im Kennzeichen müssen Zahlen sein!","PLAIN DOWN"]};

		//Abfrage bei vorhandenem Kennzeichen
		if(life_veh_kfz != "") exitWith {

			_action = [
				"Die Änderung des Kennzeichens kostet 100.000€.",
				"Kennzeichen ändern?",
				"Ja",
				"Nein"
			] call BIS_fnc_guiMessage;

			if!(_action) exitWith {};
			if(life_beatgeld < 100000) exitWith {titleText ["Du benötigst 100.000€ bar für die Änderung deines Kennzeichens.","PLAIN"]};

			life_beatgeld = life_beatgeld - 100000;

			closedialog 0;
			life_veh_kfz = format["%1%2",_city,_kfz];
			[16] call SOCK_fnc_updatePartial;

		};

		closedialog 0;
		life_veh_kfz = format["%1%2",_city,_kfz];
		[16] call SOCK_fnc_updatePartial;
	};

	case 2: {

		_display = finddisplay 7710;
		_eingabe = _display displayCtrl 7711;
		_ausgabe_kennzeichen = _display displayCtrl 7712;
		_ausgabe_halter = _display displayCtrl 7713;
		[player] remoteExecCall ["DB_fnc_kennzeichen",2];

		_eingabe = ctrlText _eingabe;

		if(_eingabe == "" OR (count _eingabe) != 7) exitWith {hint "Ungültiges Kennzeichen!"};

		_kennzeichen = "";
		_person = "";

		_ausgabe_halter ctrlSetText "Halter: Suche...";
		_ausgabe_kennzeichen ctrlSetText "Kennzeichen: Suche...";

		{
			_personsuche = _x select 0;
			_kennzeichensuche = _x select 1;

			if(_eingabe == _kennzeichensuche) exitWith {_person = _personsuche; _kennzeichen = _kennzeichensuche};

		} foreach life_kfzall;

		_ausgabe_halter ctrlSetText format["Halter: %1",_person];
		_ausgabe_kennzeichen ctrlSetText format["Kennzeichen: %1",_kennzeichen];
	};
};