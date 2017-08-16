/*
    Author: Niklas "Rappelkiste" Quenter
	File: trigger.sqf
	Server: e-Monkeys.com
    
    Description: Create local Trigger
*/
//Savezonen
_trigger_markt = createTrigger ["EmptyDetector", [3647.802,13110.922,0], false];
_trigger_markt setTriggerArea [40, 30, 2.922, true];
_trigger_markt setTriggerActivation ["ANY", "PRESENT", true];
_trigger_markt setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Safezone"",[""Marktplatz Kavala"",""Beachte die Serverregeln""],""#00FF00""] call EMonkeys_fnc_specialText;", " "];

_trigger_parktplatz = createTrigger ["EmptyDetector", [3658.337,13189.307,0], false];
_trigger_parktplatz setTriggerArea [50, 19, 103.759, true];
_trigger_parktplatz setTriggerActivation ["ANY", "PRESENT", true];
_trigger_parktplatz setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Safezone"",[""Parkplatz Kavala"",""Beachte die Serverregeln""],""#00FF00""] call EMonkeys_fnc_specialText; if(vehicle player != player) then {(vehicle player) allowDamage false;};", "if(vehicle player != player) then {(vehicle player) allowDamage true;}"];

_trigger_obstplantage = createTrigger ["EmptyDetector", [4168.873,12997.688,0], false];
_trigger_obstplantage setTriggerArea [80, 80, 0, false];
_trigger_obstplantage setTriggerActivation ["ANY", "PRESENT", true];
_trigger_obstplantage setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Safezone"",[""Obstplantage Kavala"",""Beachte die Serverregeln""],""#00FF00""] call EMonkeys_fnc_specialText;", " "];

_trigger_bananenplantage = createTrigger ["EmptyDetector", [4344.747,13983.947,0], false];
_trigger_bananenplantage setTriggerArea [70, 70, 0, false];
_trigger_bananenplantage setTriggerActivation ["ANY", "PRESENT", true];
_trigger_bananenplantage setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Safezone"",[""Bananenplantage Kavala"",""Beachte die Serverregeln""],""#00FF00""] call EMonkeys_fnc_specialText;", " "];

_trigger_landeplatz = createTrigger ["EmptyDetector", [3646.85,13379.182,0], false];
_trigger_landeplatz setTriggerArea [50, 23.5, 130.958, true];
_trigger_landeplatz setTriggerActivation ["ANY", "PRESENT", true];
_trigger_landeplatz setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Safezone"",[""Landeplatz Kavala"",""Beachte die Serverregeln""],""#00FF00""] call EMonkeys_fnc_specialText;", " "];

//Sperrzonen
_trigger_ps_kavala = createTrigger ["EmptyDetector", [3257.437,12928.357,0], false];
_trigger_ps_kavala setTriggerArea [110, 50, 165.519, false];
_trigger_ps_kavala setTriggerActivation ["ANY", "PRESENT", true];
_trigger_ps_kavala setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Sperrzone"",[""Polizeistation Kavala"",""Verlassen Sie das Gebiet umgehend""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];

_trigger_feuer_hq = createTrigger ["EmptyDetector", [4185.473,12840.103,0], false];
_trigger_feuer_hq setTriggerArea [44, 36, 223.027, true];
_trigger_feuer_hq setTriggerActivation ["ANY", "PRESENT", true];
_trigger_feuer_hq setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Sperrzone"",[""Feuerwehr Hauptwache"",""Verlassen Sie das Gebiet umgehend""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];

_trigger_polizei_hq = createTrigger ["EmptyDetector", [16063.019,16986.03,0], false];
_trigger_polizei_hq setTriggerArea [115, 160, 0, false];
_trigger_polizei_hq setTriggerActivation ["ANY", "PRESENT", true];
_trigger_polizei_hq setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Sperrzone"",[""Polizei Hauptquartier"",""Verlassen Sie das Gebiet umgehend""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];

_trigger_staatsbank = createTrigger ["EmptyDetector", [16700.568,13575.929,0], false];
_trigger_staatsbank setTriggerArea [200, 200, 0, false];
_trigger_staatsbank setTriggerActivation ["ANY", "PRESENT", true];
_trigger_staatsbank setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Sperrzone"",[""Staatsbank der Republik Altis"",""Verlassen Sie das Gebiet umgehend""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];

_trigger_ps_autobahn = createTrigger ["EmptyDetector", [23533.012,19934.393,0], false];
_trigger_ps_autobahn setTriggerArea [29, 27, 323.723, true];
_trigger_ps_autobahn setTriggerActivation ["ANY", "PRESENT", true];
_trigger_ps_autobahn setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Sperrzone"",[""Autobahnpolizei Altis"",""Verlassen Sie das Gebiet umgehend""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];

//Sonstige
_trigger_monkey_athira = createTrigger ["EmptyDetector", [14190.535,21231.455,0], false];
_trigger_monkey_athira setTriggerArea [55, 40, 0, false];
_trigger_monkey_athira setTriggerActivation ["ANY", "PRESENT", true];
_trigger_monkey_athira setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Monkey Club"",[""Willkommen am Monkey Club"",""der Region Athira bis Kavala""],""#CC00FF""] call EMonkeys_fnc_specialText;", " "];

_trigger_monkey_pyrgos = createTrigger ["EmptyDetector", [20227.55,12963.67,0], false];
_trigger_monkey_pyrgos setTriggerArea [50, 50, 159.947, false];
_trigger_monkey_pyrgos setTriggerActivation ["ANY", "PRESENT", true];
_trigger_monkey_pyrgos setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Monkey Club"",[""Willkommen am Monkey Club"",""der Region Pyrgos bis Sofia""],""#CC00FF""] call EMonkeys_fnc_specialText;", " "];

_trigger_waffenschieber_a = createTrigger ["EmptyDetector", [11745.155,18298.811,0], false];
_trigger_waffenschieber_a setTriggerArea [27, 27, 0, false];
_trigger_waffenschieber_a setTriggerActivation ["ANY", "PRESENT", true];
_trigger_waffenschieber_a setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Waffenschieber"",[""Willkommen am Waffenschieber"",""der Region Athira""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];

_trigger_waffenschieber_s = createTrigger ["EmptyDetector", [23662.086,21706.766,0], false];
_trigger_waffenschieber_s setTriggerArea [20, 20, 0, false];
_trigger_waffenschieber_s setTriggerActivation ["ANY", "PRESENT", true];
_trigger_waffenschieber_s setTriggerStatements ["this && (local player) && (vehicle player in thisList) && (getPosATL player select 2 < 50) && (side player in [civilian,east])", "[""Waffenschieber"",[""Willkommen am Waffenschieber"",""der Region Sofia""],""#FF0000""] call EMonkeys_fnc_specialText;", " "];
