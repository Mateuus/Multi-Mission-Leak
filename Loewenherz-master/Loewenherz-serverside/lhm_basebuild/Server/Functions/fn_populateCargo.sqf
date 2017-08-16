private["_entity","_config","_magItemTypes","_magItemQtys","_inventory"]; 
_entity = _this select 0; 
_inventory = _this select 1; 
 
clearWeaponCargoGlobal _entity; 
clearMagazineCargoGlobal _entity; 
clearBackpackCargoGlobal _entity; 
clearItemCargoGlobal _entity; 
 
diag_log "LHM_BASEBUILD: Clear Reammobox..."; 
 
{ 
 _magItemTypes = _x select 0; 
 _magItemQtys = _x select 1; 
 _i = _forEachIndex; 
 { 
  if (_forEachIndex < count _magItemQtys) then { 
   switch (_i) do { 
    case 0: { _entity addWeaponCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; };  
    case 1: { _entity addMagazineCargoGlobal[_x,(_magItemQtys select _forEachIndex)]; };  
    case 2: { _entity addBackpackCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
    case 3: { _entity addItemCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
   }; 
  }; 
  
 } forEach _magItemTypes; 
} forEach _inventory; 
 
diag_log format ["LHM_BASEBUILD: populate Reammobox [%1]",typeOf _entity];