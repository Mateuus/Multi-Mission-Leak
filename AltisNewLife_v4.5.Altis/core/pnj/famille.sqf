#define GETC(var) (call var)
/*
inoDB - QG
*/
private "_spawn";
[] call life_fnc_anlid;
uiSleep 1;
player say3D "bombarm";
closedialog 0;
if (playerside != civilian) exitwith { hint "Vous ne pouvez pas faire partie d'une famille, restez concentrer sur votre metier"};
if(GETC(life_reblevel) == 0) exitwith { hint "Vous ne faites pas partie d'une famille, et c'est sans doute mieux pour vous !"};
		if(GETC(life_reblevel) > 0) then {
			hint format["Acces autorisé %1",name player];
			switch (GETC(life_reblevel)) do
			{
				case 1: {_spawn = "car_gang1";};
				case 2: {_spawn = "car_gang2";};
				case 3: {_spawn = "car_gang3";};
				case 4: {_spawn = "car_gang4";};
				case 5: {_spawn = "car_gang5";};
				case 6: {_spawn = "car_gang6";};
				case 7: {_spawn = "car_gang7";};
				case 8: {_spawn = "car_gang8";};
				case 9: {_spawn = "car_gang9";};
				case 10: {_spawn = "car_gang10";};
				case 11: {_spawn = "car_gang11";};
				case 12: {_spawn = "car_gang12";};
				case 13: {_spawn = "car_gang13";};
				case 14: {_spawn = "car_gang14";};
			};
};
life_garage_sp = _spawn;
life_actions = life_actions + [player addAction["<t color='#ADFF2F'>DAB</t>",life_fnc_atmMenu]];
life_actions = life_actions + [player addAction["Marché",life_fnc_virt_menu,"marketreb",0,false,false,"",'liciv_rebel']];
life_actions = life_actions + [player addAction["Armurerie",life_fnc_weaponShopMenu,"rebel",0,false,false,"",'liciv_rebel']];
life_actions = life_actions + [player addAction["Vêtements",life_fnc_clothingMenu,"reb",0,false,false,"",'liciv_rebel']];
life_actions = life_actions + [player addAction["Concessionnaire",life_fnc_vehicleShopMenu,["reb_car",civilian,_spawn,"civ","Concessionnaire"]]];
life_actions = life_actions + [player addAction["Mon garage", {[[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP; life_garage_type = "Car";  createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Recherche..."]; }]];
life_actions = life_actions + [player addAction["Mes Hélicoptères", {[[getPlayerUID player,playerSide,"Air",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP; life_garage_type = "Air"; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Recherche..."];  }]];
life_actions = life_actions + [player addAction["Ranger dans mon garage",  { private["_nearVehicle"];   _nearVehicle = nearestObjects[(getPos player),["Car","Ship","Air"],20] select 0; if(isNil "_nearVehicle") exitWith {hint "Gare ton véhicule a coté !";};   [[_nearVehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP; hint "Rangement en cours..."; life_garage_store = true;  },"",0,false,false,"",'!life_garage_store']];

life_show_actions = true;
uiSleep 120;
removeAllActions player;