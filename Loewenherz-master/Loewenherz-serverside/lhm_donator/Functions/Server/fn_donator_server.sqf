//diag_log format["DEBUG: Running Donator Server Init: _this = %1",_this]; 
if (isServer) then { 
 
[ 
  "lhm_fnc_donatorvehicleListCfg", 
  "lhm_fnc_donatorvehShopLicenses", 
  "lhm_fnc_donatorweaponShopCfg", 
  "lhm_fnc_donatorvehicleShopBuy", 
  "lhm_fnc_donatorvehicleShopLBChange", 
  "lhm_fnc_donatorvehicleShopMenu", 
  "lhm_fnc_donatorweaponShopMenu", 
  "lhm_fnc_donatorweaponShopFilter", 
  "lhm_fnc_vehicleColorCfg", 
  "lhm_fnc_vehicleColorStr", 
  "lhm_fnc_colorVehicle", 
  "lhm_fnc_numberText", 
  "lhm_fnc_DropDonWeapon", 
  "lhm_fnc_DonWeapDropConfig" 
] spawn lhm_fnc_streamFunction; 
 
// Creating LHM Donator Units 
 [] spawn { 
  waituntil {time > 1}; 
  [] spawn { 
 
   //Vehicle Shops 
   "C_man_1" createUnit [[14164, 21248, 0],(group master_group)," 
    removeallWeapons this; 
    this allowDamage false; 
    this enableSimulation false; 
    this setVariable[""realname"", ""Donator Vehicle Shop""]; 
    this addAction[""Fahrzeug Shop"",lhm_fnc_donatorvehicleShopMenu,[""donator_1"",civilian,[""donator_2"",""donator_2_1""],""don"",""Loewenherz Donator Shop""],0,false,false,"""",'(player getVariable [""LHM_Donatorlevel"",0]) > 0']; 
    this addAction[""Fahrzeuggarage"",  {   private[""_nearVehicle""];   _nearVehicle = nearestObjects[(getPos (_this select 0)),[""Car"",""Ship"",""Air""],35] select 0;   if(isNil ""_nearVehicle"") exitWith {hint ""Kein Fahrzeug in der Nähe..."";};   [[_nearVehicle,false,(_this select 1)],""TON_fnc_vehicleStore"",false,false] call lhm_fnc_mp;   hint ""Es wird versucht das Fahrzeug zu sichern..."";   lhm_garage_store = true;  },"""",0,false,false,"""",'!lhm_garage_store']; 
   "]; 
   "C_man_1" createUnit [[8162.66,10910.6,0],(group master_group)," 
    removeallWeapons this; 
    this allowDamage false; 
    this enableSimulation false; 
    this setVariable[""realname"", ""Donator Vehicle Shop""]; 
    this addAction[""Fahrzeug Shop"",lhm_fnc_donatorvehicleShopMenu,[""donator_1"",civilian,[""donator_1"",""donator_1_1""],""don"",""Loewenherz Donator Shop""],0,false,false,"""",'(player getVariable [""LHM_Donatorlevel"",0]) > 0']; 
    this addAction[""Fahrzeuggarage"",  {   private[""_nearVehicle""];   _nearVehicle = nearestObjects[(getPos (_this select 0)),[""Car"",""Ship"",""Air""],35] select 0;   if(isNil ""_nearVehicle"") exitWith {hint ""Kein Fahrzeug in der Nähe..."";};   [[_nearVehicle,false,(_this select 1)],""TON_fnc_vehicleStore"",false,false] call lhm_fnc_mp;   hint ""Es wird versucht das Fahrzeug zu sichern..."";   lhm_garage_store = true;  },"""",0,false,false,"""",'!lhm_garage_store']; 
   "]; 
 
   //Weapon Shops 
   "C_man_1" createUnit [[14225, 21241, 0],(group master_group)," 
    removeallWeapons this; 
    this allowDamage false; 
    this enableSimulation false; 
    this setVariable[""realname"", ""Donator Weapon Shop""]; 
    this addAction[""Donator Waffen Shop"",lhm_fnc_donatorweaponShopMenu,""donator"",0,false,false,"""",' _target distance _this < 5 && ((player getVariable [""LHM_Donatorlevel"",0]) > 0) && playerSide == civilian']; 
    this addAction[""<t color='#ADFF2F'>ATM</t>"",lhm_fnc_atmMenu,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 ']; 
   "]; 
   "C_man_1" createUnit [[8172.93,10901.1,0],(group master_group)," 
    removeallWeapons this; 
    this allowDamage false; 
    this enableSimulation false; 
    this setVariable[""realname"", ""Donator Weapon Shop""]; 
    this addAction[""Donator Waffen Shop"",lhm_fnc_donatorweaponShopMenu,""donator"",0,false,false,"""",' _target distance _this < 5 && ((player getVariable [""LHM_Donatorlevel"",0]) > 0) && playerSide == civilian']; 
    this addAction[""<t color='#ADFF2F'>ATM</t>"",lhm_fnc_atmMenu,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 ']; 
   "]; 
 
   //Marker for Vehicle spawn 
   donator_1 = createMarker ["donator_1", [8151.35,10924.7,0]]; 
   donator_1 setMarkerType "Empty"; 
   donator_1 setMarkerDir 117.6; 
 
   donator_1_1 = createMarker ["donator_1_1", [8175.58,10925.9,0]]; 
   donator_1_1 setMarkerType "Empty"; 
   donator_1_1 setMarkerDir 117.6; 
 
   donator_2 = createMarker ["donator_2", [14152,21256,0]]; 
   donator_2 setMarkerType "Empty"; 
   donator_2 setMarkerDir 81.2; 
 
   donator_2_1 = createMarker ["donator_2_1", [14154.4,21261.8,0]]; 
   donator_2_1 setMarkerType "Empty"; 
   donator_2_1 setMarkerDir 81.2; 
 
   donator_area_1 = createMarker ["donator_area_1", [14221,21238,0]]; 
   donator_area_1 setMarkerColor "ColorYellow"; 
   donator_area_1 setMarkerType "loc_ViewTower"; 
   donator_area_1 setMarkerText "Donator Shop"; 
 
   donator_area_1_1 = createMarker ["donator_area_1_1", [8191.17,10936.6,0]]; 
   donator_area_1_1 setMarkerColor "ColorYellow"; 
   donator_area_1_1 setMarkerType "loc_ViewTower"; 
   donator_area_1_1 setMarkerText "Donator Shop"; 
 
   diag_log format["DONATOR: Shop Units and Markers created!"]; 
  }; 
 }; 
}; 
 
 
