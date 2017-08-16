#define GETC(var) (call var)
/*
inoDB - TAFF
*/
private "_spawn";
[] call life_fnc_anlid;
uiSleep 0.5;
player say3D "bombarm";
closedialog 0;
if (playerside != civilian) exitwith { hint "Vous ne pouvez pas faire partie d'une entrerpise, rester concentrez sur votre metier !"};
if(GETC(life_tafflevel) == 0) exitwith { hint "Vous ne faites pas encore partie d'une entreprise, il serait temps de vous trouvez un travail !"};
		if(GETC(life_tafflevel) > 0) then {
			hint format["Acces autorisé %1",name player];
			switch (GETC(life_tafflevel)) do
			{
				case 1: {_spawn = "car_taff1";};
				case 2: {_spawn = "car_taff2";};
				case 3: {_spawn = "car_taff3";};
				case 4: {_spawn = "car_taff4";};
				case 5: {_spawn = "car_taff5";};
				case 6: {_spawn = "car_taff6";};	
				case 7: {_spawn = "car_taff7";};
				case 8: {_spawn = "car_taff8";};				
			};
		};
life_garage_sp = _spawn;
life_actions = life_actions + [player addAction["<t color='#ADFF2F'>DAB</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 ']];
life_actions = life_actions + [player addAction["Marché",life_fnc_virt_menu,"markettaff",0,false,false,"",'']];
life_actions = life_actions + [player addAction["Magasin",life_fnc_weaponShopMenu,"genstore",0,false,false,"",'']];
life_actions = life_actions + [player addAction["Vêtements",life_fnc_clothingMenu,"bruce"]];
life_actions = life_actions + [player addAction["Concessionnaire",life_fnc_vehicleShopMenu,["civ_car",civilian,_spawn,"civ","Concessionnaire"]]];
life_actions = life_actions + [player addAction["Mon garage",{[[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP; life_garage_type = "Car"; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Recherche..."]; }]];

life_actions = life_actions + [player addAction["Mes Hélicoptères", {[[getPlayerUID player,playerSide,"Air",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP; life_garage_type = "Air"; createDialog "Life_impound_menu"; disableSerialization; ctrlSetText[2802,"Recherche..."];  }]];

life_actions = life_actions + [player addAction["Ranger dans mon garage", { private["_nearVehicle"]; systemChat str(_this select 0); _nearVehicle = nearestObjects[(getPos player),["Car","Ship","Air"],20] select 0; if(isNil "_nearVehicle") exitWith {hint "Gare ton véhicule a coté !";};  [[_nearVehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;  hint "Rangement en cours...";   life_garage_store = true;  },"",0,false,false,"",'!life_garage_store']];

life_show_actions = true;
uiSleep 90;
removeAllActions player;