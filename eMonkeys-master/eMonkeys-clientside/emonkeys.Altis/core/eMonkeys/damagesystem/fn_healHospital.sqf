/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(EMonkeys_c164 < 1000) exitWith {hint format["Dir fehlen %1€ für die Behandlung",1000];};
titleText["Bitte stehe still","PLAIN"];
uisleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText["Du musst beim Doktor bleiben.","PLAIN"]};
titleText["Du bist vollständig geheilt.","PLAIN"];


eM_face_hub = 0;
eM_neck = 0;
eM_head = 0;
eM_pelvis = 0;
eM_spine1 = 0;
eM_spine2 = 0;
eM_spine3 = 0;
eM_body = 0; 
eM_arms = 0;
eM_hands = 0;
eM_legs = 0;
eM_damage_null = 0;

EMonkeys_c164 = EMonkeys_c164 - 1000;
[format ["%1",1000],"EMonkeys_fnc_madcash",independent,false] call EMonkeys_fnc_mp;