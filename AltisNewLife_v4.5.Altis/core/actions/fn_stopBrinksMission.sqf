#define GETC(var) (call var)
/*
	File: fn_stopBMission.sqf
	Author: Mash6 <Altis Life: Evolution> -- http://www.altislife-evolution.fr/ --
	
	Description:
	Stop Brinks Mission
*/

private["_prime","_money","_moneyLeft","_pos"];


// 5 Checks, license, service taked, mission not taked, vehicel dead/no more existing, vehicle too far
if(GETC(life_tafflevel) != 8) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous n'êtes pas un employé de la Brinks !","PLAIN"];};
if(!brinks_inMission) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous n'êtes pas en service !","PLAIN"];};
if((!(alive brinksVehic)) OR (brinksVehic == ObjNull)) exitWith {
	titleText["\n\n\n\n\n\n\n\n\n\n\n\nVotre véhicule est détruit ou n'existe plus !\n Votre mission est un echec !","PLAIN"];
	brinksVehic = ObjNull;
	brinks_moneyStart = 0;
	brinks_inMission = false;
};
if((player distance brinksVehic) > 15) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVotre camion est trop loin !","PLAIN"];};
if(brinksVehic getVariable ["holdup",false]) exitWith {
	titleText["\n\n\n\n\n\n\n\n\n\n\n\nVotre véhicule a été braqué !\n Votre mission est un echec !","PLAIN"];
	deleteVehicle brinksVehic;
	brinks_moneyStart = 0;
	brinks_inMission = false;
};

// Get left money in truck and delete veh
_money = brinksVehic getVariable ["money",0];
deleteVehicle brinksVehic;

// Differents GVars handling
brinks_inMission = false;
_prime = round((brinks_moneyStart - _money) / 2);
compte_banque = compte_banque + _prime;
brinksVehic = ObjNull;
brinks_moneyStart = 0;

titleText[format["\n\n\n\n\n\n\n\n\n\n\n\nVous avez reçu %1 € de prime !",_prime],"PLAIN"];