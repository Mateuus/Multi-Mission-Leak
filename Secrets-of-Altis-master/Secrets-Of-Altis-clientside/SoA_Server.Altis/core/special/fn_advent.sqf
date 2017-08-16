
//hint "Der Adventskalender ist noch nicht verfügbar!";

_tuer = _this select 3;
_tag = realdate select 2;

if(_tag == _tuer) then {

	switch (_tag) do {
		case 1: {if(quest_advent1) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent1 = true; };
		case 2: {if(quest_advent2) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent2 = true; };
		case 3: {if(quest_advent3) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent3 = true; };
		case 4: {if(quest_advent4) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent4 = true; };
		case 5: {if(quest_advent5) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent5 = true; };
		case 6: {if(quest_advent6) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent6 = true; };
		case 7: {if(quest_advent7) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent7 = true; };
		case 8: {if(quest_advent8) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent8 = true; };
		case 9: {if(quest_advent9) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent9 = true; };
		case 10: {if(quest_advent10) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent10 = true; };
		case 11: {if(quest_advent11) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent11 = true; };
		case 12: {if(quest_advent12) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent12 = true; };
		case 13: {if(quest_advent13) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent13 = true; };
		case 14: {if(quest_advent14) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent14 = true; };
		case 15: {if(quest_advent15) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent15 = true; };
		case 16: {if(quest_advent16) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent16 = true; };
		case 17: {if(quest_advent17) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent17 = true; };
		case 18: {if(quest_advent18) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent18 = true; };
		case 19: {if(quest_advent19) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent19 = true; };
		case 20: {if(quest_advent20) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent20 = true; };
		case 21: {if(quest_advent21) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent21 = true; };
		case 22: {if(quest_advent22) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent22 = true; };
		case 23: {if(quest_advent23) exitWith {hint "Dieses Türchen wurde schon geöffnet!"}; ["geschenk",1] call life_fnc_handleinvCheck; quest_advent23 = true; };
		
		case 24: 
		{
			if(quest_advent24) exitWith {hint "Dieses Türchen wurde schon geöffnet!"};
			quest_advent24 = true;
			if(quest_advent1 && quest_advent2 && quest_advent3 && quest_advent4 && quest_advent5 && quest_advent6 && quest_advent7 && quest_advent8 && quest_advent9 && quest_advent10 && quest_advent11 && quest_advent12 && quest_advent13 && quest_advent14 && quest_advent15 && quest_advent16 && quest_advent17 && quest_advent18 && quest_advent19 && quest_advent20 && quest_advent21 && quest_advent22 && quest_advent23 && quest_advent24) then {erfolg_christmas = true; ["erfolg_christmas"] spawn life_fnc_erfolgerhalten; sleep 5;};
		
			10 cutRsc ["life_popup", "PLAIN", 0.5, false];
			playsound "gegenstand";

			_ui = uiNameSpace getVariable "life_popup";
			_name = _ui displayCtrl 6101;
			_pic = _ui displayCtrl 6102;
			_template = _ui displayCtrl 6103;
			_name ctrlSetText "Zamak Transport (Christmas Cola)";
			_pic ctrlSetText "\a3\soft_f_beta\Truck_02\data\ui\portrait_truck_02_ca.paa";
			_template ctrlSetText "images\hud\gegenstanderhalten.paa";
		
			VehCreated = false;
			_vehicle = "I_Truck_02_covered_F" createvehicle (getMarkerPos "temp");
			WaitUntil{!IsNil "_vehicle"};
			[_vehicle,6] remoteExec ["life_fnc_colorVehicle",2];
			[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["SOA_fnc_keyManagement",2];
			_vehicle setVariable ["trunk_in_use",false,true];
			_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
			[(getPlayerUID player),playerSide,_vehicle,6,player] remoteExecCall ["SOA_fnc_vehicleCreate",2];
			WaitUntil{VehCreated};
			[_vehicle,false,player,(damage _vehicle),(fuel _vehicle)] remoteExecCall ["SOA_fnc_vehicleStore",2];
		};
		default {hint "Dies ist nicht das heutige Türchen!"};
	};
} else {
	hint "Dies ist nicht das heutige Türchen!";
};