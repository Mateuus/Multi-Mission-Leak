#include "..\..\script_macros.hpp"
/*
	File: fn_Teleports.sqf
	Author: RPGforYOU 
	Website: www.outlawed-veterans.com
	Based on the bus idea of midgetgrimm
	
	Description:
	Centralizes all Teleport locations
	If you are copying it, be so kind to leave my name as author in it as I'm the one and only original one - RPGforYOU! :)
	And this took some time to fucking write, check and search for XD
*/

private["_window","_bad","_object","_value","_position","_TeleportLocationName","_smugglecheck","_SpawnLocation","_Fee","_TeleportLocationMarker","_drugcheck","_weaponcheck","_goldtrafficing","_blastingcharge","_drugstrafficing","_RandomCitySpawns","_popup"
];

_value = [_this,3,"",[""]] call BIS_fnc_param;
if(_value == "") exitWith {}; //well nothing shouldn't be coming through ...

//////////////
/*
EXAMPLES: 

Civilian
this addAction["<t color='#BA55D3'><img image='\A3\ui_f\data\map\mapcontrol\BusStop_CA.paa' size='1'></img> Bus to Sofia</t>",life_fnc_teleports,"civ_sofia",0,false,false,"",'playerSide == civilian']; 
this addAction["<t color='#FF0000'><img image='\A3\ui_f\data\map\mapcontrol\BusStop_CA.paa' size='1'></img> Bus to Rebelcamp</t>",life_fnc_teleports,"civ_rebelcamp",0,false,false,"",'playerSide == civilian && license_civ_rebel']; 
this addAction["<t color='#FFFF66'><img image='\A3\ui_f\data\map\mapcontrol\BusStop_CA.paa' size='1'></img><img image='\A3\ui_f\data\map\mapcontrol\Fountain_CA.paa' size='1'></img> Bus to Donator Port</t>",life_fnc_teleports,"civ_donatorzone",0,false,false,"",'playerSide == civilian']; 
 
 
Medic
this addAction["<t color='#00FF00'><img image='\a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1'></img> Bus to Kavala Hospital</t>",life_fnc_teleports,"med_kavala",0,false,false,"",'playerSide == independent']; 
 
Cop
this addAction["Buy Rebel MX Loadout",life_fnc_teleports,"rebel_mx",0,false,false,"",'playerSide == civilian']; 
*/
//////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
uiSleep 0.1;
_position = [];
_bad = 0;
_drugcheck = 0;
_goldtrafficing = 0;
_smugglecheck = 0;
_weaponcheck = 0;
_blastingcharge = 0;
_drugstrafficing = 0;
_RandomCitySpawns = 0;
_popup = 1;

switch (_value) do {



	////MEDICAL////
	
	
	case "med_kavala": {
	/////////////////////
	//Kavala Hospital
	/////////////////////
	_TeleportLocationName = "Kavala Hospital";
	_TeleportLocationMarker = "medic_spawn_1";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	};
	case "med_Airport": {
	/////////////////////
	//Airport Hospital
	/////////////////////
	_TeleportLocationName = "Airport Hospital";
	_TeleportLocationMarker = "medic_spawn_2";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	};
	case "med_Pygros": {
	/////////////////////
	//Pygros Hospital
	/////////////////////
	_TeleportLocationName = "Pygros Hospital";
	_TeleportLocationMarker = "medic_spawn_3";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	};
	
	
	
	////CIVILIANS////
	
	
	
	case "civ_kavala": {
	/////////////////////
	//Kavala
	/////////////////////
	_TeleportLocationName = "Kavala City";
	_TeleportLocationMarker = "city_kavala";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_negades": {
	/////////////////////
	//Negades
	/////////////////////
	_TeleportLocationName = "Negades City";
	_TeleportLocationMarker = "city_negades";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_Zaros": {
	/////////////////////
	//Zaros
	/////////////////////
	_TeleportLocationName = "Zaros City";
	_TeleportLocationMarker = "city_zaros";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_neochori": {
	/////////////////////
	//neochori
	/////////////////////
	_TeleportLocationName = "Neochori City";
	_TeleportLocationMarker = "city_neochori";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_oreokastro": {
	/////////////////////
	//oreokastro
	/////////////////////
	_TeleportLocationName = "Oreokastro City";
	_TeleportLocationMarker = "city_oreokastro";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_athira": {
	/////////////////////
	//Athira
	/////////////////////
	_TeleportLocationName = "Athira City";
	_TeleportLocationMarker = "city_athira";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_anthrakia": {
	/////////////////////
	//Anthrakia
	/////////////////////
	_TeleportLocationName = "Anthrakia City";
	_TeleportLocationMarker = "city_anthrakia";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_pygros": {
	/////////////////////
	//Pygros
	/////////////////////
	_TeleportLocationName = "Pygros City";
	_TeleportLocationMarker = "city_pygros";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_sofia": {
	/////////////////////
	//Sofia
	/////////////////////
	_TeleportLocationName = "Sofia City";
	_TeleportLocationMarker = "city_sofia";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	};
	case "civ_rebelcamps": {
	/////////////////////
	//RebelCamp
	/////////////////////
	_TeleportLocationName = "Rebel Camp";
	_TeleportLocationMarker = "campsouth";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	};
	case "civ_rebelcampn": {
	/////////////////////
	//RebelCamp
	/////////////////////
	_TeleportLocationName = "Rebel Camp North";
	_TeleportLocationMarker = "campnorth";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	};
	case "civ_donatorzone": {
	/////////////////////
	//Donator Zone
	/////////////////////
	_TeleportLocationName = "Donator Port";
	_TeleportLocationMarker = "donator_spawn";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	};
	
	
	////POLICE FORCE////
	
	
	case "cop_kavalahq": {
	/////////////////////
	//Kavala Police HQ
	/////////////////////
	_TeleportLocationName = "Kavala Police HQ";
	_TeleportLocationMarker = "cop_spawn_1";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_kavalaswathq": {
	/////////////////////
	//Kavala SWAT  HQ
	/////////////////////
	_TeleportLocationName = "Kavala SWAT HQ";
	_TeleportLocationMarker = "swat_spawn";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_airhq": {
	/////////////////////
	//Air HQ 
	/////////////////////
	_TeleportLocationName = "Air Police HQ";
	_TeleportLocationMarker = "police_hq_5";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_anthrakia": {
	/////////////////////
	//Anthrakia HQ 
	/////////////////////
	_TeleportLocationName = "Anthrakia Police HQ";
	_TeleportLocationMarker = "cop_spawn_7";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_pygros": {
	/////////////////////
	//Pygros Police HQ
	/////////////////////
	_TeleportLocationName = "Pygros Police HQ";
	_TeleportLocationMarker = "police_hq_3";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_athira": {
	/////////////////////
	//Athira Police HQ
	/////////////////////
	_TeleportLocationName = "Athira Police HQ";
	_TeleportLocationMarker = "police_hq_2";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_highwaypatrol": {
	/////////////////////
	//Highway Patrol
	/////////////////////
	_TeleportLocationName = "Highway Patrol";
	_TeleportLocationMarker = "cop_spawn_11";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_sofia": {
	/////////////////////
	//Highway Patrol
	/////////////////////
	_TeleportLocationName = "Sofia Police HQ";
	_TeleportLocationMarker = "cop_sofia_spawn";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_checkpointalpha": {
	/////////////////////
	//Checkpoint Alpha
	/////////////////////
	_TeleportLocationName = "Checkpoint Alpha";
	_TeleportLocationMarker = "checkpoint";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_armybase": {
	/////////////////////
	//Army base
	/////////////////////
	_TeleportLocationName = "Army Base";
	_TeleportLocationMarker = "army_spawn";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "cop_armyjetbase": {
	/////////////////////
	//Army Jet base
	/////////////////////
	_TeleportLocationName = "Army Jet Base";
	_TeleportLocationMarker = "army_jet_spawn";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_RandomCitySpawns = 1;
	_weaponcheck = 1;
	};
	case "civ_smuggleroute_kavala": {
	/////////////////////
	//Smuggle Route Kavala
	/////////////////////
	_TeleportLocationName = "Kavala City";
	_TeleportLocationMarker = "city_kavala";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_Fee = _Fee + 6000;
	_weaponcheck = 1;
	_smugglecheck = 1;
	_drugcheck = 1;
	};
	case "civ_smuggleroute_pygros": {
	/////////////////////
	//Smuggle Route Kavala
	/////////////////////
	_TeleportLocationName = "Pygros City";
	_TeleportLocationMarker = "city_pygros";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_Fee = _Fee + 2000;
	_weaponcheck = 1;
	_smugglecheck = 1;
	_drugcheck = 1;
	};
	case "civ_smuggleroute_athira": {
	/////////////////////
	//Smuggle Route Kavala
	/////////////////////
	_TeleportLocationName = "Athira City";
	_TeleportLocationMarker = "city_athira";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_Fee = _Fee + 4000;
	_weaponcheck = 1;
	_smugglecheck = 1;
	_drugcheck = 1;
	};
	case "civ_smuggleroute_anth": {
	/////////////////////
	//Smuggle Route anthrakia
	/////////////////////
	_TeleportLocationName = "Anthrakia City";
	_TeleportLocationMarker = "city_anthrakia";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_Fee = _Fee + 3000;
	_weaponcheck = 1;
	_smugglecheck = 1;
	_drugcheck = 1;
	};
	case "civ_smuggleroute_sofia": {
	/////////////////////
	//Smuggle Route anthrakia
	/////////////////////
	_TeleportLocationName = "Sofia City";
	_TeleportLocationMarker = "city_sofia";
	_Fee = round(((player distance2D (getMarkerPos _TeleportLocationMarker))/3.5));
	_Fee = _Fee + 2000;
	_weaponcheck = 1;
	_smugglecheck = 1;
	_drugcheck = 1;
	};
};
uiSleep 0.2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if(_smugglecheck isequalto 1) then {
if (!(uniform player isEqualTo "")) then {_fee = _fee + 2500};
if (!(vest player isEqualTo "")) then {_fee = _fee + 5000};
if (!(headgear player isEqualTo "")) then {_fee = _fee + 2500};
if (!(backpack player isEqualTo "")) then {_fee = _fee + 6000};
if (!(goggles player isEqualTo "")) then {_fee = _fee + 500};
if (!(primaryWeapon player isEqualTo "")) then {_fee = _fee + 5000};
if (!(handgunWeapon player isEqualTo "")) then {_fee = _fee + 2500};
if (!(secondaryWeapon player isEqualTo "")) then {_fee = _fee + 8000};
} else {
};

if(_popup == 1) then {
_window = [
			format["Are you sure you wish to take the bus to %1 ?<br/><br/>It will cost you <t color='#8cff9b'>$ %2</t> in travelling fee's.<br/>This will be deducted from your bank account!",_TeleportLocationName,[_Fee] call life_fnc_numberText],
			"Bus Ride",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
_window = true;
};

if(_window) then {
//Dead and vehicle check
if (vehicle player != player) exitWith { hint "Get out of your vehicle, you can't fit clothes like that!";_bad = 1;};
if(!alive player) exitWith {hint"You are dead so doesn't matter what decision you make";_bad = 1;};
if((player getVariable "restrained")) exitWith {hint"Validating your bus ticket with your hands restrained is gone be hard!";_bad = 1;};
if(life_istazed) exitWith {hint"You are tazed you can't take the bus like that shaking and shit!";_bad = 1;};
if((animationState player) == "Incapacitated") exitWith {hint"You are down on the ground, you can't take the bus like that!";_bad = 1;};

//Checks or not ... 
if(_goldtrafficing isequalto 0) then {
if(life_inv_goldbar > 0) exitWith {hint"You can't smuggle gold on the bus... are you crazy?! They will knock you out and steal it!";_bad = 1;};
} else {
};

if(_drugstrafficing isequalto 0) then {
if(life_inv_heroinUnprocessed > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_heroinProcessed > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_cannabis > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_marijuana > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_cocaineUnprocessed > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_cocaineProcessed > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_methUnprocessed > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
if(life_inv_methProcessed > 0) exitWith {hint"You can't smuggle drugs on the bus... are you crazy?!";_bad = 1;};
} else {
};

if(_blastingcharge isequalto 0) then {
if(life_inv_blastingcharge > 0) exitWith {hint"What are you trying to do! Blow everyone up?! Nobody will notice that explosive of course .... jezuuss !!";_bad = 1;};
} else {
};



UiSleep 0.5;

if(_weaponcheck isequalto 0) then {
if(primaryWeapon player != "") exitWith {hint"A weapon on the bus? Did you took too much drugs or something?";_bad = 1;};
if(handgunWeapon player != "") exitWith {hint"Even a little pistol will look suspicious withouth the correct licensing and rangemaster belt!";_bad = 1;};
if(SecondaryWeapon player != "") exitWith {hint"Of course everybody takes a rocket launcher on the bus ... might need a check up in the head!";_bad = 1;};
} else {
};

if(_RandomCitySpawns isequalto 0) then {
_SpawnLocation = nearestObjects[getMarkerPos  _TeleportLocationMarker, ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],300];
_SpawnLocation = _SpawnLocation call BIS_fnc_selectRandom;
_SpawnLocation = _SpawnLocation buildingPos 0;
_position = _SpawnLocation;
} else {
_position = (getMarkerPos _TeleportLocationMarker);
};

if(BANK <_fee) exitWith {hint format[localize "STR_House_NotEnough"];_bad = 1;};
if(_bad isequalto 1) exitWith {};


//Deduct fee from the bank account.
BANK = BANK - _fee;
uiSleep 0.1;

//End text
titleText [format["Your arrived at %1 and paid $ %2 in travelling fee's!",_TeleportLocationName,[_fee] call life_fnc_numberText],"BLACK"];
uiSleep 1;
player setPos (_position);
uiSleep 1;
hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>ARRIVED<br/><br/></t><t color='#FFFFFF'>You arrived at your destination - %1</t>",_TeleportLocationName];
titleText ["","BLACK IN"];	
} else {
hint parseText format["<t color='#ff0000'><t align='center'><t size='1'>CANCELLED<br/><br/></t>"];
titleText [format["Cancelled"],"PLAIN"];
};
reload player;
