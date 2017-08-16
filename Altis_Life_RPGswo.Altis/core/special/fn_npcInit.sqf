/*
	File: fn_npcInit.sqf
	Author: MarkusSR1984

	Description:
	Setzt die Init Funktionen für NPCs
	[this,""] call DWEV_fnc_npcInit;
*/

private ["_object","_type","_params","_createMarker"];

diag_log format ["========================  Called npcInit.sqf with Parqams %1",_this];

_object = param [0,ObjNull,[ObjNull]];
_type = param [1,"",[""]];

switch (count _this) do
{
	case 2:
	{
		_params = [];
		_createMarker = false;
	};
	case 3:
	{
		_params = param [2,[],[[],false]];
		if ((typeName _params) == "Array") then
		{
			_createMarker = false;
		}
		else
		{
			_createMarker = _params;
			_params = [];
		};
	};
	case 4:
	{
		_params = param [2,[],[[]]];
		_createMarker = param [3,false,[false]];
	};
};


if (!hasInterface) exitWith
	{
		//diag_log "fn_npcInit.sqf wurde vorzeitig Beendet weil das hier kein Spieler ist";
		//diag_log "NPCs und Map Items sollten noch überarbeitet werden: Stichwort:createVehicleX";
		_object enableSimulation false;
		_object allowDamage false;
	};

switch (_type) do
{
    case "PaintballLobbyNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\waffe.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 '];
		_this addAction["Team Blau (5000€)",{["blau",true] call DWEV_fnc_painballSelectSide;},"",0,false,false,"",'!(_this getVariable["DWEV_paintball_sidelock",false]) && player distance _target < 4'];
		_this addAction["Team Rot (5000€)",{["rot",true] call DWEV_fnc_painballSelectSide;},"",0,false,false,"",'!(_this getVariable["DWEV_paintball_sidelock",false]) && player distance _target < 4'];
		_this addAction["ZUR ARENA",{[] call DWEV_fnc_painballArena;},"",0,false,false,"",'!((_this getVariable["pballSide",""]) == "") && player distance _target < 4'];
		_this addAction["AUSGANG",{[] call DWEV_fnc_painballLeafLobby;},"",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "PaintballEntryNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\waffe.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#ADFF2F'>Paintball (15000€)</t>",{[] call DWEV_fnc_painballLobby;},"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 '];
		_this addAction[format["%1 (€%2)",(getText(missionConfigFile >> "Licenses" >> "sppaint" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "sppaint" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"sppaint",0,false,false,"",' !lc_sppaint && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"paintball",0,false,false,"",'player distance _target < 4'];
		};
	};

	//POLIZEI Ausrüstungs NPC`s

	case "Polizei_ausruestung":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\waffe.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Kantine",DWEV_fnc_virt_menu,"cop",0,false,false,"",'player distance _target < 4'];
		_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"Cop",0,false,false,"",'player distance _target < 4'];
		_this addAction["Weaponfree Waffen",DWEV_fnc_weaponShopMenu,"Weaponfree",0,false,false,"",'actionWeaponfree && player distance _target < 4'];
		_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo west)'];
		_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"cop",0,false,false,"",'!actionWeaponfree && player distance _target < 4'];
		};
	};

	//POLIZEI Autos

	case "Kavala_Cop_Fahrzeuge":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_1","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_1"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "Sofia_Cop_Fahrzeuge":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_4","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_4"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'(side player) == west && !DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "kontrolle1_Cop_Fahrzeuge":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_8","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_8"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "athira_Cop_Fahrzeuge":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_2","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_2"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "KavalaPoliceBoatNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Polizei Bootshändler",DWEV_fnc_vehicleShopMenu,["cop_ship",west,"cop_ship_1","cop","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Feuerwehr Bootshändler",DWEV_fnc_vehicleShopMenu,["medic_ship",independent,"cop_ship_1","med","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Polizei Boot Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_ship_1"; DWEV_garage_type = "Ship";},"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Feuerwehr Boot Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_ship_1"; DWEV_garage_type = "Ship";},"",0,false,false,"",' (side player) == independent && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		};
	};

	case "KavalaPoliceAirNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_1","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_1";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "SofiaPoliceAirNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_4","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_4";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'(side player) == west && !DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "pyrgosPolicebootNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Polizei Bootshändler",DWEV_fnc_vehicleShopMenu,["cop_ship",west,"cop_ship_2","cop","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Feuerwehr Bootshändler",DWEV_fnc_vehicleShopMenu,["medic_ship",independent,"cop_ship_2","med","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Polizei Boot Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_ship_2"; DWEV_garage_type = "Ship";},"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Feuerwehr Boot Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_ship_2"; DWEV_garage_type = "Ship";},"",0,false,false,"",' (side player) == independent && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		};
	};

	case "pyrgosPolicecarNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_3","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_3"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "pyrgosPoliceairNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_3","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_3";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "airhqPolice":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_2","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_2";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};
	case "airhqPolicecar":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_9","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_9"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "kontroll2police_car":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_5","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_5"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "GeorgetownPoliceAirNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_2","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_2";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "Georgetown_Cop_Fahrzeuge":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_2","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_2"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "GeorgetownPoliceBoatNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Polizei Bootshändler",DWEV_fnc_vehicleShopMenu,["cop_ship",west,"cop_ship_2","cop","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Feuerwehr Bootshändler",DWEV_fnc_vehicleShopMenu,["medic_ship",independent,"cop_ship_2","med","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Polizei Boot Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_ship_2"; DWEV_garage_type = "Ship";},"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Feuerwehr Boot Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_ship_2"; DWEV_garage_type = "Ship";},"",0,false,false,"",' (side player) == independent && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		};
	};

	case "RavitaPoliceAirNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_1","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_1";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "Ravita_Cop_Fahrzeuge":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Autohändler",DWEV_fnc_vehicleShopMenu,["cop_car",west,"cop_car_1","cop","Autohändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_car_1"; DWEV_garage_type = "Car";  },"",0,false,false,"",' (side player) == west && player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	case "LijnhavenPoliceAirNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Händler",DWEV_fnc_vehicleShopMenu,["cop_air",west,"cop_air_4","cop","Heli-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "cop_air_4";  },"",0,false,false,"",' (side player) == west && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == west'];
		};
	};

	//Rebellen

	case "Rebellenwaffennpc":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\waffe.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Bistro",DWEV_fnc_virt_menu,"rebbistro",0,false,false,"",' lc_rebel && (side player) == civilian && player distance _target < 4'];
		_this addAction["Rebellen Kleidung",DWEV_fnc_clothingMenu,"reb",0,false,false,"",' lc_rebel && (side player) == civilian && player distance _target < 4'];
		_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'lc_rebel && player distance _target < 4'];
		_this addAction["Rebellen Waffen",DWEV_fnc_weaponShopMenu,"rebel",0,false,false,"",'!actionWeaponfree && lc_rebel && (side player) == civilian && player distance _target < 4'];
		_this addAction["Weaponfree Waffen",DWEV_fnc_weaponShopMenu,"Weaponfree",0,false,false,"",'actionWeaponfree && lc_rebel && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 '];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "rebel" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "rebel" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"rebel",0,false,false,"",' !lc_rebel && (side player) == civilian && player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "airkampf" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "airkampf" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"airkampf",0,false,false,"",' lc_rebel && (side player) == civilian && !lc_airkampf && player distance _target < 4 '];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"rebellenshop",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "rebellen_car_suedmitte":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Rebellen Fahrzeuge",DWEV_fnc_vehicleShopMenu,["reb_v",civilian,"reb_v_2","reb","Rebellen Fahrzeuge"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "rebellen_car_nord":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Rebellen Fahrzeuge",DWEV_fnc_vehicleShopMenu,["reb_v",civilian,"reb_v_1","reb","Rebellen Fahrzeuge"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "rebellen_car_suedost":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Rebellen Fahrzeuge",DWEV_fnc_vehicleShopMenu,["reb_v",civilian,"reb_v_3","reb","Rebellen Fahrzeuge"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "rebellen_car_vatukoulo":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Rebellen Fahrzeuge",DWEV_fnc_vehicleShopMenu,["reb_v",civilian,"reb_v_3","reb","Rebellen Fahrzeuge"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	//Zivi Fahrzeughändler / Garagen

	//Heli/Jet
	case "jethaendler":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Jethändler",DWEV_fnc_vehicleShopMenu,["civ_jet",civilian,"civ_jet_1","civ","Jethändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];  DWEV_garage_type = "Air"; createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "civ_jet_1";  },"",0,false,false,"",'player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",  {   private["_nearVehicle"];   _nearVehicle = nearestObjects[(getPos (_this select 0)),["Car","Ship","Air"],35] select 0;   if(isNil "_nearVehicle") exitWith {hint "Es ist kein Fahrzeug in der nähe vom NPC.";};   [_nearVehicle,false,(_this select 1)] remoteExec ["DWF_fnc_vehicleStore",2];   hint "Der Server versucht das Fahrzeug zu parken....";   DWEV_garage_store = true;  },"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "airjet" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "airjet" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"airjet",0,false,false,"",' lc_rebel && (side player) == civilian && !lc_airjet && player distance _target < 4'];
		};
	};

	case "athira_heli":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Helihändler",DWEV_fnc_vehicleShopMenu,["civ_air",civilian,"civ_air_1","civ","Helihändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "sofia_heli":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Helihändler",DWEV_fnc_vehicleShopMenu,["civ_air",civilian,"civ_air_2","civ","Helihändler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "airport_tanoa_heli":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{ !DWEV_firstSpawn };
			_this addAction["Helihändler",DWEV_fnc_vehicleShopMenu,["civ_air",civilian,"civ_air_1","civ","Helihändler"],0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fluglizenzen",0,false,false,"",'player distance _target < 4'];
		};
	};

	//boote

	case "KavalaBoatshopNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_1"; // Ein kleiner vesucher Bugfix mal sehen ob das spawnen von booten an der Kavalla garage nun aufhört
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_1","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_1";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "NeochoriBoatshopNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_2","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_2";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "mitteBoatshopNPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_3","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_3";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_1":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_1";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_1","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_1";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_2":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_2";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_2","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_2";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_6":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_6";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_6","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_6";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_8":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_8";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_8","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_8";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_9":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_9";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_9","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_9";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_10":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_10";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_10","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_10";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_11":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_11";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_11","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_11";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_12":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_12";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_12","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_12";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_13":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_13";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_13","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_13";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_14":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_14";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_14","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_14";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_15":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_15";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_15","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_15";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_16":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_16";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_16","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_16";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_17":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_17";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_17","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_17";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_18":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_18";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_18","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_18";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "BoatshopNPC_19":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		DWEV_var_GarageSpawns pushBackUnique "civ_ship_19";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_19","civ","Boots-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "civ_ship_19";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
		};
	};

	// LKW
	case "Kavala_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_1","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "athira_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_4","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "pyrgos_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_2","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "sofia_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_3","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "georgetown_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_2","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "lijnhaven_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_4","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "katkoula_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_3","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tuvanaka_LKW":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Lkw-Händler",DWEV_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_7","civ","Lkw-Händler"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lkwhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};


	// fahrzeuge
	case "CarShopNPC": // New Variante
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		[_object, _params, _createMarker] spawn
		{
			_object = (_this select 0);
			_params = (_this select 1);
			_createMarker = (_this select 2);
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_object addAction["Autohändler",DWEV_fnc_vehicleShopMenu,_params,0,false,false,"",'player distance _target < 4'];
			_object addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fahrzeughaendler",0,false,false,"",'player distance _target < 4'];
			// Create Marker
			if ((side player) == civilian && _createMarker) then
			{
				_marker = createMarkerLocal [format["carShopMarker_%1",_object],visiblePosition _object];
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerTypeLocal "mil_box";
				_marker setMarkerTextLocal "Fahrzeughändler";
			};
		};
	};

	case "BoatShopNPC": // New Variante // NOCH NICHT FERTIG !!!
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		if (isNil "DWEV_var_GarageSpawns") then {DWEV_var_GarageSpawns = [];};
		DWEV_var_GarageSpawns pushBackUnique (_params select 2);
		[_object, _params, _createMarker] spawn
		{
			_object = (_this select 0);
			_params = (_this select 1);
			_createMarker = (_this select 2);
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_object addAction["Boots-Händler",DWEV_fnc_vehicleShopMenu,_params,0,false,false,"",'player distance _target < 4'];
			_object addAction["Boots Garage",  {   [getPlayerUID player,(side player),"Ship",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   while {true} do { _tmpdist = 1000; { if ((player distance (getMarkerPos _x)) < _tmpdist) then {DWEV_garage_sp = _x; _tmpdist = (player distance (getMarkerPos _x));};} count DWEV_var_GarageSpawns; }; },"",0,false,false,"",'player distance _target < 4'];
			_object addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
			_object addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"boot",0,false,false,"",'player distance _target < 4'];
			// Create Marker
			if ((side player) == civilian && _createMarker) then
			{
				_marker = createMarkerLocal [format["boatShopMarker_%1",_object],visiblePosition _object];
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerTypeLocal "mil_box";
				_marker setMarkerTextLocal "Boots Händler";
			};
		};
	};

	case "vipcarsued":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Premium Fahrzeuge",DWEV_fnc_vehicleShopMenu,["donator",civilian,"donator_1","civ","Premium Fahrzeuge"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"vip",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "vipcarnord":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Premium Fahrzeuge",DWEV_fnc_vehicleShopMenu,["donator",civilian,"donator_2","civ","Premium Fahrzeuge"],0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"vip",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "vipwaffen_npc":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (call DWEV_donator) > 0 && (side player) == civilian'];
		_this addAction["Premium Kleidung",DWEV_fnc_clothingMenu,"donator",0,false,false,"",'player distance _target < 4 &&  (call DWEV_donator) > 0 && (side player) == civilian'];
		_this addAction["Premium Waffen",DWEV_fnc_weaponShopMenu,"donator",0,false,false,"",' _target distance _this < 4 &&  (call DWEV_donator) > 0 && (side player) == civilian'];
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player &&  (call DWEV_donator) > 0 && player distance _target < 4 '];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"vip",0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "sppremium" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "sppremium" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"sppremium",0,false,false,"",' !lc_sppremium && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "kartcar_npc":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Markus Go-kart  Laden",DWEV_fnc_vehicleShopMenu,["kart_shop",civilian,"kart_shop","civ","Markus Kart Laden",true],0,false,false,"",'player distance _target < 4'];
		_this addAction["Kart Keidung",DWEV_fnc_clothingMenu,"kart",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kart",0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spkartbahn" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spkartbahn" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spkartbahn",0,false,false,"",' !lc_spkartbahn && (side player) == civilian && player distance _target < 4'];
		};
	};

	// Garagen
	case "garage":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		if (isNil "DWEV_var_GarageSpawns") then {DWEV_var_GarageSpawns = [];};
		DWEV_var_GarageSpawns pushBackUnique (_params select 0);
		[_object, _createMarker] spawn
		{
			_object = (_this select 0);
			_createMarker = (_this select 1);
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_object addAction["Fahrzeug Garage",  {
				[getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; 
				DWEV_garage_type = "Car"; createDialog "DWEV_impound_menu"; disableSerialization; ctrlSetText[2802,"Hole Fahrzeug...."];
			   	//while {true} do {
					_nearest = "";
					_tmpdist = 1000; 
					{ if ((player distance (getMarkerPos _x)) < _tmpdist) then {_nearest = _x; _tmpdist = (player distance (getMarkerPos _x));};} count DWEV_var_GarageSpawns; 
					DWEV_garage_sp = _nearest;
				//}; 
			},"",0,false,false,"",'player distance _target < 4'];
			_object addAction["Fahrzeug einparken",DWEV_fnc_storeVehicleStadt,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
			_object addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"garage",0,false,false,"",'player distance _target < 4'];
			// Create Marker
			if ((side player) == civilian && _createMarker) then
			{
				_marker = createMarkerLocal [format["garageMarker_%1",_object],visiblePosition _object];
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerTypeLocal "mil_box";
				_marker setMarkerTextLocal "Garage";
			};


		};
	};

	case "vip_sued_garage":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "car_g_5"; },"",0,false,false,"",' !isNil "DWEV_donator" && (call DWEV_donator) > 0 && player distance _target < 4' ];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "car_g_5"; },"",0,false,false,"",' !isNil "DWEV_donator" && (call DWEV_donator) > 0 && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && !isNil "DWEV_donator" && (call DWEV_donator) > 0'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"vip",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "vip_nord_garage":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "car_g_4"; },"",0,false,false,"",' !isNil "DWEV_donator" && (call DWEV_donator) > 0 && player distance _target < 4' ];
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";  createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "car_g_4"; },"",0,false,false,"",' !isNil "DWEV_donator" && (call DWEV_donator) > 0 && player distance _target < 4' ];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && !isNil "DWEV_donator" && (call DWEV_donator) > 0'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"vip",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "airfield_garage":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];  DWEV_garage_type = "Air"; createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "air_g_1";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",  {   private["_nearVehicle"];   _nearVehicle = nearestObjects[(getPos (_this select 0)),["Car","Ship","Air"],35] select 0;   if(isNil "_nearVehicle") exitWith {hint "Es ist kein Fahrzeug in der nähe vom NPC.";};   [_nearVehicle,false,(_this select 1)] remoteExec ["DWF_fnc_vehicleStore",2];   hint "Der Server versucht das Fahrzeug zu parken....";   DWEV_garage_store = true;  },"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"garage",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "shockwave_garage":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "shockwave_g_1";  },"",0,false,false,"",'player distance _target < 4 && (side player) == civilian && lc_shockwave'];
		_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicleStadt,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == civilian && lc_shockwave'];
		};
	};

	case "airport_tanoa_garage":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		DWEV_var_GarageSpawns pushBackUnique "air_g_1";
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];  DWEV_garage_type = "Air"; createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "air_g_1";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Fahrzeug einparken",  {   private["_nearVehicle"];   _nearVehicle = nearestObjects[(getPos (_this select 0)),["Car","Ship","Air"],35] select 0;   if(isNil "_nearVehicle") exitWith {hint "Es ist kein Fahrzeug in der nähe vom NPC.";};   [_nearVehicle,false,(_this select 1)] remoteExec ["DWF_fnc_vehicleStore",2];   hint "Der Server versucht das Fahrzeug zu parken....";   DWEV_garage_store = true;  },"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"garage",0,false,false,"",'player distance _target < 4'];
		};
	};

	//Sonstiges

	case "Random_npc":
	{
		removeallWeapons _object; _object allowDamage false; _object enableSimulation false;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		if (isNil "firstplaced") then {[_this] call DWEV_fnc_placeRandom; firstplaced = true; publicvariable "firstplaced";};
		_this addAction[format["%1 (%2)",(getText(missionConfigFile >> "Licenses" >> "sprebell" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "sprebell" >> "price"))] call DWEV_fnc_numberText],{rebell_spawnpass_npc setVariable["nopass",true,true];
		_this call DWEV_fnc_buyLicense; [rebell_spawnpass_npc] call DWEV_fnc_placeRandom; rebell_spawnpass_npc setVariable["nopass",false,true];},"sprebell",0,false,false,"",' !lc_sprebell && (side player) == civilian && !(rebell_spawnpass_npc getVariable["nopass",false]) && player distance _target < 4'];
		};
	};

	case "Zapfsaeule_einatz":
	{
		_object allowDamage false;
		_object enableSimulation false;
		_object setFuelCargo 0;
		_object setRepairCargo 0;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction ["Tanken", "[[""Car"", ""Air"", ""Ship""]] call DWEV_fnc_gasVehicleSelection;","",0,FALSE,FALSE,"",' vehicle player == player && (side player) != civilian '];;
		};
	};

	case "Zapfsaeule_premium":
	{
		_object allowDamage false;
		_object enableSimulation false;
		_object setFuelCargo 0;
		_object setRepairCargo 0;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction ["Tanken", "[[""Car"", ""Air"", ""Ship""]] call DWEV_fnc_gasVehicleSelection;","",0,FALSE,FALSE,"",' vehicle player == player && (side player) == civilian '];
		};


	};

	case "Zapfsaeule_car":
	{
		_object allowDamage false;
		_object enableSimulation false;
		_object setFuelCargo 0;
		_object setRepairCargo 0;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction ["Tanken", "[['Car']] call DWEV_fnc_gasVehicleSelection;",""];
		};
	};

	case "Zapfsaeule_boot":
	{
		_object allowDamage false;
		_object enableSimulation false;
		_object setFuelCargo 0;
		_object setRepairCargo 0;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction ["Tanken", "[['Ship']] call DWEV_fnc_gasVehicleSelection;",""];
		};
	};

	case "Zapfsaeule_air":
	{
		_object allowDamage false;
		_object enableSimulation false;
		_object setFuelCargo 0;
		_object setRepairCargo 0;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction ["Tanken", "[['Air']] call DWEV_fnc_gasVehicleSelection;",""];
		};
	};

	case "Casinoshop":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Supermarkt",DWEV_fnc_virt_menu,"casino",0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spcasino" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spcasino" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spcasino",0,false,false,"",' !lc_spcasino && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"casino",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "zivbankautomat":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 '];
		};
	};

	case "feuerwehrbankautomat":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && (side player) == independent '];
		_this addAction["Du bist kein Feuerwehrmann.","","",0,false,false,"",'(side player) !=independent && player distance _target < 4'];
		};
	};

	case "polizeibankautomat":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",'(side player) ==west && player distance _target < 4'];
		_this addAction["Du bist kein Polizist.","","",0,false,false,"",'(side player) !=west && player distance _target < 4'];
		};
	};

	case "Casinoslot":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\casino.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction ["Slotmaschiene spielen",DWEV_fnc_slotmachine,"",0,false,false,"",'(side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"casino",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "Casinoblackjack":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\casino.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#FF0000'>Ich bin Deaktiviert</t>",DWEV_fnc_text,"deaktiviert",0,false,false,"",'player distance _target < 4'];
//		_this addAction ["BlackJack spielen", DWEV_fnc_blackjack,"",0,false,false,"",'(side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"casino",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "bundesbanksafe":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Safe öffnen",DWEV_fnc_safeOpen,"",0,false,false,"",' (side player) == civilian && {_target getVariable["safe_open",false]} '];
		_this addAction["Safe Reparieren",DWEV_fnc_safeFix,"",0,false,false,"",' (side player) == west && {_target getVariable ["safe_open",false]} ' ];
		};
	};

	case "kavala_police_laptop":
	{
		_object enableSimulation false; _object allowDamage false;
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Bundesbank - Vordereingang",DWEV_fnc_fedCamDisplay,"front",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && (side player) ==west'];
		_this addAction["Bundesbank - Seiteneingang",DWEV_fnc_fedCamDisplay,"side",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && (side player) ==west'];
		_this addAction["Bundesbank - Hintereingang",DWEV_fnc_fedCamDisplay,"back",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && (side player) ==west'];
		_this addAction["Bundesbank - Saferaum",DWEV_fnc_fedCamDisplay,"vault",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && (side player) ==west'];
		_this addAction["Monitor ausschalten",DWEV_fnc_fedCamDisplay,"off",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && (side player) ==west'];
		_this addAction["Du bist kein Polizist.","","",0,false,false,"",'(side player) !=west'];
		};
	};

	case "verwahrstelle":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\fahrzeug_shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"verwahrstelle"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "restspawn_car_heli";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"verwahrstelle"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "restspawn_car_heli";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Wasserfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Ship",player,"verwahrstelle"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Ship";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "restspawn_ship";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"verwahrstelle",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschieberpyrgos":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_4",0,false,false,"",'player distance _target < 4'];
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_pyrgos";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_pyrgos";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schrottplatz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschiebernordmitte":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_1",0,false,false,"",'player distance _target < 4'];
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_mitte";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_mitte";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schrottplatz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschiebersofia":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_2",0,false,false,"",'player distance _target < 4'];
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_sofia";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_sofia";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schrottplatz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschieberkavala":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_3",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fahrzeugschieber",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschieber_georgetown":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_3",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fahrzeugschieber",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschieber_tanouka":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_2",0,false,false,"",'player distance _target < 4'];
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_tanouka";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_tanouka";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schrottplatz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschieber_yanukka":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_2",0,false,false,"",'player distance _target < 4'];
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_yanukka";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_yanukka";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schrottplatz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "fahrzeugschieber_tuvanaka":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\garage.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//		_this addAction["Fahrzeugschieber",DWEV_fnc_chopShopMenu,"chop_shop_2",0,false,false,"",'player distance _target < 4'];
		_this addAction["Landfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Car",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Car";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_tuvanaka";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["Luftfahrzeuge auslösen",  {   [getPlayerUID player,(side player),"Air",player,"chopShop"] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})]; DWEV_garage_type = "Air";   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Hole Fahrzeug...."];   DWEV_garage_sp = "rueckkauf_car_heli_tuvanaka";  },"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schrottplatz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tankstelle_ausrauben":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\tankstelle.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Tankstellenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4'];
		_this addAction["Bistro",DWEV_fnc_virt_menu,"bistro",0,false,false,"",'player distance _target < 4'];
		_this addAction["Alarmanlage Montieren(25000€)",DWEV_fnc_addAlarm,"",0,false,false,"",'(side player) == civilian && player distance _target < 4'];
		_this addAction ["Wegfahrsperre Montieren(50000€)",DWEV_fnc_addSperre,"",0,false,false,"",'(side player) == civilian && player distance _target < 4'];
		_this addAction ["Fahrzeug umlackieren",DWEV_fnc_RepaintMenu,"",0,false,false,"",'(side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player &&  (call DWEV_donator) > 0 && player distance _target < 4 '];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"Tankstelle",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#FF0000'>Tanke ausrauben</t>",DWEV_fnc_robShops,"",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tankstelle":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\tankstelle.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Tankstellenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4'];
		_this addAction["Bistro",DWEV_fnc_virt_menu,"bistro",0,false,false,"",'player distance _target < 4'];
		_this addAction["Alarmanlage Montieren(25000€)",DWEV_fnc_addAlarm,"",0,false,false,"",'player distance _target < 4 && (side player) == civilian'];
		_this addAction ["Wegfahrsperre Montieren(50000€)",DWEV_fnc_addSperre,"",0,false,false,"",'player distance _target < 4 && (side player) == civilian'];
		_this addAction ["Fahrzeug umlackieren",DWEV_fnc_RepaintMenu,"",0,false,false,"",'player distance _target < 4 && (side player) == civilian'];
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player &&  (call DWEV_donator) > 0 && player distance _target < 4 '];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"Tankstelle",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "bankfiliale":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\dieb.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["<t color='#FF0000'>Bankfiliale ausrauben</t>",DWEV_fnc_robBanks],"",0,false,false,"",'player distance _target < 4';
		_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 '];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"bankfilliale",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "heli_Station":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\werkzeug.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Servicestation",DWEV_fnc_serviceChopper,air_serv_1,0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spairfield" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spairfield" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spairfield",0,false,false,"",' !lc_spairfield && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"helistation",0,false,false,"",'player distance _target < 4'];
		};
	};
	
	case "heli_Station_tanoa":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\werkzeug.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Heli-Servicestation",DWEV_fnc_serviceChopper,marker_579,0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "tanoaAir" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "tanoaAir" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"tanoaAir",0,false,false,"",' !lc_tanoaAir && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"helistation",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "Ziv_Waffennpc":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\waffe.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo civilian)'];
		_this addAction["Waffenladen",DWEV_fnc_weaponShopMenu,"gun",0,false,false,"",'!actionWeaponfree && lc_gun && (side player) == civilian && player distance _target < 4'];
		_this addAction["Kleidung",DWEV_fnc_clothingMenu,"gun",0,false,false,"",'lc_gun && player distance _target < 4'];
		_this addAction["Weaponfree Waffen",DWEV_fnc_weaponShopMenu,"Weaponfree",0,false,false,"",'actionWeaponfree && lc_gun && (side player) == civilian && player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "gun" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"gun",0,false,false,"",' !lc_gun && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"waffenshop",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "Tauschershop_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Taucherausrüstung",DWEV_fnc_clothingMenu,"dive",0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "dive" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "dive" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"dive",0,false,false,"",' !lc_dive && (side player) == civilian && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"tauchshop",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "Anwalt_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\anwalt.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Anwaltskammer",DWEV_fnc_clothingMenu,"anwalt",0,false,false,"",'lc_anwalt && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"Anwalt",0,false,false,"",'player distance _target < 4'];
		_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "anwalt" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "anwalt" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"anwalt",0,false,false,"",' !lc_anwalt && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "broker_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\broker.paa"];
		_object spawn
		{ 
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Marktpreis Auskunft",DWEV_fnc_openMarktMenu,"",0,false,false,"",'player distance _target < 4 && (side player) == civilian'];
			_this addAction["Wertpapierhändler",DWEV_fnc_virt_menu,"broker",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"brooker",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "knast_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"icons\Polizei128.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Knastfutter",DWEV_fnc_virt_menu,"knast",0,false,false,"",'player distance _target < 4'];
		_this addAction["Kaution zahlen",DWEV_fnc_postBail,"",0,false,false,"",' isNil "DWEV_canpay_bail" && DWEV_is_arrested && player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"knastnpc",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "waffenfabrik_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\waffe.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Waffenfabrik",DWEV_fnc_opencraftMenu,"",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"waffenfabrik",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "bankgold_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Bankgoldhändler",DWEV_fnc_virt_menu,"gold",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"bankgold",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kleidungs_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\kleidung.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Bekleidungsgeschäft",DWEV_fnc_clothingMenu,"bruce",0,false,false,"",'player distance _target < 4'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"bekleidungsgeschaeft",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "gemischtshop_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\werkzeug.paa"];
		_object spawn
		{ waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
		_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo civilian)'];
		_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gemischtwaren",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "supermarkt":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"market",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "supermarkt_kavala":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"marketkavala",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "supermarkt_athira":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"market",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "athira" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "athira" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"athira",0,false,false,"",' !lc_athira && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "supermarkt_sofia":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"market",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "sofia" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "sofia" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"sofia",0,false,false,"",' !lc_sofia && (side player) == civilian && player distance _target < 4'];
		};
	};
	
	case "supermarkt_tavu":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"market",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "tavu" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "tavu" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"tavu",0,false,false,"",' !lc_tavu && (side player) == civilian && player distance _target < 4'];
		};
	};
	
	case "supermarkt_katkoula":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"market",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "katkoula" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "katkoula" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"katkoula",0,false,false,"",' !lc_katkoula && (side player) == civilian && player distance _target < 4'];
		};
	};
	
	case "supermarkt_tuvanaka":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"market",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"supermarkt",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "tuvanaka" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "tuvanaka" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"tuvanaka",0,false,false,"",' !lc_tuvanaka && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "Fischmarkt_NPC":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\shop.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Fischmarkt",DWEV_fnc_virt_menu,"fishmarket",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fisch",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spjet" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spjet" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spjet",0,false,false,"",' !lc_spjet && (side player) == civilian && lc_airjet && player distance _target < 4'];
		};
	};

	case "organhaendler_npc":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\herz.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Organhändler",DWEV_fnc_virt_menu,"organ",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"organ",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "muell":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"icons\items\muell.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Muelly's Mülldeponie",DWEV_fnc_virt_menu,"muell",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"muell",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "Lizenz_Npc":
	{
		_object allowDamage false;  _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\lizenzen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Lizenzen",{_this call DWEV_fnc_licenses;},["driver","boat","air","airgewerbe","truck","home","shipBig"],0,true,true,"",' (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lizenzbehoerde",0,false,false,"",'player distance _target < 4'];
		};
	};

	//DHL
	case "DHL_NPCS":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\dhl.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Paket ausliefern",DWEV_fnc_dpFinish,"dhl_1",0,false,false,"",'!isNil "DWEV_dp_point" && DWEV_delivery_in_progress && DWEV_dp_point == _target && player distance _target < 4'];
			_this addAction["Liefermission annehmen",DWEV_fnc_getDPMission,"dhl_1",0,false,false,"",' isNil "DWEV_dp_point" && !DWEV_delivery_in_progress && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"dhl",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "DHL_NPC_Liefermission":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\dhl.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Liefermission annehmen",DWEV_fnc_getDPMission,"dhl_1",0,false,false,"",' isNil "DWEV_dp_point" && !DWEV_delivery_in_progress && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"dhl",0,false,false,"",'player distance _target < 4'];
		};
	};


	//Illegale NPC

	case "drogendealer":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Drogenhändler",DWEV_fnc_virt_menu,"drogen",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Drogenhändler ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["Heroinspritze herstellen",{ _this call DWEV_fnc_preprocess;},"heroinsp",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Joint bauen",{ _this call DWEV_fnc_preprocess;},"joint",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "heroinsp" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "heroinsp" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"heroinsp",0,false,false,"",' !lc_heroinsp && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "joint" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "joint" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"joint",0,false,false,"",' !lc_joint && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"drogendealer"];
		};
	};

	case "drogendealergros":
	{
		_object allowDamage false;  _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Drogenhändler",DWEV_fnc_virt_menu,"heroin",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Drogenhändler ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["DMT strecken",{ _this call DWEV_fnc_preprocess;},"streckendmt",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Crystal Meth strecken",{ _this call DWEV_fnc_preprocess;},"streckenmeth",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Kokain strecken",{ _this call DWEV_fnc_preprocess;},"streckenkoka",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Heroin strecken",{ _this call DWEV_fnc_preprocess;},"streckenhero",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Marijuana strecken",{ _this call DWEV_fnc_preprocess;},"streckenmari",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Zauberpilze strecken",{ _this call DWEV_fnc_preprocess;},"zpilzge",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"drogengros",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "streckenkoka" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "streckenkoka" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"streckenkoka",0,false,false,"",' !lc_streckenkoka && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "streckenhero" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "streckenhero" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"streckenhero",0,false,false,"",' !lc_streckenhero && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "streckenmari" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "streckenmari" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"streckenmari",0,false,false,"",' !lc_streckenmari && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "streckendmt" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "streckendmt" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"streckendmt",0,false,false,"",' !lc_streckendmt && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "streckenmeth" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "streckenmeth" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"streckenmeth",0,false,false,"",' !lc_streckenmeth && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "zpilzge" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "zpilzge" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"zpilzge",0,false,false,"",' !lc_zpilzge && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "drogenkunde":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Drogenhändler",DWEV_fnc_virt_menu,"drogenkunde",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Drogenhändler ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"drogenkunde"];
		};
	};

	case "wong_city":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Wong`s City Wok",DWEV_fnc_virt_menu,"wongs",0,false,false,"",'player distance _target < 4'];
			_this addAction["Wong Ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"wong",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "antitrader":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Antiquitätenhändler",DWEV_fnc_virt_menu,"antitrader",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Antiquitätenhändler ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["Relikte verpacken",{ _this call DWEV_fnc_preprocess;},"reliktstreckv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Kriegswaffen verpacken",{ _this call DWEV_fnc_preprocess;},"kriegsschrottstreckv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "reliktstreckv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "reliktstreckv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"reliktstreckv",0,false,false,"",' !lc_reliktstreckv && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kriegsschrottstreckv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kriegsschrottstreckv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kriegsschrottstreckv",0,false,false,"",' !lc_kriegsschrottstreckv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"antiinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "schwarzmarkt":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Schwarzmarkt",DWEV_fnc_virt_menu,"schwarzmarkt",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Schwarzmarkt ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["Opium strecken",{ _this call DWEV_fnc_preprocess;},"schlafmohnstreckv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Schlangenhauttasche herstellen",{ _this call DWEV_fnc_preprocess;},"anakondastreckv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "schlafmohnstreckv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "schlafmohnstreckv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"schlafmohnstreckv",0,false,false,"",' !lc_schlafmohnstreckv && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "anakondastreckv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "anakondastreckv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"anakondastreckv",0,false,false,"",' !lc_anakondastreckv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schwarzmarktinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "warenschieber":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Warenschieber",DWEV_fnc_virt_menu,"warenschieber",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Warenschieber ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"warenschieberinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tiermode":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Tiermode Händler",DWEV_fnc_virt_menu,"tiermode",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == civilian '];
			_this addAction["Tiermode Händler ausfragen",DWEV_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == west && !DWEV_action_inUse '];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"tiermodeinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	//Feuerwehr
	case "kavala_feuerwehr_npc"://wegen lizenz
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_1","med","Kavala Hosptial"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Helikopter Händler",DWEV_fnc_vehicleShopMenu,["med_air_shop",independent,"med_car_1","med","Kavala Hosptial",false],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_1"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_1"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == independent'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "mair" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "mair" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"mair",0,false,false,"",' !lm_mair && (side player) == independent && player distance _target < 4'];
		};
	};

	case "sofia_feuerwehr_npc":
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_4","med","Sofia Hosptial"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Helikopter Händler",DWEV_fnc_vehicleShopMenu,["med_air_shop",independent,"med_car_4","med","Sofia Hosptial",false],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_4"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_4"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == independent'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "mair" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "mair" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"mair",0,false,false,"",' !lm_mair && (side player) == independent && player distance _target < 4'];
		};
	};

	case "athira_feuerwehr_npc":
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_3","med","Kavala Hosptial"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Helikopter Händler",DWEV_fnc_vehicleShopMenu,["med_air_shop",independent,"med_car_3","med","Athira Hosptial",false],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_3"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_3"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == independent'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "mair" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "mair" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"mair",0,false,false,"",' !lm_mair && (side player) == independent && player distance _target < 4'];
		};
	};

	case "pyrgos_feuerwehr_npc":
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_2","med","Pyrgos Hosptial"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Helikopter Händler",DWEV_fnc_vehicleShopMenu,["med_air_shop",independent,"med_car_2","med","Pyrgos Hosptial",false],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_2"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_2"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == independent'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "mair" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "mair" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"mair",0,false,false,"",' !lm_mair && (side player) == independent && player distance _target < 4'];
		};
	};

	case "kavala_K1_npc":
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_5","med","Kavala Hosptial"],0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_5"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (playerSide isEqualTo independent)'];
		};
	};

	case "georgetown_feuerwehr_npc"://wegen lizenz
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_2","med","Kavala Hosptial"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Helikopter Händler",DWEV_fnc_vehicleShopMenu,["med_air_shop",independent,"med_car_2","med","Kavala Hosptial",false],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_2"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_2"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == independent'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "mair" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "mair" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"mair",0,false,false,"",' !lm_mair && (side player) == independent && player distance _target < 4'];
		};
	};

	case "ravita_feuerwehr_npc"://wegen lizenz
	{
		_object enableSimulation false;  _object allowDamage false;
		_object setObjectTexture [0,"icons\Feuerwehr128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kleidungs Shop",DWEV_fnc_clothingMenu,"med",0,false,false,"",'player distance _target < 4'];
			_this addAction["Feuerwehrausrüstung",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'player distance _target < 4 && (playerSide isEqualTo independent)'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"medessen",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["med_shop",independent,"med_car_1","med","Kavala Hosptial"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Helikopter Händler",DWEV_fnc_vehicleShopMenu,["med_air_shop",independent,"med_car_1","med","Kavala Hosptial",false],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_1"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "med_car_1"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == independent && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == independent'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "mair" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "mair" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"mair",0,false,false,"",' !lm_mair && (side player) == independent && player distance _target < 4'];
		};
	};

	//sicherheitsdienst
	case "sicherheitsdienst_mitte":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\Sicherheit128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == east'];
			_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"WSC",0,false,false,"",'player distance _target < 4'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"WSC",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["WSC",east,"opfor_car_1","WSC","Sicherheits HQ"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "opfor_car_1"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == east && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "opfor_car_1"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == east && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == east'];
		};
	};

	case "sicherheitsdienst_ost":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\Sicherheit128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == east'];
			_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"WSC",0,false,false,"",'player distance _target < 4'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"WSC",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["WSC",east,"opfor_car_2","WSC","Sicherheits HQ"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "opfor_car_2"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == east && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "opfor_car_2"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == east && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == east'];
		};
	};

	case "sicherheitsdienst_west":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\Sicherheit128.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["<t color='#ADFF2F'>Bankautomat</t>",DWEV_fnc_atmMenu,"",0,false,false,"",' vehicle player == player && player distance _target < 4 && (side player) == east'];
			_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"WSC",0,false,false,"",'player distance _target < 4'];
			_this addAction["Kantine",DWEV_fnc_virt_menu,"WSC",0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Händler",DWEV_fnc_vehicleShopMenu,["WSC",east,"opfor_car_3","WSC","Sicherheits HQ"],0,false,false,"",'player distance _target < 4'];
			_this addAction["Fahrzeug Garage",  {   [getPlayerUID player,(side player),"Car",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "opfor_car_3"; DWEV_garage_type = "Car";  },"",0,false,false,"",'(side player) == east && player distance _target < 4'];
			_this addAction["Helikopter Garage",  {   [getPlayerUID player,(side player),"Air",player] remoteExec ["DWF_fnc_getVehicle",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];   createDialog "DWEV_impound_menu";   disableSerialization;   ctrlSetText[2802,"Parke Fahrzeug aus...."];   DWEV_garage_sp = "opfor_car_3"; DWEV_garage_type = "Air";  },"",0,false,false,"",'(side player) == east && player distance _target < 4'];
			_this addAction["Fahrzeug einparken",DWEV_fnc_storeVehicle,"",0,false,false,"",'!DWEV_garage_store && player distance _target < 4 && (side player) == east'];
		};
	};

	case "heiler_NPC":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\rotkreuz.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Ärztliche Behandlung",DWEV_fnc_healHospital];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"arzt",0,false,false,"",'player distance _target < 4'];
		};
	};

	//Legale Verarbeiter
	case "saftpressen_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Apfelsaft Herstellen",{ _this call DWEV_fnc_preprocess;},"apfelsa",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Pfirsichsaft Herstellen",{ _this call DWEV_fnc_preprocess;},"pfirsa",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "apfelsa" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "apfelsa" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"apfelsa",0,false,false,"",' !lc_apfelsa && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "pfirsa" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "pfirsa" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"pfirsa",0,false,false,"",' !lc_pfirsa && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"fruechte",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "sand_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Sand verarbeiten",{ _this call DWEV_fnc_preprocess;},"sand",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4 && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "sand" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "sand" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"sand",0,false,false,"",' !lc_sand && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"glas",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spneochori" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spneochori" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spneochori",0,false,false,"",' !lc_spneochori && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "gold_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Goldbarren Herstellen",{ _this call DWEV_fnc_preprocess;},"goldsch",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "goldsch" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "goldsch" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"goldsch",0,false,false,"",' !lc_goldsch && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gold",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "eisen_verarbeiter"://wegen lizenz
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Eisenerz verarbeiten",{ _this call DWEV_fnc_preprocess;},"iron",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "iron" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "iron" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"iron",0,false,false,"",' !lc_iron && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"eisen",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kupfer_verarbeiter"://wegen lizenz
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kupfer verarbeiten",{ _this call DWEV_fnc_preprocess;},"copper",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "copper" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "copper" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"copper",0,false,false,"",' !lc_copper && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kupfer",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "oel_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Öl Verarbeitung",{ _this call DWEV_fnc_preprocess;},"oil",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "oil" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "oil" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"oil",0,false,false,"",' !lc_oil && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"oel",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "silber_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Silberbarren Herstellen",{ _this call DWEV_fnc_preprocess;},"silbersch",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "silbersch" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "silbersch" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"silbersch",0,false,false,"",' !lc_silbersch && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"silber",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "schmied_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Ring Herstellen",{ _this call DWEV_fnc_preprocess;},"ringsch",0,false,false,"",'   !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Perlen verarbeiten",{ _this call DWEV_fnc_preprocess;},"perlen",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "ringsch" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "ringsch" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"ringsch",0,false,false,"",' !lc_ringsch && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "perlen" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "perlen" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"perlen",0,false,false,"",' !lc_perlen && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schmied",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "pfeffer_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Pfeffer verarbeiten",{ _this call DWEV_fnc_preprocess;},"pfeffer",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "pfeffer" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "pfeffer" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"pfeffer",0,false,false,"",' !lc_pfeffer && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"pfeffer",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "stein_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Steine verarbeiten",{ _this call DWEV_fnc_preprocess;},"cement",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "cement" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "cement" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"cement",0,false,false,"",' !lc_cement && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"stein",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "wein_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Weinbereiter",{ _this call DWEV_fnc_preprocess;},"grapes",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "grapes" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "grapes" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"grapes",0,false,false,"",' !lc_grapes && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"wein",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "urantrocknung_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Uranium filtern",{ _this call DWEV_fnc_preprocess;},"uranium4",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"uranium",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "urantrennung_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Uranium trennen",{ _this call DWEV_fnc_preprocess;},"uranium3",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"uranium",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "uranfilter_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Uranium filtern",{ _this call DWEV_fnc_preprocess;},"uranium1",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"uranium",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "uranreinigung_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Uranium reinigen",{ _this call DWEV_fnc_preprocess;},"uranium2",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"uranium",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "diamant_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Diamanten verarbeiten",{ _this call DWEV_fnc_preprocess;},"diamond",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "diamond" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "diamond" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"diamond",0,false,false,"",' !lc_diamond && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"diamant",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "salz_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Salz verarbeiten",{ _this call DWEV_fnc_preprocess;},"salt",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "salt" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "salt" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"salt",0,false,false,"",' !lc_salt && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"salz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "pilzsuppen_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Pilzsuppen Herstellen",{ _this call DWEV_fnc_preprocess;},"pilzsu",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "pilzsu" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "pilzsu" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"pilzsu",0,false,false,"",' !lc_pilzsu && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"pilzsuppe",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "muschel_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Muscheln knacken",{ _this call DWEV_fnc_preprocess;},"muschel",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "muschel" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "muschel" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"muschel",0,false,false,"",' !lc_muschel && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"muschel",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "gemuese_reiniger":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kartoffel reinigen",{ _this call DWEV_fnc_preprocess;},"kartoffel",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Salat reinigen",{ _this call DWEV_fnc_preprocess;},"salat",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kartoffel" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kartoffel" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kartoffel",0,false,false,"",' !lc_kartoffel && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "salat" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "salat" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"salat",0,false,false,"",' !lc_salat && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gemuese",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "gemuese_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kartoffel verarbeiten",{ _this call DWEV_fnc_preprocess;},"pommes",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Salat verarbeiten",{ _this call DWEV_fnc_preprocess;},"salatblatt",0,false,false,"",'!DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "pommes" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "pommes" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"pommes",0,false,false,"",' !lc_pommes && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "salatblatt" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "salatblatt" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"salatblatt",0,false,false,"",' !lc_salatblatt && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gemuese",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "curry_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Currykraut verarbeiten",{ _this call DWEV_fnc_preprocess;},"curry",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "curry" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "curry" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"curry",0,false,false,"",' !lc_curry && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"curry",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "zimt_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Zimtstange verarbeiten",{ _this call DWEV_fnc_preprocess;},"zimt",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "zimt" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "zimt" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"zimt",0,false,false,"",' !lc_zimt && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"zimt",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "lehm_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Ziegel brennen",{ _this call DWEV_fnc_preprocess;},"lehmv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "lehmv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "lehmv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"lehmv",0,false,false,"",' !lc_lehmv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"lehminfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kautschuk_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gummi herstellen",{ _this call DWEV_fnc_preprocess;},"kautschukv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kautschukv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kautschukv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kautschukv",0,false,false,"",' !lc_kautschukv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kautschukinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tropenholz_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Tropenholz zurechtsägen",{ _this call DWEV_fnc_preprocess;},"tropenholzv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "tropenholzv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "tropenholzv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"tropenholzv",0,false,false,"",' !lc_tropenholzv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"tropenholzinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kakao_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kakaobohnen mahlen",{ _this call DWEV_fnc_preprocess;},"kakaov",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kakaov" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kakaov" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kakaov",0,false,false,"",' !lc_kakaov && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kakaoinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tabak_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Tabak trocknen",{ _this call DWEV_fnc_preprocess;},"tabakv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "tabakv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "tabakv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"tabakv",0,false,false,"",' !lc_tabakv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"tabakinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "magma_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Obsidian schleifen",{ _this call DWEV_fnc_preprocess;},"magmav",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "magmav" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "magmav" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"magmav",0,false,false,"",' !lc_magmav && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"magmainfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "zuckerrohr_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Zucker gewinnen",{ _this call DWEV_fnc_preprocess;},"zuckerrohrv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "zuckerrohrv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "zuckerrohrv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"zuckerrohrv",0,false,false,"",' !lc_zuckerrohrv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"zuckerrohrinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kohle_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Briketts pressen",{ _this call DWEV_fnc_preprocess;},"kohlev",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kohlev" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kohlev" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kohlev",0,false,false,"",' !lc_kohlev && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kohleinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "platin_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Platin schmelzen",{ _this call DWEV_fnc_preprocess;},"platinv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "platinv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "platinv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"platinv",0,false,false,"",' !lc_platinv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"platininfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "schoko_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Schokolade herstellen",{ _this call DWEV_fnc_preprocess;},"schokov",0,false,false,"",'!DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "schokov" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "schokov" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"schokov",0,false,false,"",' !lc_schokov && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schokoinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "reifen_verarbeiter":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Reifen herstellen",{ _this call DWEV_fnc_preprocess;},"reifenv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "reifenv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "reifenv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"reifenv",0,false,false,"",' !lc_reifenv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"reifeninfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "saftpresse_tanoa":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Meloneneis Herstellen",{ _this call DWEV_fnc_preprocess;},"melonv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Kokosmilch Herstellen",{ _this call DWEV_fnc_preprocess;},"kokosv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Bananenmilch Herstellen",{ _this call DWEV_fnc_preprocess;},"bananav",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Kokos-Bananenmilch Herstellen",{ _this call DWEV_fnc_preprocess;},"kokosbananav",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "melonv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "melonv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"melonv",0,false,false,"",' !lc_melonv && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kokosv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kokosv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kokosv",0,false,false,"",' !lc_kokosv && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "bananav" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "bananav" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"bananav",0,false,false,"",' !lc_bananav && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kokosbananav" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kokosbananav" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kokosbananav",0,false,false,"",' !lc_kokosbananav && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"safttanoainfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	//illegale Verarbeiter
	case "kokain_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kokain verarbeiten",{ _this call DWEV_fnc_preprocess;},"coke",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "coke" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "coke" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"coke",0,false,false,"",' !lc_coke && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kokain",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "schenkel_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Schenkel ausreißen",{ _this call DWEV_fnc_preprocess;},"schenkelpro",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "schenkelpro" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "schenkelpro" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"schenkelpro",0,false,false,"",' !lc_schenkelpro && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schenkel",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "canabis_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Marijuana verarbeiten",{ _this call DWEV_fnc_preprocess;},"marijuana",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "marijuana" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "marijuana" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"marijuana",0,false,false,"",' !lc_marijuana && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"canabis",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "suppen_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Koche Suppe",{ _this call DWEV_fnc_preprocess;},"suppenpro",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "suppenpro" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "suppenpro" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"suppenpro",0,false,false,"",' !lc_suppenpro && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"froschsuppe",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "schwarzbrenner_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Schwarzbrenner",{ _this call DWEV_fnc_preprocess;},"moonshine",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "moonshine" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "moonshine" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"moonshine",0,false,false,"",' !lc_moonshine && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schwarzbrenner",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "walterwhite_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Koche Methylamphetamin Platten",{ _this call DWEV_fnc_preprocess;},"methkochen",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "methkochen" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "methkochen" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"methkochen",0,false,false,"",' !lc_methkochen && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"meth",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "heroin_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Heroin verarbeiten",{ _this call DWEV_fnc_preprocess;},"heroin",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "heroin" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "heroin" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"heroin",0,false,false,"",' !lc_heroin && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"heroin",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "jesspinkman_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Zerbrösel Meth Platten",{ _this call DWEV_fnc_preprocess;},"methbruch",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "methbruch" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "methbruch" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"methbruch",0,false,false,"",' !lc_methbruch && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"meth",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "DMT_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["DMT extrahieren",{ _this call DWEV_fnc_preprocess;},"dmtpro",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "dmtpro" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "dmtpro" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"dmtpro",0,false,false,"",' !lc_dmtpro && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"dmt",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "DMT_Tierqu_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Quäle Kröte",{ _this call DWEV_fnc_preprocess;},"bufopro",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "bufopro" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "bufopro" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"bufopro",0,false,false,"",' !lc_bufopro && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"dmt",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "zauberpilz_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Zauberpilze Reinigung",{ _this call DWEV_fnc_preprocess;},"zpilz",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "zpilz" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "zpilz" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"zpilz",0,false,false,"",' !lc_zpilz && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"zaupilz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kroko_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Eier ausbrüten",{ _this call DWEV_fnc_preprocess;},"krokov",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "krokov" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "krokov" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"krokov",0,false,false,"",' !lc_krokov && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"krokoinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "kriegsschrott_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Waffen reinigen",{ _this call DWEV_fnc_preprocess;},"kriegsschrottv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "kriegsschrottv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "kriegsschrottv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"kriegsschrottv",0,false,false,"",' !lc_kriegsschrottv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kriegsschrottinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "anakonda_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Schlangen häuten",{ _this call DWEV_fnc_preprocess;},"anakondav",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction["Krokodilleder herstellen",{ _this call DWEV_fnc_preprocess;},"krokostreckv",0,false,false,"",' !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "anakondav" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "anakondav" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"anakondav",0,false,false,"",' !lc_anakondav && (side player) == civilian && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "krokostreckv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "krokostreckv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"krokostreckv",0,false,false,"",' !lc_krokostreckv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"anakondainfo",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"krokoinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "schlafmohn_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Opium herstellen",{ _this call DWEV_fnc_preprocess;},"schlafmohnv",0,false,false,"",'  !DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "schlafmohnv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "schlafmohnv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"schlafmohnv",0,false,false,"",' !lc_schlafmohnv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"schlafmohninfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "relikt_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Relikt schätzen",{ _this call DWEV_fnc_preprocess;},"reliktv",0,false,false,"",'!DWEV_is_processing && player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "reliktv" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "reliktv" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"reliktv",0,false,false,"",' !lc_reliktv && (side player) == civilian && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"reliktinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	// Legale haendler
	case "oel_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Öl Händler",DWEV_fnc_virt_menu,"oil",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"oel",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "uranium_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\drogen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Uranium Shop",DWEV_fnc_virt_menu,"uranium",0,false,false,"",' lc_uranium && (side player) == civilian && player distance _target < 4'];
			_this addAction["Kleidung",DWEV_fnc_clothingMenu,"uranium",0,false,false,"",'lc_uranium && player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"uranium",0,false,false,"",'player distance _target < 4'];
			_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "uranium" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "uranium" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"uranium",0,false,false,"",' !lc_uranium && (side player) == civilian && player distance _target < 4'];
		};
	};

	case "gewuerz_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gewürz Händler",DWEV_fnc_virt_menu,"salt",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gewuerz",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "pilzsuppen_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Pilzsuppen Händler",DWEV_fnc_virt_menu,"pilzh",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"pilzsuppe",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "juwelier_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Juwelier",DWEV_fnc_virt_menu,"juwelier",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"juwelier",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "diamanten_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Diamanten Händler",DWEV_fnc_virt_menu,"diamond",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"diamant",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "zement_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Zement händler",DWEV_fnc_virt_menu,"cement",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"zement",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "wein_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Weinhändler",DWEV_fnc_virt_menu,"wein",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"wein",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "glas_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Glas Händler",DWEV_fnc_virt_menu,"glass",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"glas",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "metall_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Metall Händler",DWEV_fnc_virt_menu,"iron",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"metallhaendler",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "gemuese_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gemüse Händler",DWEV_fnc_virt_menu,"gemuese",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gemuese",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "imbiss_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Imbiss",DWEV_fnc_virt_menu,"imbiss",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gemuese",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "sammel_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Sammelverkäufer",DWEV_fnc_virt_menu,"sammel",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"sammeltraderinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "reifen_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Reifenhändler",DWEV_fnc_virt_menu,"reifen",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"reifentraderinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "gummi_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gummihändler",DWEV_fnc_virt_menu,"gummi",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gummitraderinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "felgen_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Autotuner",DWEV_fnc_virt_menu,"felge",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"felgentraderinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "tabak_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Tabakshop",DWEV_fnc_virt_menu,"tabakshop",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"tabakinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "baustoff_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Baustoffhändler",DWEV_fnc_virt_menu,"baustoff",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"baustoffinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "brikett_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Briketthändler",DWEV_fnc_virt_menu,"brikett",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"kohleinfo",0,false,false,"",'player distance _target < 4'];
		};
	};

	case "steinhauer_haendler":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\legal.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Steinhauer",DWEV_fnc_virt_menu,"steinhauer",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"magmainfo",0,false,false,"",'player distance _target < 4'];
		};
	};


	// gangversteck
	case "gang1_supermarkt":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"gang",0,false,false,"",' _b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang2_supermarkt":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;!isNil {_b getVariable "gangOwner"} && (side player) == civilian && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang3_supermarkt":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Supermarkt",DWEV_fnc_virt_menu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && (side player) == civilian && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang1_waffen":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'_b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"gang",0,false,false,"",'_b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && !actionWeaponfree && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["Weaponfree Waffen",DWEV_fnc_weaponShopMenu,"Weaponfree",0,false,false,"",'_b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && actionWeaponfree && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang2_waffen":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'_b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"gang",0,false,false,"",'_b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && !actionWeaponfree && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["Weaponfree Waffen",DWEV_fnc_weaponShopMenu,"Weaponfree",0,false,false,"",'_b = nearestBuilding (getPosATL player); !isNil {_b getVariable "gangOwner"} && (side player) == civilian && actionWeaponfree && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang3_waffen":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Gemischtwarenladen",DWEV_fnc_weaponShopMenu,"genstore",0,false,false,"",'_b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && (side player) == civilian && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["Ausrüstung",DWEV_fnc_weaponShopMenu,"gang",0,false,false,"",'_b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && (side player) == civilian && !actionWeaponfree && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["Weaponfree Waffen",DWEV_fnc_weaponShopMenu,"Weaponfree",0,false,false,"",'_b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && (side player) == civilian && actionWeaponfree && player distance _target < 10 && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang1_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Marijuana verarbeiten",{ _this call DWEV_fnc_preprocess;},"marijuana",0,false,false,"",' _b = nearestBuilding (getPosATL player); DWEV_inv_cannabis > 0 && !DWEV_is_processing && player distance _target < 10 && (side player) == civilian && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang2_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Kokain verarbeiten",{ _this call DWEV_fnc_preprocess;},"coke",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; DWEV_inv_cocaine > 0 && !DWEV_is_processing && player distance _target < 10 && (side player) == civilian && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang3_verarbeiter":
	{
		_object allowDamage false; _object enableSimulation false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Heroin verarbeiten",{ _this call DWEV_fnc_preprocess;},"heroin",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; DWEV_inv_heroinu > 0 && !DWEV_is_processing && player distance _target < 10 && (side player) == civilian && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "gang_flagge":
	{
		_object allowDamage false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction ["Gang Versteck einnehmen",DWEV_fnc_captureHideout,"",0,false,false,"",' (side player) == civilian && player distance _target < 10 && !isNil {(group player) getVariable "gang_owner"}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"gangversteck",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "illegal_leader_flagge":
	{
		_object allowDamage false;
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction ["Kontrolle über illegalen Handel übernehmen",DWEV_fnc_captureIllegalTrading,"",0,false,false,"",' vehicle player == player && (side player) == civilian && player distance _target < 10 && !isNil {(group player) getVariable "gang_owner"}'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"illegal_handel",0,false,false,"",'player distance _target < 10'];
		};
	};
	
	
	
// WERBUNG
	case "werbung_casino":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Wolflogo\casino.paa"];
	};

	case "werbung_markt":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\werbung_markt1024.paa"];
	};

	case "werbung_qloc":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\qloc.paa"];
	};

	case "werbung_playerindex":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\playerindex.paa"];
	};
	
	case "werbung_globalnation":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\GamerNation.paa"];
	};

	case "polizei_eingang":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\Polizei_verbot.paa"];
	};

	case "werbung_frei":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\werbung_frei.paa"];
	};

	case "werbung_preis":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"textures\Werbung\werbung_frei.paa"];
	};

	case "parkplatz_zivi":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\parkplatz.paa"];
	};

	case "parkplatz_lkw":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\parkplatz-lkw.paa"];
	};

	case "parkplatz_behindert":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\pbehindert.paa"];
	};

	case "parkplatz_einsatz":
	{
		_object enableSimulation false; _object allowDamage false;
		_object setObjectTexture [0,"icons\ppolice.paa"];
	};

	case "Markt_flagge":
	{
		_object allowDamage false;
		_object setFlagTexture "textures\Wolflogo\Flagge.paa"
	};

	case "adventslose":
	{
		removeUniform _object; removeGoggles _object; removeHeadGear _object; removeVest _object;
		_object enableSimulation false; _object allowDamage false;
		_object addUniform "U_BG_Guerilla2_1";
		/*_object setObjectTextureGlobal [0,'textures\kleidung\weihnachtsmann.paa'];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Weihnachtslos kaufen (2500 €)",DWEV_fnc_adventsloseask,"adventslose",0,false,false,"",'(player distance _target < 4) && enableAdventslose && (player getVariable["noobschutz",false])'];
			_this addAction["Weihnachtslos kaufen (20000€)",DWEV_fnc_adventsloseask,"adventslose",0,false,false,"",'(player distance _target < 4) && enableAdventslose && !(player getVariable["noobschutz",false])'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"adventslose",0,false,false,"",'player distance _target < 10'];
			_this setObjectTextureGlobal [0,'textures\kleidung\weihnachtsmann.paa'];
		}; */
	};
	

	case "auktion":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\auktion.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
//			_this addAction ["Auktionshaus", {[] spawn DWEV_fnc_vAH_load; },"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian '];
			_this addAction["<t color='#FF0000'>Auktionshaus</t>",DWEV_fnc_text,"deaktiviert",0,false,false,"",'player distance _target < 4'];
			_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"Auktionshaus",0,false,false,"",'player distance _target < 10'];
		};
	};

	case "Personalausweis":
	{
		_object allowDamage false; _object enableSimulation false;
		_object setObjectTexture [0,"textures\Npc_schilder\lizenzen.paa"];
		_object spawn
		{
			waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
			_this addAction["Persoenliche Daten ändern (Kosten: 250.000 €)",DWEV_fnc_aenderePerso,"",0,false,false,"",' DWEV_persoReady && playerSide == civilian '];
			_this addAction["Personalausweis beantragen",DWEV_fnc_persoNeu,"",0,false,false,"",' DWEV_stranger && playerSide == civilian '];
		};
	};
};

switch (worldName) do
{
	case "Altis" :
	{
		switch (_type) do
		{
			case "DHL_NPC_10"://Spzaros
			{
				_object allowDamage false; _object enableSimulation false;
				_object setObjectTexture [0,"textures\Npc_schilder\dhl.paa"];
				_object spawn
				{
					waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
					_this addAction["Paket ausliefern",DWEV_fnc_dpFinish,"dhl_1",0,false,false,"",'!isNil "DWEV_dp_point" && DWEV_delivery_in_progress && DWEV_dp_point == _target && player distance _target < 4'];
					_this addAction["Liefermission annehmen",DWEV_fnc_getDPMission,"dhl_1",0,false,false,"",' isNil "DWEV_dp_point" && !DWEV_delivery_in_progress && player distance _target < 4'];
					_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"dhl",0,false,false,"",'player distance _target < 4'];
					_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spzaros" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spzaros" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spzaros",0,false,false,"",' !lc_spzaros && (side player) == civilian && player distance _target < 4'];
				};
			};

			case "DHL_NPC_20"://SPVerwahrstelle
			{
				_object allowDamage false; _object enableSimulation false;
				_object setObjectTexture [0,"textures\Npc_schilder\dhl.paa"];
				_object spawn
				{
					waitUntil{!isNil "DWEV_firstSpawn"}; waitUntil{!DWEV_firstSpawn};
					_this addAction["Paket ausliefern",DWEV_fnc_dpFinish,"dhl_1",0,false,false,"",'!isNil "DWEV_dp_point" && DWEV_delivery_in_progress && DWEV_dp_point == _target && player distance _target < 4'];
					_this addAction["Liefermission annehmen",DWEV_fnc_getDPMission,"dhl_1",0,false,false,"",' isNil "DWEV_dp_point" && !DWEV_delivery_in_progress && player distance _target < 4'];
					_this addAction["<t color='#00FF00'>Information</t>",DWEV_fnc_text,"dhl",0,false,false,"",'player distance _target < 4'];
					_this addAction[format["%1 (%2€)",(getText(missionConfigFile >> "Licenses" >> "spverwahrstelle" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "spverwahrstelle" >> "price"))] call DWEV_fnc_numberText],{_this call DWEV_fnc_buyLicense;},"spverwahrstelle",0,false,false,"",' !lc_spverwahrstelle && (side player) == civilian && player distance _target < 4'];
				};
			};
		};
	};
	case "Tanoa" :
	{
		switch (_type) do
		{
			
		};
	};
};
