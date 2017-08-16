/* 
 Author: André "Nokman" Kupfer 
 Description: Neue Version um mehere HC auf einen Server nutzen zu können HC´s Melden sich an je nach Mod 
*/ 
private["_hc","_slot"]; 
_hc = _this select 0; 
_slot = _this select 1; 
diag_log format ["initHC %1 %2", _hc, _slot]; 
switch (_hc) do { 
 case "head_1" : { 
  for "_i" from 0 to 200 do { 
   call compile format["HC_DBaktion_%1=nil",_i]; 
   call compile format["HC_DB_Retour_%1=false",_i]; 
   call compile format["HC_DB_Retour_%1=nil",_i]; 
  }; 
  HC1_UID = getPlayerUID _slot; 
  HC1_owner = owner _slot; 
  HC1_on = true; 
 
  //publicvariable "HC1"; 
  publicVariable "HC1_owner"; 
  _slot setVariable ["HC1",_hc]; 
 
  /*{ 
   if (!(isplayer _x) || (!( _x in units group HC1_owner)) ) then { 
    _gr = _x setgroupowner HC1_owner; 
    diag_log format ["Einheit %1, Neuer Owner %2 erfolgreich gruppe: %3",_x,HC1_owner,_gr]; 
   }; 
  } forEach allUnits; 
  */ 
  { 
   if (!(isPlayer _x) && !(owner _x isEqualTo HC1_owner)) then { 
   _pl = _x setOwner HC1_owner; 
   _gr =(group _x) setGroupOwner HC1_owner; 
   diag_log format ["Einheit %1, Neuer Owner %2 erfolgreich gruppe: %3 , player %4",_x,HC1_owner,_gr,_pl]; 
   }; 
  } forEach allUnits; 
 }; 
 
 case "head_2" : { 
  HC2_UID = getPlayerUID _slot; 
  HC2_owner = owner _slot; 
  HC2_on = true; 
 
  //publicvariable "HC1"; 
  publicVariable "HC2_owner"; 
  _slot setVariable ["HC2",_hc]; 
 }; 
}; 
