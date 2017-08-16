#include "..\script_macros.hpp"
/*
   File: fn_sirens.sqf
   Author: Basti aka. John Collins
   
   Description:
   This file was written for Eisenschmiede-Gaming.de
*/

disableSerialization;

_sirene = _this select 0;

_objsof = (nearestObjects [getmarkerpos "sir_sof",["Land_Loudspeakers_F"],20]) select 0;
_objkav = (nearestObjects [getmarkerpos "sir_kav",["Land_Loudspeakers_F"],20]) select 0;
_objkavhq = (nearestObjects [getmarkerpos "sir_kavhq",["Land_Offices_01_V1_F"],50]) select 0;
_objkavkr = (nearestObjects [getmarkerpos "sir_kavkr",["Land_Hospital_main_F"],20]) select 0;
_objat = (nearestObjects [getmarkerpos "sir_at",["Land_Loudspeakers_F"],20]) select 0;
_objpyr = (nearestObjects [getmarkerpos "sir_pyr",["Land_Loudspeakers_F"],20]) select 0;

//Dialoge finden

_kavtext = CONTROL(9876,9999);
_kavseutext = CONTROL(9876,9994);
_kavhqtext = CONTROL(9876,9998);
_kavkrtext = CONTROL(9876,9997);
_attext = CONTROL(9876,9996); 
_pyrtext = CONTROL(9876,9995);
_softext = CONTROL(9876,9993);
_testtext = CONTROL(9876,9992);

switch (_sirene) do 
{
	case 0:
	{
		//Dieser Teil ist unnötig macht nur ne Abfrage
		if (ES_sir_kav) then
		{
		_kavtext ctrlSetText "Kavala Sirene: Aktiviert";
		}else{
		_kavtext ctrlSetText "Kavala Sirene: Deaktiviert";
		};

		if (ES_sir_kavseu) then
		{
		_kavseutext ctrlSetText "Kavala Seuchen Sirene: Aktiviert";
		}else{
		_kavseutext ctrlSetText "Kavala Seuchen Sirene: Deaktiviert";
		};

		if (ES_sir_kavhq) then
		{
		_kavhqtext ctrlSetText "Kavala HQ Sirene: Aktiviert";
		}else{
		_kavhqtext ctrlSetText "Kavala HQ Sirene: Deaktiviert";
		};

		if (ES_sir_kavkr) then
		{
		_kavkrtext ctrlSetText "Kavala Krankenhaus Sirene: Aktiviert";
		}else{
		_kavkrtext ctrlSetText "Kavala Krankenhaus Sirene: Deaktiviert";
		};

		if (ES_sir_at) then
		{
		_attext ctrlSetText "Athira Sirene: Aktiviert";
		}else{
		_attext ctrlSetText "Athira Sirene: Deaktiviert";
		};

		if (ES_sir_pyr) then
		{
		_pyrtext ctrlSetText "Pyrgos Sirene: Aktiviert";
		}else{
		_pyrtext ctrlSetText"Pyrgos Sirene: Deaktiviert";
		};

		if (ES_sir_sof) then
		{
		_softext ctrlSetText "Sofia Sirene: Aktiviert";
		}else{
		_softext ctrlSetText "Sofia Sirene: Deaktiviert";
		};

		if (ES_sir_test) then
		{
		_testtext ctrlSetText "Testalarm: Aktiviert";
		}else{
		_testtext ctrlSetText "Testalarm: Deaktiviert";
		};

		if (FETCH_CONST(ES_adminlevel) <= 5) then {
		ctrlShow[1234567,false];
		};
	};

	case 1:
    {
    	//Kavala und so
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_kav || ES_sir_basti) exitWith {hintSilent "Kavala Sirene schon aktiviert"};

		_action_kav = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_kav) then {

		ES_sir_kav = true;

		hint "Sirene aktiviert !";
	
		[[_objkav,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

	    ES_sir_kav = false;

	    _toLog = "Sirene";
    	_toLog2 ="Kavala";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 2:
	{
		//Aus - Knopf Action
		if (ES_sir_kav) then {
		ES_sir_kav = false;
		}else{
		hintSilent "Kavala Sirene schon deaktiviert";
		};
	};

    //Restliche Sirenen und Co.

	case 3:
	{
		if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

		if (ES_sir_kavseu)	exitWith {hint "Sirene läuft bereits !"};

		_action_kavseu = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_kavseu) then {

		hint "Sirene aktiviert !";

		ES_sir_kavseu = true;

		[[1,"HINWEIS \n \nSeuchenalarm in Kavala wurde ausgelöst."],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
	    [titleText["Achtung ! Seuchenalarm in Kavala !.","PLAIN"]] spawn ES_fnc_MP;

		[[_objkav,"seuchen"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

	    ES_sir_kavseu = false;

	    _toLog = "Sirene";
    	_toLog2 ="Kavala (Seuche)";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 4:
	{
		if (ES_sir_kavseu) then {
		ES_sir_kavseu = false;
		}else{
		hintSilent "Kavala Seuche Sirene schon deaktiviert";
		};
	};

	case 5:
    {
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_kavhq) exitWith {hint "Sirene läuft bereits !"};

		_action_kavhq = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_kavhq) then {

		hint "Sirene aktiviert !";

		ES_sir_kavhq = true;

		if (playerside == independent) then {
	    [[1,"HINWEIS \n \nFeueralarm im Kavala Polizei HQ wurde ausgelöst."],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
	    sleep 3;
	    [titleText["Achtung ! Feueralarm im Kavala Polizei HQ !.","PLAIN"]] spawn ES_fnc_MP;
	    };

		[[_objkavhq,"brand"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

	    ES_sir_kavhq = false;

	    _toLog = "Sirene";
    	_toLog2 ="Kavala HQ";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;

	};

	case 6:
	{
		if (ES_sir_kavhq) then {
		ES_sir_kavhq = false;
		}else{
		hintSilent "Kavala HQ Sirene schon deaktiviert";
		};
	};

	case 7:
    {
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_kavkr) exitWith {hint "Sirene läuft bereits !"};

		_action_kavkr = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_kavkr) then {

		hint "Sirene aktiviert !";

		ES_sir_kavkr = true;

		if (playerside == independent) then {
	    [[1,"HINWEIS \n \nFeueralarm im Kavala Krankenhaus wurde ausgelöst."],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
	    sleep 3;
	    [titleText["Achtung ! Feueralarm im Kavala Krankenhaus !.","PLAIN"]] spawn ES_fnc_MP;
	    };

		[[_objkavkr,"brand"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

		ES_sir_kavkr = false;

		_toLog = "Sirene";
    	_toLog2 ="Kavala Krankenhaus";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 8:
	{
		if (ES_sir_kavkr) then {
		ES_sir_kavkr = false;
		}else{
		hintSilent "Kavala Krankenhaus Sirene schon deaktiviert";
		};
	};

	case 9:
    {
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_at)	exitWith {hint "Sirene läuft bereits !"};

		_action_at = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_at) then {

		hint "Sirene aktiviert !";

		ES_sir_at = true;

		[[_objat,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

		ES_sir_at = false;

		_toLog = "Sirene";
    	_toLog2 ="Athira";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 10:
	{
		if (ES_sir_at) then {
		ES_sir_at = false;
		}else{
		hintSilent "Athira Sirene schon deaktiviert";
		};
	};

	case 11:
    {
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_pyr)	exitWith {hint "Sirene läuft bereits !"};

		_action_pyr = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_pyr) then {

		hint "Sirene aktiviert !";

		ES_sir_pyr = true;

		[[_objpyr,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

		ES_sir_pyr = false;

		_toLog = "Sirene";
    	_toLog2 ="Pyrgos";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 12:
	{
		if (ES_sir_pyr) then {
		ES_sir_pyr = false;
		}else{
		hintSilent "Pyrgos Sirene schon deaktiviert";
		};
	};

	case 13:
    {
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_sof)	exitWith {hint "Sirene läuft bereits !"};

		_action_sof = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_sof) then {

		hint "Sirene aktiviert !";

		ES_sir_sof = true;

		[[_objsof,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 50;

		ES_sir_sof = false;

		_toLog = "Sirene";
    	_toLog2 ="Sofia";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 14:
	{
		if (ES_sir_sof) then {
		ES_sir_sof = false;
		}else{
		hintSilent "Sofia Sirene schon deaktiviert";
		};
	};

	case 15:
	{
		if(!ES_sir_kav && !ES_sir_sof && !ES_sir_pyr && !ES_sir_at && !ES_sir_kavkr && !ES_sir_kavhq && !ES_sir_kavseu) then {
			hintSilent "Alle Sirenen sind schon aus !";
		}else{
		ES_sir_kav = false;
		ES_sir_sof = false;
		ES_sir_pyr = false;
		ES_sir_at = false;
		ES_sir_kavkr = false;
		ES_sir_kavhq = false;
		ES_sir_kavseu = false;
		hintSilent "Alle Sirenen wurden deaktiviert !";
		};
	};

	case 16:
	{

		if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

		if(ES_sir_kav || ES_sir_sof || ES_sir_pyr || ES_sir_at || ES_sir_kavkr || ES_sir_kavhq) exitWith {
			hintSilent "Einzelne Sirenen sind noch an !";
		};

		if (ES_sir_all) exitWith {hint "Sirene läuft bereits !"};

		_action_all = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_all) then {

		hint "Alle Sirenen wurden aktiviert !";

		ES_sir_all = true;

		[[_objkav,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objkavhq,"brand"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objkavkr,"brand"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objat,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objsof,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objpyr,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 90;

		ES_sir_all = false;

		_toLog = "Sirene";
    	_toLog2 ="Alle";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 17:
	{
		if(ES_sir_kav || ES_sir_sof || ES_sir_pyr || ES_sir_at || ES_sir_kavkr || ES_sir_kavhq || ES_sir_all) exitWith {hintSilent "Einzelne Sirenen sind noch an !"};

		if(ES_sir_test) exitWith {hint "Testalarm läuft bereits !"};

		_action_test = [
			format ["Möchtest du wirklich den Testalarm aktivieren ?<br/>Denke daran dies kann Chaos verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_test) then {

		hint "Test gestartet !";

		ES_sir_test = true;

		[[1,"HINWEIS \n \nTestalarm für sämtliche Sirenen wurde ausgelöst !"],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
	    [titleText["Achtung ! Testalarm für sämtliche Sirenen wurde ausgelöst !","PLAIN"]] spawn ES_fnc_MP;

		[[_objkav,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objkavhq,"brand"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objkavkr,"brand"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objat,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objsof,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		[[_objpyr,"nuclear"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;

		sleep 80;

		hint "Der Testalarm wurde beendet !";
		sleep 2;
		[[1,"HINWEIS \n \nTestalarm für sämtliche Sirenen wurde beendet !"],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
		[titleText["Achtung ! Testalarm für sämtliche Sirenen wurde beendet ! ","PLAIN"]] spawn ES_fnc_MP;
	    };

	    ES_sir_test = false;

	    _toLog = "Sirene";
    	_toLog2 ="Testalarm";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};

	case 18:
    {
    	//Kavala und so
    	if (ES_sir_test) exitWith {hint "Der Testalarm läuft !"};

    	if (ES_sir_basti || ES_sir_kav) exitWith {hint "Basti oder Kavala Sirene schon aktiviert"};

		_action_basti = [
			format ["Möchtest du wirklich die Sirene aktivieren ?<br/>Denke daran dies kann eine Party verursachen !"],
			 "Sirene aktivieren ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;

		if (_action_basti) then {

		ES_sir_basti = true;

		hint "Sirene aktiviert !";

		[[1,"HINWEIS \n PARTYALARM in Kavala wurde für 4 Min ausgelöst.\n Nehme die Ohrstöpsel raus für max. Effekt !"],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
	    [titleText["Achtung ! PARTYALARM in Kavala ! Nehme die Ohrstöpsel raus für max. Effekt !","PLAIN"]] spawn ES_fnc_MP;
	
		[[_objkav,"party"],"ES_fnc_globalSoundClient",true,false] spawn ES_fnc_MP;
		};

		sleep 250;

		[[1,"HINWEIS \n Der Partyalarm in Kavala ist leider schon vorbei !"],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;
	    [titleText["Achtung ! Der Partyalarm in Kavala ist leider schon vorbei !","PLAIN"]] spawn ES_fnc_MP;

	    ES_sir_basti = false;

	    _toLog = "Sirene";
    	_toLog2 ="Basti";
   		[["ADMIN_LOG",[""], player getVariable["realname",name player], getPlayerUID player, _toLog, _toLog2],"ES_fnc_logIt",false,false] call ES_fnc_MP;
	};
};