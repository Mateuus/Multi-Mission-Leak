/*
		fn_erfolge.sqf
		Author: G00golplexian
		
		Description: Erfolgssystem.
*/
WaitUntil {sleep 0.1; !life_firstspawn};

//Donator
if(call life_donator > 0 && !erfolg_donator) then {erfolg_donator = true; ["erfolg_donator"] spawn life_fnc_erfolgerhalten; sleep 5;};

//Geld
if((life_beatgeld + life_beatbankgeld) >= 10000000 && !erfolg_10mio) then {erfolg_10mio = true; ["erfolg_10mio"] spawn life_fnc_erfolgerhalten; sleep 5;};
if((life_beatgeld + life_beatbankgeld) >= 25000000 && !erfolg_25mio) then {erfolg_25mio = true; ["erfolg_25mio"] spawn life_fnc_erfolgerhalten; sleep 5;};
if((life_beatgeld + life_beatbankgeld) >= 50000000 && !erfolg_50mio) then {erfolg_50mio = true; ["erfolg_50mio"] spawn life_fnc_erfolgerhalten; sleep 5;};
if((life_beatgeld + life_beatbankgeld) >= 100000000 && !erfolg_100mio) then {erfolg_100mio = true; ["erfolg_100mio"] spawn life_fnc_erfolgerhalten; sleep 5;};

//Gang (DonAtor)
if(license_civ_gruppe && !erfolg_gang) then {erfolg_gang = true; ["erfolg_gang"] spawn life_fnc_erfolgerhalten; sleep 5;};

//Lizenzen
if(license_civ_air && license_civ_boat && license_civ_driver && license_civ_truck && !erfolg_lizenzen) then {erfolg_lizenzen = true; ["erfolg_lizenzen"] spawn life_fnc_erfolgerhalten; sleep 5;};

//Berufe
if(playerside == west && !erfolg_berufepol) then {erfolg_berufepol = true; ["erfolg_berufepol"] spawn life_fnc_erfolgerhalten; sleep 5;};
if(playerside == independent && !erfolg_berufemed) then {erfolg_berufemed = true; ["erfolg_berufemed"] spawn life_fnc_erfolgerhalten; sleep 5;};

//Grundstücke
if(playerside == civilian) then {
	if(count life_houses >= 3 && !erfolg_house3) then {erfolg_house3 = true; ["erfolg_house3"] spawn life_fnc_erfolgerhalten; sleep 5;};
	if(count life_houses >= 7 && !erfolg_house7) then {erfolg_house7 = true; ["erfolg_house7"] spawn life_fnc_erfolgerhalten; sleep 5;};
};

//Rarzeugerito
if(erfolg_rarzeug1 && erfolg_rarzeug2 && erfolg_rarzeug3 && erfolg_rarzeug4 && !erfolg_rarzeug) then {erfolg_rarzeug = true; ["erfolg_rarzeug"] spawn life_fnc_erfolgerhalten; sleep 5};

//Level
if(!erfolg_level5 && life_level >= 5 && playerside == civilian) then {erfolg_level5 = true; ["erfolg_level5"] spawn life_fnc_erfolgerhalten; sleep 5};
if(!erfolg_level10 && life_level >= 10 && playerside == civilian) then {erfolg_level10 = true; ["erfolg_level10"] spawn life_fnc_erfolgerhalten; sleep 5};

//Events
if(!erfolg_euro2016 && (profileNameSpace getVariable [format["%1_%2_%3",missionName,"EMCODE",getplayerUID player],false])) then {erfolg_euro2016 = true; ["erfolg_euro2016"] spawn life_fnc_erfolgerhalten; sleep 5};