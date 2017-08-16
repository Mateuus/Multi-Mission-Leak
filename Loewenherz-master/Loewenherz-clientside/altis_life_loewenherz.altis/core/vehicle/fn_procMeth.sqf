/*
	File: procMeth.sqf
	Author Barney

	Description:
	Processes Meth of given vehicle (vehicle must be I_Truck_02_ammo_F)



	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
private ["_vehicle","_truck","_vehicleweight","_nameitemproc","_nameitem","_sumgl","_song","_delay","_mengeproce","_menge","_sum","_saveweight","_save","_count","_amount","_woproce","_itemweightproc","_itemweightunproc","_gefunden","_wo","_vorhanden","_saveitems","_zahlunp","_zahlproc","_c","_d"];
closedialog 0;
_vehicle = param [0,ObjNull,[ObjNull]];
_truck = "I_Truck_02_ammo_F";  // Truck der Processen kann
_vehicleweight = [_truck] call lhm_fnc_vehicleWeightCfg;
_sumgl = 1;    // Wie viel Items sollen pro Durchgang verarbeitet werden?
_song = "Device_disassembled_loop";
_delay = 25;  // wie lange soll ein Durchgang dauern??
_nameitemproc = "unpMeth";
_nameitem = "procMeth";
_vorhanden = false;
_amount = 1;
_itemweightproc = [_nameitem] call lhm_fnc_itemWeight;
_itemweightunproc = [_nameitemproc] call lhm_fnc_itemWeight;


if(!alive player) exitWith {};  // dafuck tot?
if(vehicle player != player) exitWith {hintSilent "Das geht nicht im Auto Einstein!"};
if(!(_vehicle iskindof(_truck))) exitWith {}; //Falsches Fahrzeug zum processen
if(count(_vehicle getVariable["Trunk",[[],0]] select 0) <= 0) exitWith {Hintsilent "Dieses Fahrzeug ist leer!" }; //  ist leer ??
if(_vehicle getvariable["Working",false]) exitWith {hint "Dieses Fahrzeug verarbeitet bereits"};


_vehicle setVariable ["Working",true,true];


While{true} do {


	for "_c" from 1 to _delay do {
		if(speed _vehicle != 0) exitWith {Hint "Der Truck muss still stehen";_vehicle setVariable ["Working",false,true];};
		if(!alive player) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
		if(!alive _vehicle) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
		sleep 1;
	};

	if(speed _vehicle != 0) exitWith {Hint "Der Truck muss still stehen";_vehicle setVariable ["Working",false,true];};
	if(!alive player) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
	if(!alive _vehicle) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?


	_vehicle setVariable["trunk_in_use",true,true];
	_sum = _sumgl;
	_count = count(_vehicle getVariable["Trunk",[[],0]] select 0);
	_vorhanden = false;
	_gefunden = false;

	for "_d" from 0 to (_count - 1) do {

		if(((_vehicle getVariable "Trunk" select 0) select _d) select 0 == _nameitemproc) then
		{
			_wo = _d;
			_menge = ((_vehicle getVariable "Trunk" select 0) select _d) select 1;
			_gefunden = true;
		};

		if(((_vehicle getVariable "Trunk" select 0) select _d) select 0 == _nameitem) then
		{
			_woproce = _d;
			_mengeproce = ((_vehicle getVariable "Trunk" select 0) select _d) select 1;
			_vorhanden = true;
		};
	};

	if(!_gefunden) exitWith{Hint "Nichts entsprechendes zum Verarbeiten im Truck"; _vehicle setVariable ["Working",false,true];};



	_save = _vehicle getVariable "Trunk";
	_saveitems = _save select 0;
	_saveweight = _save select 1;
	if(speed _vehicle != 0) exitWith {Hint "Der Truck muss still stehen"; _vehicle setVariable ["Working",false,true];};
	if(!alive player) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
	if(!alive _vehicle) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
	if((((_save) select 0) select _wo) select 0 != _nameitemproc) exitWith{_vehicle setVariable ["Working",false,true];};
	_zahlunp = ((_saveitems select _wo) select 1);


		if(_zahlunp < _sum) then
		{
			_sum = _zahlunp;
		} else
		{
			_sum = _sumgl;
		};


		if(_vorhanden) then {
			_zahlproc = (_saveitems select _woproce) select 1;
		};


	if(speed _vehicle != 0) exitWith {Hint "Der Truck muss still stehen"; _vehicle setVariable ["Working",false,true];};
	if(!alive player) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
	if(!alive _vehicle) exitWith {_vehicle setVariable ["Working",false,true];};  // dafuck tot?
	//_save = ((((_save) select 0) select _wo) select 1) - 1;


		if(_vorhanden) then
		{
			_saveitems set[_woproce,[_nameitem,_zahlproc + _sum]];
			_saveitems set[_wo,[_nameitemproc,_zahlunp - _sum]];
			_saveweight = _saveweight - (_itemweightunproc * _sum) ;
			_saveweight = _saveweight + (_itemweightproc * _sum);
			_zahlunp = _zahlunp - _sum;

			if(_zahlunp <= 0) then {
				_saveitems deleteAt _wo;
			};

		} else
		{
			_saveitems set[count(_saveitems),[_nameitem,_sum]];
			_saveitems set[_wo,[_nameitemproc,_zahlunp - _sum]];
			_saveweight = _saveweight - (_itemweightunproc * _sum);
			_saveweight = _saveweight + (_itemweightproc * _sum);
			_zahlunp = _zahlunp - _sum;

			if(_zahlunp <= 0) then {
				_saveitems deleteAt _wo;
			};
		};

	if(_saveweight < 0) then
	{
		_saveweight = 0;
	};

	_save = [_saveitems,_saveweight];

	if(_saveweight > _vehicleweight) exitWIth{Hint "Das Fahrzeug ist voll!"; _vehicle setVariable ["Working",false,true];};

	_vehicle setVariable["Trunk",_save,true];

	_vehicle setVariable["trunk_in_use",false,true];



};

_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable ["Working",false,true];