/*
	Rob stolen by Koil
*/

params [["_shop", objNull, [objNull]], ["_robber", objNull, [objNull]], "_action", "", ["_timer", 480], "_funds", "_dist", ["_success", false]];



if(!life_canrob) exitWith { hint "Nie mozesz rabowac sklepu przez 10 minut od spawnu."; }; 

if(_cops < 4) exitWith { hint "Nie moge tego robic poki nie ma odpowiedniej ilosci policjantow! (4+)"; }; 

if(vehicle player != _robber) exitWith { hint "Musisz wysiasc z pojazdu!"; }; 

_factor = player distance (getmarkerpos "cop_spawn_1");

_payment = 0;
_timer = _factor / 8;
_timer = round (_timer);
_funds = _factor * 0.8; 
_dist = _robber distance _shop;
_cops = (west countSide playableUnits);

if (!(_robber getVariable["dead",FALSE]) && {currentWeapon _robber != "" && currentWeapon player != "Binocular" && currentWeapon player != "Rangefinder"} && {_funds > 0}) then {

	[1,"911: Sklep lub osoba jest rabowana! Lokalizacja zostala oznaczona na mapie!"] remoteExecCall ["life_fnc_broadcast", west];
	
	hint format ["Rabujesz sklep! Pozostalo %1 sekund!",_timer];
	myStoreMarker = createMarker [format["%1",player], position player];
	myStoreMarker setMarkerType "Mil_dot";
	myStoreMarker setMarkerText "ACTIVE ROBBERY";
	myStoreMarker setMarkerColor "ColorRed";
	life_canrob = false;
	_shop removeAction _action;

	while {true} do {
		hintsilent format ["Pozostalo %1 sekund.",_timer];
		uiSleep 1;
		_timer = _timer - 1;
		_payment = _payment + 1;
		_dist = _robber distance _shop;
		if ((_robber getVariable["dead",FALSE])) exitwith {
				life_canrob = true;
				deleteMarker myStoreMarker;
				hint "Chyba potrzebujesz medyka!";
				uiSleep _factor;
				_action = _shop addAction["Rob",life_fnc_robStore];
		};
		if (_dist >= 6) exitwith {
				life_canrob = true;
			deleteMarker myStoreMarker;
			hint "Dziekuje ze pusciles mnie wolno!";
			uiSleep _factor;
			_action = _shop addAction["Rob",life_fnc_robStore];
		};
		if (currentWeapon _robber == "" || currentWeapon player == "Binocular" || currentWeapon player == "Rangefinder") exitwith {
				life_canrob = true;
			deleteMarker myStoreMarker;
			hint "Juz sie Ciebie nie boje gnoju!";
			uiSleep _factor;
			_action = _shop addAction["Rob",life_fnc_robStore];
		};
		if(_payment > 60) then { ["cash","add",350] call life_fnc_handleCash; _payment = 0; ["Ukradles $350!", false] spawn domsg;  };
		if(_timer < 1) exitWith { deleteMarker myStoreMarker; _success = true; };
	};
	if(!_success) exitWith { deleteMarker myStoreMarker; life_canrob = true; };
	life_canrob = true;
	["cash","add",_funds] call life_fnc_handleCash; 
	hint format["Ukradles $%1",_funds];
	_reason = "211";
	[_robber,_robber,_reason] spawn life_fnc_createEvidence;
	[1,format["WIADOMOSCI LAKESIDE: Sklep zostal obrabowany na $%2!", _shop, [_funds] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast", civilian];
	_funds = 0;
	life_use_atm = false;
	uiSleep 180;
	life_use_atm = true;
	uiSleep _factor;
	_action = _shop addAction["Rob",life_fnc_robStore];
};

