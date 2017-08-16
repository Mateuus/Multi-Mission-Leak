#include <macro.h> 
/* 
 File: fn_weaponShopCfg.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Master configuration file for the weapon shops. 
 
 Return: 
 String: Close the menu 
 Array: 
 [Shop Name, 
 [ //Array of items to add to the store 
  [classname,Custom Name (set nil for default),price] 
 ]] 
*/ 
private["_shop"]; 
_shop = param [0,"",[""]]; 
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed. 
 
switch(_shop) do 
{ 
 case "donator": 
 { 
  switch(true) do 
  { 
   case (!license_civ_rebel): {"Du hast keine Rebellenlizenz!"}; 
   case ((player getVariable ["LHM_Donatorlevel",0]) == 0): {"You are not a donator!"}; 
   case ((player getVariable ["LHM_Donatorlevel",0]) == 1): 
   { 
    ["Loewenherz Donator Shop Tier 1", 
     [ 
      ["hgun_Rook40_F",nil,6500], 
      ["hgun_PDW2000_F",nil,20000], 
      ["optic_ACO_grn_smg",nil,3500], 
      ["ToolKit",nil,1000], 
      ["itemgps",nil,150], 
      ["Rangefinder",nil,20000], 
      ["bipod_02_F_tan",nil,7500], 
      ["16Rnd_9x21_Mag",nil,25], 
      ["30Rnd_9x21_Mag",nil,75] 
     ] 
    ]; 
   }; 
 
   case ((player getVariable ["LHM_Donatorlevel",0]) == 2): 
   { 
    ["Loewenherz Donator Shop Tier 2", 
     [ 
      ["hgun_Rook40_F",nil,6500], 
      ["hgun_PDW2000_F",nil,20000], 
      ["arifle_MK20C_plain_F",nil,25000], 
      ["srifle_DMR_01_F",nil,50000], 
      ["optic_ACO_grn_smg",nil,3500], 
      ["NVGoggles",nil,10000], 
      ["ToolKit",nil,1000], 
      ["itemgps",nil,150], 
      ["Rangefinder",nil,20000], 
      ["bipod_02_F_tan",nil,7500], 
      ["10Rnd_762x54_Mag",nil,500], 
      ["16Rnd_9x21_Mag",nil,25], 
      ["30Rnd_9x21_Mag",nil,75], 
      ["30Rnd_556x45_Stanag",nil,125] 
     ] 
    ]; 
   }; 
 
   case ((player getVariable ["LHM_Donatorlevel",0]) >= 3): 
   { 
    ["Loewenherz Donator Shop Tier 3", 
     [ 
      ["hgun_Rook40_F",nil,6500], 
      ["hgun_PDW2000_F",nil,20000], 
      ["hgun_pistol_heavy_01_F",nil,5850], 
      ["arifle_Mk20C_plain_F",nil,25000], 
      ["srifle_DMR_02_camo_F",nil,175000], //mar 
      ["srifle_DMR_02_sniper_F",nil,175000], //mar 
      ["ClaymoreDirectionalMine_Remote_Mag",nil,30000], 
      ["ATMine_Range_Mag",nil,250000], 
      ["srifle_DMR_01_F",nil,50000], 
      ["srifle_GM6_camo_F",nil,150000], 
      ["5Rnd_127x108_Mag",nil,5000], 
      ["10Rnd_338_Mag",nil,5000], 
      ["10Rnd_762x54_Mag",nil,500], 
      ["optic_SOS",nil,20000], 
      ["optic_ACO_grn_smg",nil,3500], 
      ["optic_MRCO",nil,10000], 
      ["muzzle_snds_H",nil,2500], 
      ["muzzle_snds_M",nil,2000], 
      ["bipod_02_F_tan",nil,7500], 
      ["NVGoggles",nil,10000], 
      ["ToolKit",nil,1000], 
      ["itemgps",nil,150], 
      ["Rangefinder",nil,15000], 
      ["FirstAidKit",nil,125], 
      ["16Rnd_9x21_Mag",nil,25], 
      ["30Rnd_9x21_Mag",nil,75], 
      ["11Rnd_45ACP_Mag",nil,85], 
      ["30Rnd_556x45_Stanag",nil,125], 
      ["V_PlateCarrierSpec_mtp",nil,20000] 
     ] 
    ]; 
   }; 
  }; 
 }; 
}; 
