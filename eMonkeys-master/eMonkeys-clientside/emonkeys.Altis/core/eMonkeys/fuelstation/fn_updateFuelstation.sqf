/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Uses for the Fuelstations
*/
private["_owner","_mode","_fuelstation","_tankstellenname","_benzinpreis","_dieselpreis","_reperaturpreis","_lackierpreis","_einkommen","_length","_chrByte","_allowed"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_player = _this select 1;
_owner = getPlayerUID _player;

_updatePrice = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "updatePrice");
_minPriceFuel = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "fuel_minPrice");
_maxPriceFuel = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "fuel_maxPrice");
_minPriceRepair = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "repair_minPrice");
_maxPriceRepair = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "repair_maxPrice");
_minPricePaint = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "paint_minPrice");
_maxPricePaint = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "paint_maxPrice");

switch (_mode) do 
{
	case 0:
	{
		_tankstellenname = ctrlText 9001;
		_id = _this select 2;
		
		_length = count (toArray(_tankstellenname));
		_chrByte = toArray (_tankstellenname);
		_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
		if(_length > 25) exitWith {hint "Du kannst nur bis zu 25 Zeichen verwenden!"};
		if(_length <= 3) exitWith {hint "Du musst mehr als 3 Zeichen verwenden!"};
		_badChar = false;
		{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
		if(_badChar) exitWith {hint "Du kannst nur Buchstaben und Zahlen verwenden!";};
		
		if(EMonkeys_a164 < _updatePrice) exitWith {closeDialog 0; hint "Du hast nicht genug Geld auf deinem Konto!";};
		
		format["fuelstation_%1",_id] setMarkerText format ["%1",_tankstellenname];
		format["fuelstation_%1",_id] setMarkerTextLocal format ["%1",_tankstellenname];
		format["fuelstation_%1",_id] setMarkerColor "ColorGreen";
		format["fuelstation_%1",_id] setMarkerColorLocal "ColorYellow";
		
		[[_owner,_id,_tankstellenname,0],"TON_fnc_updateFuelstation",false,false] spawn EMonkeys_fnc_MP;
		EMonkeys_a164 = EMonkeys_a164 - _updatePrice;
		hint format ["Du hast den Namen deiner Tankstelle auf\n%1\ngeändert.",_tankstellenname];
	};
	
	case 1: 
	{
		_superpreis = ctrlText 9003;
		_superpluspreis = ctrlText 9004;
		_dieselpreis = ctrlText 9005;
		_biodieselpreis = ctrlText 9006;
		_reperaturpreis = ctrlText 9007;
		_lackierpreis = ctrlText 9008;
		_id = _this select 2;
		
		if(EMonkeys_a164 < _updatePrice) exitWith {closeDialog 0; hint "Du hast nicht genug Geld auf deinem Konto!";};
		
		if(!([_superpreis] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
		if((parseNumber _superpreis) > _maxPriceFuel) exitWith {hint "Übertreibs nicht mit dem Preis sonst verlierst du Kunden!"};
		if((parseNumber _superpreis) < _minPriceFuel) exitWith {hint format ["Du kannst nicht weniger als %1€ pro Liter verlangen!",_minPriceFuel];};
		if(!([_superpluspreis] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
		if((parseNumber _superpluspreis) > _maxPriceFuel) exitWith {hint "Übertreibs nicht mit dem Preis sonst verlierst du Kunden!"};
		if((parseNumber _superpluspreis) < _minPriceFuel) exitWith {hint format ["Du kannst nicht weniger als %1€ pro Liter verlangen!",_minPriceFuel];};
		if(!([_dieselpreis] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
		if((parseNumber _dieselpreis) > _maxPriceFuel) exitWith {hint "Übertreibs nicht mit dem Preis sonst verlierst du Kunden!"};
		if((parseNumber _dieselpreis) < _minPriceFuel) exitWith {hint format ["Du kannst nicht weniger als %1€ pro Liter verlangen!",_minPriceFuel];};
		if(!([_biodieselpreis] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
		if((parseNumber _biodieselpreis) > _maxPriceFuel) exitWith {hint "Übertreibs nicht mit dem Preis sonst verlierst du Kunden!"};
		if((parseNumber _biodieselpreis) < _minPriceFuel) exitWith {hint format ["Du kannst nicht weniger als %1€ pro Liter verlangen!",_minPriceFuel];};
		/*
		if(!([_reperaturpreis] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
		if((parseNumber _reperaturpreis) > _maxPriceRepair) exitWith {hint "Übertreibs nicht mit dem Preis sonst verlierst du Kunden!"};
		if((parseNumber _reperaturpreis) < _minPriceRepair) exitWith {hint format ["Du kannst nicht weniger als %1€ pro Reperatur verlangen!",_minPriceRepair];};
		if(!([_lackierpreis] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
		if((parseNumber _lackierpreis) > _maxPricePaint) exitWith {hint "Übertreibs nicht mit dem Preis sonst verlierst du Kunden!"};
		if((parseNumber _lackierpreis) < _minPricePaint) exitWith {hint format ["Du kannst nicht weniger als %1€ pro Lackierung verlangen!",_minPricePaint];};
		*/
		
		//[[_owner,_id,_superpreis,1,_superpluspreis,_dieselpreis,_biodieselpreis,_reperaturpreis,_lackierpreis],"TON_fnc_updateFuelstation",false,false] spawn EMonkeys_fnc_MP;
		[[_owner,_id,_superpreis,1,_superpluspreis,_dieselpreis,_biodieselpreis,0,0],"TON_fnc_updateFuelstation",false,false] spawn EMonkeys_fnc_MP;
		EMonkeys_a164 = EMonkeys_a164 - _updatePrice;
		//hint format ["Du hast die Preise deiner Tankstelle geändert.\n\n Super: %1€\n SuperPlus: %2€\n Diesel: %3€\n Biodiesel: %4€\n Reperatur: %5€\n Lackierung: %6€",_superpreis,_superpluspreis,_dieselpreis,_biodieselpreis,_reperaturpreis,_lackierpreis];
		hint format ["Du hast die Preise deiner Tankstelle geändert.\n\n Super: %1€\n SuperPlus: %2€\n Diesel: %3€\n Biodiesel: %4€",_superpreis,_superpluspreis,_dieselpreis,_biodieselpreis];
	};
	
	case 2: 
	{
		_id = _this select 2;
		_einkommen = _this select 3;
		[[_owner,_id,_einkommen,2],"TON_fnc_updateFuelstation",false,false] spawn EMonkeys_fnc_MP;
		EMonkeys_a164 = EMonkeys_a164 + _einkommen;
		hint format ["Du hast die dein Einkommen von\n%1€\nauf dein Konto überwiesen",[_einkommen] call EMonkeys_fnc_numberText];
		closeDialog 0;
	};
};