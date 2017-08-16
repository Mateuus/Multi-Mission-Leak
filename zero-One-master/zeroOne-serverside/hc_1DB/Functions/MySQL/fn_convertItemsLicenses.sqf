/* 
 File: fn_convertItemsLicenses 
 Author: Dirk Pitt 
 Zero-One Altis Life 
*/ 
private["_mode","_query","_split","_license","_gear","_items","_newItems","_index","_var"]; 
_mode = param[0,-1,[0]]; 
_query = param[1,"",["",[]]]; 
if(_mode isEqualTo -1 || _query isEqualTo "") exitWith {diag_log format ["convertItemsLicenses %1", _this]}; 
//updatePlayer 
if(_mode isEqualTo 0) then { 
 switch (true) do 
 { 
  //updatePlayerInfoPartial Lizenzen 
  case (_query find "updatePlayerLiz" != -1): 
  { 
   _split = _query splitString ":"; 
   _license = _split select 1; 
   _license = call compile _license; 
   _license = [_license] call DB2_fnc_mresToArray; 
   if(typeName _license == "STRING") then {_license = call compile format["%1", _license];}; 
   { 
    _var = switch (_x select 0) do 
    { 
     case "aYkYocq": {"license_civ_driver"}; 
     case "OzUOrILj": {"license_civ_boat"}; 
     case "vpc": {"license_civ_air"}; 
     case "LIWmuw": {"license_civ_gun"}; 
     case "gupVcU": {"license_civ_dive"}; 
     case "uDviClCh": {"license_civ_oil"}; 
     case "efljNcB": {"license_civ_heroin"}; 
     case "MYOOAB": {"license_civ_marijuana"}; 
     case "wzWkyiAWz": {"license_civ_medmarijuana"}; 
     case "UDmm": {"license_civ_gang"}; 
     case "CqwkkuJA": {"license_civ_rebel"}; 
     case "BBkMYZfDB":{"license_civ_truck"}; 
     case "wciZBo": {"license_civ_diamond"}; 
     case "kYsONyO": {"license_civ_salt"}; 
     case "TqNZ": {"license_civ_cocaine"}; 
     case "JSE": {"license_civ_sand"}; 
     case "aAMAttHnT": {"license_civ_iron"}; 
     case "vHgkp": {"license_civ_copper"}; 
     case "RpvPe": {"license_civ_cement"}; 
     case "tchWDeoz": {"license_civ_grapes"}; 
              case "HKEt": {"license_civ_moonshine"}; 
     case "nyfMzpn": {"license_civ_clothing"}; 
     case "qSyQAq": {"license_civ_home"}; 
     case "oHUgoTY": {"license_civ_gas"}; 
     case "GPXZ": {"license_civ_taxi"}; 
     default {""}; 
    }; 
    if (!(_var isEqualTo "")) then { 
     _license  set[_forEachIndex,[_var,_x select 1]]; 
    }; 
   } forEach _license; 
   _license = [_license] call DB2_fnc_mresArray; 
   _split set[1,_license]; 
   _query = _split joinString ":"; 
  }; 
 
  //updatePlayerInfoPartial Gear 
  case (_query find "updatePlayerGear" != -1): 
  { 
   _split = _query splitString ":"; 
   _gear = _split select 1; 
   _gear = call compile _gear; 
   _gear = [_gear] call DB2_fnc_mresToArray; 
   if(typeName _gear == "STRING") then {_gear = call compile format["%1", _gear];}; 
   if(_gear isEqualTo []) exitWith {_query;}; 
   _items = _gear select ((count _gear) -1); 
   if(typeName _items != "ARRAY") then {_items = [];}; 
   { 
    _var = switch (_x) do 
    { 
     case "eWEinjmkk": {"life_inv_apple"}; 
     case "Djo": {"life_inv_rabbit"}; 
     case "OYCJqYOH": {"life_inv_water"}; 
     case "HvWq": {"life_inv_donuts"}; 
     case "UJxtHn": {"life_inv_coffee"}; 
     case "uHX": {"life_inv_fuelF"}; 
     case "LyS": {"life_inv_fuelE"}; 
     case "bljBQ": {"life_inv_pickaxe"}; 
     case "ysEBcqTBA": {"life_inv_tbacon"}; 
     case "NAxxeIp": {"life_inv_lockpick"}; 
     case "Oth": {"life_inv_redgull"}; 
     case "jCoYM": {"life_inv_peach"}; 
     case "BaHR": {"life_inv_zipties"}; 
     case "wWaENSxN": {"life_inv_med_marijuana"}; 
     case "hpmTxhS": {"life_inv_beer"}; 
     case "fFzfo": {"life_inv_whiskey"}; 
     case "bqN": {"life_inv_placebo"}; 
     case "gHlhNgL": {"life_inv_pukepill"}; 
     case "LzheUgbU": {"life_inv_narcosis"}; 
     case "wgwK": {"life_inv_medipack"}; 
     default {""}; 
    }; 
    if (!(_var isEqualTo "")) then { 
     _items set[_forEachIndex,_var]; 
    }; 
   } forEach _items; 
   _gear set[(count _gear)-1,_items]; 
   _gear = [_gear] call DB2_fnc_mresArray; 
   _split set[1,_gear]; 
   _query = _split joinString ":"; 
  }; 
 
  //updatePlayer komplett 
  default 
  { 
   _split = _query splitString ":"; 
   _license = _split select 3; 
   _license = call compile _license; 
   _license = [_license] call DB2_fnc_mresToArray; 
   if(typeName _license == "STRING") then {_license = call compile format["%1", _license];}; 
   { 
    _var = switch (_x select 0) do 
    { 
     case "aYkYocq": {"license_civ_driver"}; 
     case "OzUOrILj": {"license_civ_boat"}; 
     case "vpc": {"license_civ_air"}; 
     case "LIWmuw": {"license_civ_gun"}; 
     case "gupVcU": {"license_civ_dive"}; 
     case "uDviClCh": {"license_civ_oil"}; 
     case "efljNcB": {"license_civ_heroin"}; 
     case "MYOOAB": {"license_civ_marijuana"}; 
     case "wzWkyiAWz": {"license_civ_medmarijuana"}; 
     case "UDmm": {"license_civ_gang"}; 
     case "CqwkkuJA": {"license_civ_rebel"}; 
     case "BBkMYZfDB":{"license_civ_truck"}; 
     case "wciZBo": {"license_civ_diamond"}; 
     case "kYsONyO": {"license_civ_salt"}; 
     case "TqNZ": {"license_civ_coke"}; 
     case "JSE": {"license_civ_sand"}; 
     case "aAMAttHnT": {"license_civ_iron"}; 
     case "vHgkp": {"license_civ_copper"}; 
     case "RpvPe": {"license_civ_cement"}; 
     case "tchWDeoz": {"license_civ_grapes"}; 
              case "HKEt": {"license_civ_moonshine"}; 
     case "nyfMzpn": {"license_civ_clothing"}; 
     case "qSyQAq": {"license_civ_home"}; 
     case "oHUgoTY": {"license_civ_gas"}; 
     case "GPXZ": {"license_civ_taxi"}; 
     default {""}; 
    }; 
    if (!(_var isEqualTo "")) then { 
     _license  set[_forEachIndex,[_var,_x select 1]]; 
    }; 
   } forEach _license; 
   _license = [_license] call DB2_fnc_mresArray; 
   _split set[3,_license]; 
 
   _gear = _split select 4; 
   _gear = call compile _gear; 
   _gear = [_gear] call DB2_fnc_mresToArray; 
   if(typeName _gear == "STRING") then {_gear = call compile format["%1", _gear];}; 
   if(_gear isEqualTo []) exitWith {_query = _split joinString ":"; _query;}; 
   _items = _gear select ((count _gear) -1); 
   if(typeName _items != "ARRAY") then {_items = [];}; 
   if(_items isEqualTo [] || {typeName (_items select 0) == "ARRAY"}) exitWith { 
    _gear set[(count _gear)-1,_items]; 
    _gear = [_gear] call DB2_fnc_mresArray; 
    _split set[4,_gear]; 
    _query = _split joinString ":"; 
    _query; 
   }; 
   { 
    _var = switch (_x) do 
    { 
     case "eWEinjmkk": {"life_inv_apple"}; 
     case "Djo": {"life_inv_rabbit"}; 
     case "OYCJqYOH": {"life_inv_water"}; 
     case "HvWq": {"life_inv_donuts"}; 
     case "UJxtHn": {"life_inv_coffee"}; 
     case "uHX": {"life_inv_fuelF"}; 
     case "LyS": {"life_inv_fuelE"}; 
     case "bljBQ": {"life_inv_pickaxe"}; 
     case "ysEBcqTBA": {"life_inv_tbacon"}; 
     case "NAxxeIp": {"life_inv_lockpick"}; 
     case "Oth": {"life_inv_redgull"}; 
     case "jCoYM": {"life_inv_peach"}; 
     case "BaHR": {"life_inv_zipties"}; 
     case "wWaENSxN": {"life_inv_med_marijuana"}; 
     case "hpmTxhS": {"life_inv_beer"}; 
     case "fFzfo": {"life_inv_whiskey"}; 
     case "bqN": {"life_inv_placebo"}; 
     case "gHlhNgL": {"life_inv_pukepill"}; 
     case "LzheUgbU": {"life_inv_narcosis"}; 
     case "wgwK": {"life_inv_medipack"}; 
     default {""}; 
    }; 
    if (!(_var isEqualTo "")) then { 
     _items set[_forEachIndex,_var]; 
    }; 
   } forEach _items; 
   _gear set[(count _gear)-1,_items]; 
   _gear = [_gear] call DB2_fnc_mresArray; 
   _split set[4,_gear]; 
   _query = _split joinString ":"; 
  }; 
 }; 
 _query; 
 
//queryRequest 
} else { 
 _license = _query select 5; 
 _license = [_license] call DB2_fnc_mresToArray; 
 if(typeName _license == "STRING") then {_license = call compile format["%1", _license];}; 
 { 
  _var = switch (_x select 0) do 
  { 
   case "license_civ_driver": {"aYkYocq"}; 
   case "license_civ_boat": {"OzUOrILj"}; 
   case "license_civ_air": {"vpc"}; 
   case "license_civ_gun": {"LIWmuw"}; 
   case "license_civ_dive": {"gupVcU"}; 
   case "license_civ_oil": {"uDviClCh"}; 
   case "license_civ_heroin": {"efljNcB"}; 
   case "license_civ_marijuana": {"MYOOAB"}; 
   case "license_civ_medmarijuana": {"wzWkyiAWz"}; 
   case "license_civ_gang": {"UDmm"}; 
   case "license_civ_rebel": {"CqwkkuJA"}; 
   case "license_civ_truck":{"BBkMYZfDB"}; 
   case "license_civ_diamond": {"wciZBo"}; 
   case "license_civ_salt": {"kYsONyO"}; 
   case "license_civ_coke": {"TqNZ"}; 
   case "license_civ_sand": {"JSE"}; 
   case "license_civ_iron": {"aAMAttHnT"}; 
   case "license_civ_copper": {"vHgkp"}; 
   case "license_civ_cement": {"RpvPe"}; 
   case "license_civ_grapes": {"tchWDeoz"}; 
            case "license_civ_moonshine": {"HKEt"}; 
   case "license_civ_clothing": {"nyfMzpn"}; 
   case "license_civ_home": {"qSyQAq"}; 
   case "license_civ_gas": {"oHUgoTY"}; 
   case "license_civ_taxi": {"GPXZ"}; 
   default {""}; 
  }; 
  if (!(_var isEqualTo "")) then { 
   _license set[_forEachIndex,[_var,_x select 1]]; 
  }; 
 } forEach _license; 
 _query set[5,_license]; 
 
 _gear = _query select 7; 
 _gear = [_gear] call DB2_fnc_mresToArray; 
 if(typeName _gear == "STRING") then {_gear = call compile format["%1", _gear];}; 
 if(_gear isEqualTo []) exitWith {_query;}; 
 _items = _gear select ((count _gear) -1); 
 if(typeName _items != "ARRAY") then {_items = [];}; 
 if(_items isEqualTo [] || {typeName (_items select 0) == "ARRAY"}) exitWith { 
  _gear set[(count _gear)-1,_items]; 
  _query set[7,_gear]; 
  _query; 
 }; 
 _newItems = []; 
 { 
  _var = switch (_x) do 
  { 
   case "life_inv_apple": {"apple"}; 
   case "life_inv_rabbit": {"rabbit"}; 
   case "life_inv_water": {"water"}; 
   case "life_inv_donuts": {"donuts"}; 
   case "life_inv_coffee": {"coffee"}; 
   case "life_inv_fuelF": {"fuelF"}; 
   case "life_inv_fuelE": {"fuelE"}; 
   case "life_inv_pickaxe": {"pickaxe"}; 
   case "life_inv_tbacon": {"tbacon"}; 
   case "life_inv_lockpick": {"lockpick"}; 
   case "life_inv_redgull": {"redgull"}; 
   case "life_inv_peach": {"peach"}; 
   case "life_inv_zipties": {"zipties"}; 
   case "life_inv_med_marijuana": {"med_marijuana"}; 
   case "life_inv_beer": {"beer"}; 
   case "life_inv_whiskey": {"whiskey"}; 
   case "life_inv_placebo": {"placebo"}; 
   case "life_inv_pukepill": {"pukepill"}; 
   case "life_inv_narcosis": {"narcosis"}; 
   case "life_inv_medipack": {"medipack"}; 
   case "wgwK": {"medipack"}; 
   default {""}; 
  }; 
  if (!(_var isEqualTo "")) then { 
   _index = [_var,_newItems] call zero_fnc_oKzQhZKu; //Übersetzung neues Format 
   if(_index isEqualTo -1) then { 
    _newItems pushBack [_var,1]; 
   }else{ 
    _newItems set[_index,[_var,(((_newItems select _index) select 1) + 1)]]; 
   }; 
  }; 
 } forEach _items; 
 _gear set[(count _gear)-1,_newItems]; 
 _query set[7,_gear]; 
 _query; 
}; 
