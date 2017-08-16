/* 
 File: fn_setupActions.sqf 
 
 Description: 
 Master addAction file handler for all client-based actions. 
*/ 
waitUntil {!isNil "lhm_session_completed" && lhm_session_completed}; 
 
lhm_fnc_lhm_updateActionVars = compileFinal ' 
 _side = _this select 0; 
 switch (_side) do 
 { 
  case "COP": 
  { 
   COP_Get_in = (!isNull cursorObject && (cursorObject isKindOf "Car" || cursorObject isKindOf "Air") && (locked cursorObject) != 0 && cursorObject distance player < 3.5); 
   COP_Get_out = ((vehicle player != player) && (locked(vehicle player) isEqualTo 2)); 
 
   COP_useEMP = ([player] call lhm_fnc_isEmpOperator); 
 
   Cop_SeizeWeapons = (!isNull cursorObject && (player distance cursorObject) < 6 && speed cursorObject < 1 && cursorObject isKindOf "Man" && (isPlayer cursorObject) && (side cursorObject  isEqualTo  civilian) && (cursorObject getVariable "restrained")); 
 
   COP_Speedtrap_ON = (!isNull cursorObject && (player distance cursorObject) < 10 && (cursorObject isKindOf "Land_Runway_PAPI_4") && !(cursorObject getVariable["speedtrap_active", false]) && (cursorObject getVariable["speedtrap_registered", false])); 
   COP_Speedtrap_OFF = (!isNull cursorObject && (player distance cursorObject) < 10 && (cursorObject isKindOf "Land_Runway_PAPI_4") && (cursorObject getVariable["speedtrap_active", false]) && (cursorObject getVariable["speedtrap_registered", false])); 
   COP_Speedtrap_GetPhotos = (!isNull cursorObject && (player distance cursorObject) < 10 && (cursorObject isKindOf "Land_Runway_PAPI_4") && (cursorObject getVariable["speedtrap_registered", false])); 
   COP_Speedtrap_ShowData = (!isNull cursorObject && (player distance cursorObject) < 10 && (cursorObject isKindOf "Land_Runway_PAPI_4") && (cursorObject getVariable["speedtrap_registered", false])); 
   COP_Speedtrap_SetLimit = (!isNull cursorObject && (player distance cursorObject) < 10 && (cursorObject isKindOf "Land_Runway_PAPI_4") && (cursorObject getVariable["speedtrap_registered", false])); 
   COP_Speedtrap_Pickup = (!isNull cursorObject && (player distance cursorObject) < 10 && (cursorObject isKindOf "Land_Runway_PAPI_4") && (cursorObject getVariable["speedtrap_registered", false])); 
  }; 
 
  case "CIV": 
  { 
   CIV_Activate_Suicide_Vest = (vest player  isEqualTo  "V_HarnessOGL_brn" && alive player && playerSide  isEqualTo  civilian && !lhm_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")); 
 
   CIV_Serv_Target_Vehicle = ((typeOf (vehicle player)  isEqualTo  "I_G_Offroad_01_F" or (typeOf (vehicle player)  isEqualTo  "C_Heli_Light_01_civil_F" && "mpmissions\__cur_mp.altis\core\textures\vehicles\hummingbird\adac_hummingbird.jpg" in getObjectTextures vehicle player) or (typeOf (vehicle player)  isEqualTo  "C_SUV_01_F" && "mpmissions\__cur_mp.altis\core\textures\vehicles\suv\adac_suv.jpg" in getObjectTextures vehicle player)) or (typeOf (vehicle player)  isEqualTo  "O_Heli_Light_02_unarmed_F" && "mpmissions\__cur_mp.altis\core\textures\vehicles\orca\civ_orca_adac.paa" in getObjectTextures vehicle player) && ((vehicle player animationPhase "HideServices")  isEqualTo  0) && ((vehicle player) in lhm_vehicles) && (speed vehicle player) < 1); 
 
   CIV_Push_Ship = (!isNull cursorObject && player distance cursorObject < 4.5 && cursorObject isKindOf "Ship"); 
 
   CIV_Radio_On = (!antispam && vehicle player != player && !radiospam && driver vehicle player  isEqualTo  player); 
   CIV_Radio_Off = (antispam && vehicle player != player && driver vehicle player  isEqualTo  player); 
 
   CIV_Fishing = ((surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && lhm_carryWeight < lhm_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !lhm_net_dropped); 
 
   CIV_Uran = (cursorObject isKindOf "Land_GasTank_02_F"); 
 
   CIV_Container_Essen = (!isNull cursorObject && (cursorObject isKindOf "Land_Pod_Heli_Transport_04_medevac_F") && cursorObject distance player < 5.5); 
 
   CIV_Container_Trinken = (!isNull cursorObject && (cursorObject isKindOf "Land_Pod_Heli_Transport_04_medevac_F") && cursorObject distance player < 5.5); 
 
   ADMIN_Gang_SetOwner = ((player distance cursorObject) < 5 && (call lhm_adminlevel) > 1 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  -1 && (cursorObject isKindOf "Flag_Quontrol_F")); 
   if (!isNil "lhm_gangData") then { 
    if (count lhm_gangData > 0) then { 
    CIV_Gang_StoreVehicle = (!lhm_garage_store && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_TentHangar_V1_F" or cursorObject isKindOf "Land_i_Garage_V1_F")); 
    CIV_Gang_GarageVeh = (!lhm_garage_store && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_i_Garage_V1_F")); 
    CIV_Gang_GarageAir = (!lhm_garage_store && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_TentHangar_V1_F")); 
    CIV_Gang_ATM = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_Atm_01_F")); 
    CIV_Gang_BaseBuilder = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && lhm_gangarea_buildmode && (cursorObject isKindOf "Flag_Quontrol_F")); 
    CIV_Gang_ClothingStore = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_ShelvesMetal_F")); 
    CIV_Gang_FuelStationCar = (vehicle player  isEqualTo  player && !lhm_action_inUse && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_fs_feed_F")); 
    CIV_Gang_FuelStationAir = (vehicle player  isEqualTo  player && !lhm_action_inUse && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_FuelStation_Feed_F")); 
    CIV_Gang_Gatelocks = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (typeOf cursorObject in ["Land_Mil_WiredFence_Gate_F", "Land_Net_Fence_Gate_F", "Land_BarGate_F", "Land_Stone_Gate_F", "Land_City_Gate_F"])); 
    CIV_Gang_GenStore = ((player distance cursorObject) < 5 &&(cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_Metal_wooden_rack_F")); 
    CIV_Gang_Medical = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_Medevac_HQ_V1_F")); 
    CIV_Gang_Market = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Land_CashDesk_F")); 
    CIV_Gang_RemoveObject = ((player distance cursorObject) < 5 && !lhm_action_inUse && lhm_gangarea_buildmode && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && !(cursorObject isKindOf "Flag_Quontrol_F")); 
    CIV_Gang_toggleBuildMode = ((player distance cursorObject) < 5 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && (cursorObject isKindOf "Flag_Quontrol_F")); 
    CIV_Gang_moveObject = ((player distance cursorObject) < 15 && (cursorObject getVariable ["gangarea_id", -1])  isEqualTo  (lhm_gangData select 0) && (lhm_gangData select 3) > 1 && !lhm_action_inUse && lhm_gangarea_buildmode && !(cursorObject isKindOf "Flag_Quontrol_F") && isNil"AttachedObj"); 
    }; 
   }; 
  }; 
 
  case "MED": 
  { 
   MED_Organ_Theft = (!isNull cursorObject && cursorObject isKindOf "Man" && !alive cursorObject && !(isPlayer cursorObject) && cursorObject distance player < 3.5 && !(cursorObject getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting")); 
   MED_Container_Pickup = (cursorObject isKindOf "Land_Pod_Heli_Transport_04_medevac_F"); 
   MED_Get_in = (!isNull cursorObject && (cursorObject isKindOf "Car" || cursorObject isKindOf "Air") && (locked cursorObject) != 0 && cursorObject distance player < 3.5); 
   MED_Get_out = ((vehicle player != player) && (locked(vehicle player) isEqualTo 2)); 
   MED_Get_in_as_Driver = (!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (locked cursorObject) != 0 && cursorObject distance player < 3.5); 
   MED_Untow = ((vehicle player != player) && (vehicle player iskindof "B_Truck_01_mover_F") && (vehicle player getvariable "tow_status"  isEqualTo  "towing")); 
   MED_buffAdr = ((((!isNull cursorObject) && (isPlayer cursorObject))) && ((player getVariable ["LHM_Donatorlevel",0]) > 0)); 
   MED_buffNano = ((((!isNull cursorObject) && (isPlayer cursorObject))) && ((player getVariable ["LHM_Donatorlevel",0]) > 1)); 
   MED_BuffSoyl = ((((!isNull cursorObject) && (isPlayer cursorObject))) && ((player getVariable ["LHM_Donatorlevel",0]) > 2)); 
 
}; 
 
  case "All": 
  { 
   //All_SitDown = (!isNull cursorObject && (player distance cursorObject) < 3 && !lhm_sitting && (cursorObject isKindOf "Land_Bench_01_F" || cursorObject isKindOf "Land_Bench_02_F" || cursorObject isKindOf "Land_Bench_F" || cursorObject isKindOf "Land_CampingChair_V2_F" || cursorObject isKindOf "Land_ChairPlastic_F" || cursorObject isKindOf "Land_ChairWood_F")); 
   //All_StandUp = (lhm_sitting); 
  }; 
 
  case "SEC": 
  { 
   SEC_Get_in = (!isNull cursorObject && (cursorObject isKindOf "Car" || cursorObject isKindOf "Air") && (locked cursorObject) != 0 && cursorObject distance player < 3.5); 
   SEC_Get_out = ((vehicle player != player) && (locked(vehicle player) isEqualTo 2)); 
  }; 
 }; 
'; 
 
/////////////////// Actions for all Sides /////////////////// 
  //lhm_actions = lhm_actions + [player addAction["Sitdown",lhm_fnc_sitDown,cursorObject,10,false,false,"",'All_SitDown']]; 
  //lhm_actions = lhm_actions + [player addAction["Stand up", lhm_fnc_sitDown,cursorObject,10,false,false,"",'All_StandUp']]; 
///////////////////////////////////////////////////////////// 
 
switch (playerSide) do 
{ 
 case west: 
 { 
  ["COP"] call lhm_fnc_lhm_updateActionVars; 
  //Actions come here 
 
  //Cops can open locked doors 
  //lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>Toggle House Locks</t>",lhm_fnc_lhm_lockHouse,cursorObject,9999999,false,false,"",'COP_Toggle_House_Locks']]; 
 
  // Cops can overrides Vehicle Lock 
  //lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>(Einsteigen) Fahrzeug",lhm_fnc_unlockVeh,"driver",0,false,false,"",'COP_Get_in']]; 
 
  lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>[Aussteigen] Fahrzeug",lhm_fnc_unlockVeh,"exit",100,false,false,"",'COP_Get_out']]; 
 
  // EMP Weapon 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>[EMP] Console</t>",lhm_fnc_openEmpMenu,[],0,false,false,"",'COP_useEMP']]; 
 
  //Seize Objects 
  //lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>Seize (TARGET PLAYER) Weapons",lhm_fnc_seizeWeapons,cursorObject,0,false,false,"",'Cop_SeizeWeapons']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>Seize Objects",lhm_fnc_seizeObjects,cursorObject,0,false,false,"",'count(nearestObjects [player,["GroundWeaponHolder"],3])>0']]; 
 
  //Speedtrap 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Switch on</t>",lhm_fnc_speedtrapActivate,cursorObject,10,false,false,"",'COP_Speedtrap_ON']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Switch off</t>",lhm_fnc_speedtrapActivate,cursorObject,10,false,false,"",'COP_Speedtrap_OFF']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Get film</t>",lhm_fnc_speedtrapGetPhotoList,1,10,false,false,"",'COP_Speedtrap_GetPhotos']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Show Data</t>",lhm_fnc_speedtrapGetPhotoList,0,10,false,false,"",'COP_Speedtrap_ShowData']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Set Speedlimit</t>",lhm_fnc_speedtrapSetSpeedLimit,cursorObject,10,false,false,"",'COP_Speedtrap_SetLimit']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Pick up Speedtrap</t>",lhm_fnc_speedtrapRemove,cursorObject,10,false,false,"",'COP_Speedtrap_Pickup']]; 
 
  // 
  if (!isNil "COP_Action_Vars") then { 
   terminate COP_Action_Vars; 
  }; 
  COP_Action_Vars = [] spawn { 
   while {alive player} do { 
    sleep 1; 
    ["COP"] call lhm_fnc_lhm_updateActionVars; 
    ["All"] call lhm_fnc_lhm_updateActionVars; 
   }; 
  }; 
 }; 
 
 case civilian: 
 { 
  ["CIV"] call lhm_fnc_lhm_updateActionVars; 
  //Actions come here 
 
  //Suicide Vest 
  lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>[WARNUNG] Sprengweste aktivieren",lhm_fnc_suicideBomb,"",0,false,false,"",'CIV_Activate_Suicide_Vest']]; 
 
  //Service Truck Stuff 
  lhm_actions = lhm_actions + [player addAction["<t color='#FFD700'>[SERVICE] Zielfahrzeug</t>",lhm_fnc_serviceTruck,"",99,false,false,"",'CIV_Serv_Target_Vehicle']]; 
 
  // Push Ship 
  //lhm_actions = lhm_actions + [player addAction["Push Ship",lhm_fnc_pushVehicle,"",0,false,false,"",'CIV_Push_Ship']]; 
 
  //Car Radio 
  lhm_actions = lhm_actions + [player addAction["Radio AN",lhm_fnc_Radio,false,0,false,false,"",'CIV_Radio_On']]; 
  lhm_actions = lhm_actions + [player addAction["Radio AUS",{antispam = false;},false,0,false,false,"",'CIV_Radio_Off']]; 
 
  //Drop fishing net 
  lhm_actions = lhm_actions + [player addAction["Fischnetz werfen",lhm_fnc_dropFishingNet,"",0,false,false,"",'CIV_Fishing']]; 
 
  // Pickup Uran Garbage 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Pickup Uran Garbage</t>",lhm_fnc_packupUran,"",0,false,false,"",'CIV_Uran']]; // neu 
 
  // Gang Building 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Fahrzeug abstellen</t>",lhm_fnc_storeVehicle,"",0,false,false,"",'CIV_Gang_StoreVehicle']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Flug Garage</t>",build_fnc_AirGarage,cursorObject,0,false,false,"",'CIV_Gang_GarageAir']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>ATM</t>",lhm_fnc_atmMenu,name player, 0, false, false, "", 'CIV_Gang_ATM']]; 
  lhm_actions = lhm_actions + [player addAction["<img image='core\build\icons\shop.paa'/> <t color='#3CBEDE'>Gang-Versteck Shop</t>",build_fnc_openhideoutShop, name player, 0, false, false, "", 'CIV_Gang_BaseBuilder']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Bekleidung</t>",lhm_fnc_clothingMenu,"bruce", 0, false, false, "", 'CIV_Gang_ClothingStore']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Tanken Fahrzeug</t>",lhm_fnc_fuelStationMenu,["CAR",0.5],0,false,false,"","CIV_Gang_FuelStationCar"]]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Tanken Luft</t>",lhm_fnc_fuelStationMenu,["AIR",0.5],0,false,false,"","CIV_Gang_FuelStationAir"]]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Fahrzeug Garage</t>",build_fnc_vehicleGarage,cursorObject, 0, false, false, "", 'CIV_Gang_GarageVeh']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Tor umschalten</t>",build_fnc_Gatelocks,cursorObject,0,false,false,"",'CIV_Gang_Gatelocks']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Merchandise Shop</t>",lhm_fnc_weaponShopMenu,"genstore", 0, false, false, "",'CIV_Gang_GenStore']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Erste Hilfe</t>",lhm_fnc_healHospital, name player, 0, false, false, "",'CIV_Gang_Medical']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Item Storage</t>",lhm_fnc_openStorage,cursorObject,10,false,false,"",'CIV_Gang_Storage']]; 
  lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Markt</t>",lhm_fnc_virt_menu,"market", 0, false, false, "", 'CIV_Gang_Market']]; 
  lhm_actions = lhm_actions + [player addAction["<img image='core\build\icons\delete.paa'/> <t color='#FF0000'>Objekt entferne</t>",build_fnc_removeObject,cursorObject, 998, false, false, "", 'CIV_Gang_RemoveObject']]; 
  //lhm_actions = lhm_actions + [player addAction["<t color='#3CBEDE'>Gangbesitz festlegen</t>",build_fnc_setOwner,cursorObject, 0, false, false, "", 'ADMIN_Gang_SetOwner']]; 
  lhm_actions = lhm_actions + [player addAction["<img image='core\build\icons\toggle.paa'/> <t color='#3CBEDE'>Baumodus umschalten</t>",build_fnc_toggleBuildMode,cursorObject, 0, false, false, "", 'CIV_Gang_toggleBuildMode']]; 
  lhm_actions = lhm_actions + [player addAction["<img image='core\build\icons\attach.paa'/> <t color='#3CBEDE'>Objekt bewegen</t>",build_fnc_moveObject,cursorObject, 999, false, false, "", 'CIV_Gang_moveObject']]; 
  // 
 
  // Container 
  //lhm_actions = lhm_actions + [player addAction[localize "STR_pAct_hunger",lhm_fnc_hunger,"<t color='#b0601e'>Essen</t>",100,false,false,"",'CIV_Container_Essen']]; 
  //lhm_actions = lhm_actions + [player addAction[localize "STR_pAct_trinken",lhm_fnc_trinken,"<t color='#1e25b0'>Trinken</t>",100,false,false,"",'CIV_Container_Trinken']]; 
  // 
 
  if (!isNil "CIV_Action_Vars") then { 
   terminate CIV_Action_Vars; 
  }; 
  CIV_Action_Vars = [] spawn { 
   while {alive player} do { 
    Uisleep 1; 
    ["CIV"] call lhm_fnc_lhm_updateActionVars; 
    ["All"] call lhm_fnc_lhm_updateActionVars; 
   }; 
  }; 
 }; 
 
 case independent: 
 { 
  ["MED"] call lhm_fnc_lhm_updateActionVars; 
  //Actions come here 
 
  lhm_actions = lhm_actions + [player addAction["Organe sammeln",lhm_fnc_takeOrgans,"",0,false,false,"",'MED_Organ_Theft']]; 
 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Container aufheben</t>",lhm_fnc_packupcontainer,"",0,false,false,"",'MED_Container_Pickup']]; 
 
  //lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>(Einsteigen) Fahrzeug",lhm_fnc_unlockVeh,"driver",0,false,false,"",'MED_Get_in']]; 
 
  lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>[Aussteigen] Fahrzeug",lhm_fnc_unlockVeh,"exit",100,false,false,"",'MED_Get_out']]; 
 
  //lhm_actions = lhm_actions + [player addAction["<t color='#FF0000'>Untow Vehicle</t>",lhm_fnc_untowTruck,"",0,false,false,"",'MED_Untow']]; 
 
  // Buffs 
  lhm_actions = lhm_actions + [player addAction[format["<t color='#FFFFFF'>Buff Adrenalin</t>"],lhm_fnc_run_buff_target,"lhm_fnc_civ_adrenalin",10,false,false,"",'MED_buffAdr']]; 
  lhm_actions = lhm_actions + [player addAction[format["<t color='#0000FF'>Buff Nanobots</t>"],lhm_fnc_run_buff_target,"lhm_fnc_civ_nanobots",10,false,false,"",'MED_buffNano']]; 
  lhm_actions = lhm_actions + [player addAction[format["<t color='#00FF00'>Buff Soylent Green</t>"],lhm_fnc_run_buff_target,"lhm_fnc_civ_SoylentGreenBuff",10,false,false,"",'MED_buffSoyl']]; 
 
 
 
  // 
  if (!isNil "MED_Action_Vars") then { 
   terminate MED_Action_Vars; 
  }; 
  MED_Action_Vars = [] spawn { 
   while {alive player} do { 
    Uisleep 1; 
    ["MED"] call lhm_fnc_lhm_updateActionVars; 
    ["All"] call lhm_fnc_lhm_updateActionVars; 
   }; 
  }; 
 
 }; 
 
 case east: 
 { 
  ["SEC"] call lhm_fnc_lhm_updateActionVars; 
  //Actions come here 
  //lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>(Einsteigen) Fahrzeug",lhm_fnc_unlockVeh,"driver",0,false,false,"",'SEC_Get_in']]; 
 
  lhm_actions = lhm_actions + [player addAction["<t color='#1E90FF'>[Aussteigen] Fahrzeug",lhm_fnc_unlockVeh,"exit",100,false,false,"",'SEC_Get_out']]; 
 
  // 
 
  if (!isNil "SEC_Action_Vars") then { 
   terminate SEC_Action_Vars; 
  }; 
  SEC_Action_Vars = [] spawn { 
   while {alive player} do { 
    Uisleep 1; 
    ["SEC"] call lhm_fnc_lhm_updateActionVars; 
    ["All"] call lhm_fnc_lhm_updateActionVars; 
   }; 
  }; 
 }; 
 
}; 
diag_log format ["::lhm Client:: Init LHM Actions Done!"];