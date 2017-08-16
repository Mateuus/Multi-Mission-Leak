#include <macro.h> 
Private ["_indexPW","_indexSW","_weapon","_item","_WeapDonLvl","_WeapCopLvl","_WeapSecLvl"]; 
if (isNil "DonWeapons") then { 
 diag_log format["ERROR: DonWeapons not Defined!"]; 
 DonWeapons = [[],[]]; 
}; 
if (isNil "CopWeapons") then { 
 diag_log format["ERROR: CopWeapons not Defined!"]; 
 CopWeapons = [[],[]]; 
}; 
if (isNil "SecuWeapons") then { 
 diag_log format["ERROR: SecuWeapons not Defined!"]; 
 SecuWeapons = [[],[]]; 
}; 
 
//Checking Donator Weapons 
//Vest 
_indexSW = ([DonWeapons select 0,vest _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexSW == "ARRAY") then { 
 _weapon = ((DonWeapons select 0) select (_indexSW select 0)); 
 _WeapDonLvl = ((DonWeapons select 1) select (_indexSW select 0)); 
 if ((player getVariable ["LHM_Donatorlevel",0]) < _WeapDonLvl) then 
 { 
  cutText [format["Diese Weste kann nur von Donator Level %1 benutzt werden.",_WeapDonLvl],"PLAIN DOWN"]; 
  removevest _this; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
}; 
 
 
 
//Primary 
_indexPW = ([DonWeapons select 0,primaryWeapon _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexPW == "ARRAY") then { 
 _weapon = ((DonWeapons select 0) select (_indexPW select 0)); 
 _WeapDonLvl = ((DonWeapons select 1) select (_indexPW select 0)); 
 if ((player getVariable ["LHM_Donatorlevel",0]) < _WeapDonLvl) then 
 { 
  cutText [format["Diese Waffe kann nur von Donator Level %1 benutzt werden.",_WeapDonLvl],"PLAIN DOWN"]; 
  _this removeWeapon _weapon; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
}; 
//Secondary 
_indexSW = ([DonWeapons select 0,secondaryWeapon _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexSW == "ARRAY") then { 
 _weapon = ((DonWeapons select 0) select (_indexSW select 0)); 
 _WeapDonLvl = ((DonWeapons select 1) select (_indexSW select 0)); 
 if ((player getVariable ["LHM_Donatorlevel",0]) < _WeapDonLvl) then 
 { 
  cutText [format["Diese Waffe kann nur von Donator Level %1 benutzt werden.",_WeapDonLvl],"PLAIN DOWN"]; 
  _this removeWeapon _weapon; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
}; 
 
//Checking Cop Weapons 
//Primary 
_indexPW = ([CopWeapons select 0,primaryWeapon _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexPW == "ARRAY") then { 
 _weapon = ((CopWeapons select 0) select (_indexPW select 0)); 
 _WeapCopLvl = ((CopWeapons select 1) select (_indexPW select 0)); 
 if ((__GETC__(lhm_coplevel)) < _WeapCopLvl) then 
 { 
  cutText [format["Diese Waffe kann nur von Cop Level %1 benutzt werden.",_WeapCopLvl],"PLAIN DOWN"]; 
  _this removeWeapon _weapon; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
}; 
//Secondary 
_indexSW = ([CopWeapons select 0,secondaryWeapon _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexSW == "ARRAY") then { 
 _weapon = ((CopWeapons select 0) select (_indexSW select 0)); 
 _WeapCopLvl = ((CopWeapons select 1) select (_indexSW select 0)); 
 if ((__GETC__(lhm_coplevel)) < _WeapCopLvl) then 
 { 
  cutText [format["Diese Waffe kann nur von Cop Level %1 benutzt werden.",_WeapCopLvl],"PLAIN DOWN"]; 
  _this removeWeapon _weapon; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
}; 
 
//Checking Security Weapons 
//Primary 
_indexPW = ([SecuWeapons select 0,primaryWeapon _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexPW == "ARRAY") then { 
 _weapon = ((SecuWeapons select 0) select (_indexPW select 0)); 
 _WeapSecLvl = ((SecuWeapons select 1) select (_indexPW select 0)); 
 if ((__GETC__(lhm_seclevel)) < _WeapSecLvl) then 
 { 
  cutText [format["Diese Waffe kann nur von Security Level %1 benutzt werden.",_WeapSecLvl],"PLAIN DOWN"]; 
  _this removeWeapon _weapon; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
}; 
//Secondary 
_indexSW = ([SecuWeapons select 0,secondaryWeapon _this] call BIS_fnc_arrayFindDeep); 
if (typeName _indexSW == "ARRAY") then { 
 _weapon = ((SecuWeapons select 0) select (_indexSW select 0)); 
 _WeapSecLvl = ((SecuWeapons select 1) select (_indexSW select 0)); 
 if ((__GETC__(lhm_seclevel)) < _WeapSecLvl) then 
 { 
  cutText [format["Diese Waffe kann nur von Security Level %1 benutzt werden.",_WeapSecLvl],"PLAIN DOWN"]; 
  _this removeWeapon _weapon; 
  _item = createVehicle ["groundWeaponHolder", position _this, [], 0.5, "CAN_COLLIDE"]; 
  _item addWeaponCargoGlobal [_weapon,1]; 
 }; 
};