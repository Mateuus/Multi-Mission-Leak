/*
!!!!!!!!!! In Arbeit !!!!!!!!!!!
	File: fn_profData
	Author: Leo
	Description: Gives Prof Data (work in progress)
*/

Private ["_type","_data","_time","_multi"];

_type = param [0,"",[""]];
if (_type == "") exitWith {};
_data = missionNamespace getVariable (_type);
_time = 0;
_multi = 0;
_ret = [];

switch ( _type ) do
{
	case "Arrest_Prof": {
	};
	case "Bottling_Prof": {
	};
	case "Brewing_Prof": {
	};
	case "Cannabis_Prof": {
	};
	case "Citizen_Prof": {
	};
	case "Cocaine_Prof": {
	};
	case "Copper_Prof": {
	};
	case "Criminal_Prof": {
	};
	case "Diamond_Prof": {
	};
	case "Distilling_Prof": {
	};
	case "Fishing_Prof": {
	};
	case "Fruit_Prof": {
	};
	case "Hero_Prof": {
	};
	case "Heroin_Prof": {
	};
	case "Hunting_Prof": {
	};
	case "Impound_Prof": {
	};
	case "Iron_Prof": {
	};
	case "Krok_Prof": {
	};
	case "Meth_Prof": {
	};
	case "Oil_Prof": {
	};
	case "Revive_Prof": {
	};
	case "Rock_Prof": {
	};
	case "Rogue_Prof": {
	};
	case "Salt_Prof": {
	};
	case "Sand_Prof": {
	};
	case "Shining_Prof": {
	};
	case "Thief_Prof": {
	};
	case "Ticket_Prof": {
	};
	case "Weed_Prof": { // not used jet (leo)
		switch ( _data select 0 ) do {
			case 0: { _time = 0.005; _multi = 0.009; };
			case 1: { _time = 0.006; _multi = 0.01; };
			case 2: { _time = 0.007; _multi = 0.01; };
			case 3: { _time = 0.008; _multi = 0.01; };
			case 4: { _time = 0.009; _multi = 0.01; };
			case 5: { _time = 0.01; _multi = 0.01; };
			case 6: { _time = 0.015; _multi = 0.02; };
			case 7: { _time = 0.02; _multi = 0.03; };
			case 8: { _time = 0.025; _multi = 0.04; };
			case 9: { _time = 0.03; _multi = 0.05; };
			case 10: { _time = 0.035; _multi = 0.07; };
			case 11: { _time = 0.04; _multi = 0.08; };
			case 12: { _time = 0.045; _multi = 0.09; };
			case 13: { _time = 0.05; _multi = 0.09; };
			case 14: { _time = 0.055; _multi = 0.09; };
			case 15: { _time = 0.06; _multi = 0.10; };
			case 16: { _time = 0.065; _multi = 0.11; };
			case 17: { _time = 0.07; _multi = 0.12; };
			case 18: { _time = 0.075; _multi = 0.12; };
			case 19: { _time = 0.08; _multi = 0.13; };
			case 20: { _time = 0.085; _multi = 0.14; };
		};
	};
	case "Smoke_Prof": {
		switch ( _data select 0 ) do {
			case 0: { _time = 60; _multi = 0.009; };
			case 1: { _time = 120; _multi = 0.009; };
			case 2: { _time = 180; _multi = 0.01; };
			case 3: { _time = 240; _multi = 0.01; };
			case 4: { _time = 300; _multi = 0.01; };
			case 5: { _time = 360; _multi = 0.01; };
			case 6: { _time = 420; _multi = 0.01; };
			case 7: { _time = 480; _multi = 0.02; };
			case 8: { _time = 540; _multi = 0.03; };
			case 9: { _time = 600; _multi = 0.04; };
			case 10: { _time = 660; _multi = 0.05; };
			case 11: { _time = 720; _multi = 0.07; };
			case 12: { _time = 780; _multi = 0.08; };
			case 13: { _time = 840; _multi = 0.09; };
			case 14: { _time = 900; _multi = 0.09; };
			case 15: { _time = 960; _multi = 0.09; };
			case 16: { _time = 1020; _multi = 0.10; };
			case 17: { _time = 1080; _multi = 0.11; };
			case 18: { _time = 1140; _multi = 0.12; };
			case 19: { _time = 1200; _multi = 0.12; };
			case 20: { _time = 1260; _multi = 0.13; };
		};
	};
	case "Repair_Prof": {
		switch ( _data select 0 ) do {
			case 0: { _time = 100; _multi = 1; };
			case 1: { _time = 97; _multi = 0.97; };
			case 2: { _time = 94; _multi = 0.94; };
			case 3: { _time = 91; _multi = 0.91; };
			case 4: { _time = 88; _multi = 0.88; };
			case 5: { _time = 85; _multi = 0.85; };
			case 6: { _time = 82; _multi = 0.82; };
			case 7: { _time = 79; _multi = 0.79; };
			case 8: { _time = 76; _multi = 0.76; };
			case 9: { _time = 73; _multi = 0.73; };
			case 10: { _time = 70; _multi = 0.7; };
			case 11: { _time = 67; _multi = 0.67; };
			case 12: { _time = 64; _multi = 0.64; };
			case 13: { _time = 61; _multi = 0.61; };
			case 14: { _time = 58; _multi = 0.58; };
			case 15: { _time = 55; _multi = 0.55; };
			case 16: { _time = 52; _multi = 0.52; };
			case 17: { _time = 49; _multi = 0.49; };
			case 18: { _time = 46; _multi = 0.46; };
			case 19: { _time = 43; _multi = 0.43; };
			case 20: { _time = 40; _multi = 0.4; };
		};
	};
	case "RedGull_Prof": {
		switch ( _data select 0 ) do {
			case 0: { _time = 180; _multi = 0.009; };
			case 1: { _time = 189; _multi = 0.009; };
			case 2: { _time = 198; _multi = 0.01; };
			case 3: { _time = 216; _multi = 0.01; };
			case 4: { _time = 225; _multi = 0.01; };
			case 5: { _time = 234; _multi = 0.01; };
			case 6: { _time = 243; _multi = 0.01; };
			case 7: { _time = 252; _multi = 0.02; };
			case 8: { _time = 261; _multi = 0.03; };
			case 9: { _time = 270; _multi = 0.04; };
			case 10: { _time = 279; _multi = 0.05; };
			case 11: { _time = 288; _multi = 0.07; };
			case 12: { _time = 297; _multi = 0.08; };
			case 13: { _time = 306; _multi = 0.09; };
			case 14: { _time = 315; _multi = 0.09; };
			case 15: { _time = 324; _multi = 0.09; };
			case 16: { _time = 333; _multi = 0.10; };
			case 17: { _time = 342; _multi = 0.11; };
			case 18: { _time = 351; _multi = 0.12; };
			case 19: { _time = 360; _multi = 0.12; };
			case 20: { _time = 369; _multi = 0.13; };
		};
	};
	case "shooting_Prof": {
		switch ( _data select 0 ) do {
			case 0: { _time = 0; _multi = 1.55; };
			case 1: { _time = 0; _multi = 1.5; };
			case 2: { _time = 0; _multi = 1.45; };
			case 3: { _time = 0; _multi = 1.4; };
			case 4: { _time = 0; _multi = 1.35; };
			case 5: { _time = 0; _multi = 1.3; };
			case 6: { _time = 0; _multi = 1.25; };
			case 7: { _time = 0; _multi = 1.2; };
			case 8: { _time = 0; _multi = 1.15; };
			case 9: { _time = 0; _multi = 1.1; };
			case 10: { _time = 0; _multi = 1.05; };
			case 11: { _time = 0; _multi = 1; };
			case 12: { _time = 0; _multi = 0.95; };
			case 13: { _time = 0; _multi = 0.9; };
			case 14: { _time = 0; _multi = 0.85; };
			case 15: { _time = 0; _multi = 0.8; };
			case 16: { _time = 0; _multi = 0.75; };
			case 17: { _time = 0; _multi = 0.7; };
			case 18: { _time = 0; _multi = 0.65; };
			case 19: { _time = 0; _multi = 0.6; };
			case 20: { _time = 0; _multi = 0.55; };
		};
	};
	case "ADAC_Prof": {
		switch ( _data select 0 ) do {
			case 0: { _time = 180; _multi = 0.009; };
			case 1: { _time = 189; _multi = 0.009; };
			case 2: { _time = 198; _multi = 0.01; };
			case 3: { _time = 216; _multi = 0.01; };
			case 4: { _time = 225; _multi = 0.01; };
			case 5: { _time = 234; _multi = 0.01; };
			case 6: { _time = 243; _multi = 0.01; };
			case 7: { _time = 252; _multi = 0.02; };
			case 8: { _time = 261; _multi = 0.03; };
			case 9: { _time = 270; _multi = 0.04; };
			case 10: { _time = 279; _multi = 0.05; };
			case 11: { _time = 288; _multi = 0.07; };
			case 12: { _time = 297; _multi = 0.08; };
			case 13: { _time = 306; _multi = 0.09; };
			case 14: { _time = 315; _multi = 0.09; };
			case 15: { _time = 324; _multi = 0.09; };
			case 16: { _time = 333; _multi = 0.10; };
			case 17: { _time = 342; _multi = 0.11; };
			case 18: { _time = 351; _multi = 0.12; };
			case 19: { _time = 360; _multi = 0.12; };
			case 20: { _time = 369; _multi = 0.13; };
		};
	};
};
_ret = [_time,_multi];

_ret