private ["_house", "_uid", "_houseCfg", "_sellPrice", "_index"];
_house = [_this, 0, objNull, [ObjNull]] call GTA_fnc_param;

if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
closeDialog 0;

//--- House config
_houseCfg = [typeOf _house] call life_fnc_houseConfig;
if (count _houseCfg == 0) exitWith {};

//--- Sell price
_sellPrice = round (_houseCfg select 0) / 4;

//--- Add crates to sell price
{
  _sellPrice = _sellPrice + ([125000, 250000] select (_x isKindOf "B_supplyCrate_F"));
} forEach (_house getVariable ["containers", []]);

//--- Confirmation
if ([format [localize "STR_House_SellHouseMSG", [_sellPrice] call life_fnc_numberText, _houseCfg select 1], localize "STR_pInAct_SellHouse", localize "STR_Global_Sell", localize "STR_Global_Cancel"] call BIS_fnc_guiMessage) then {

  _house setVariable ["house_sold", true, true];
  [[_house], "TON_fnc_sellHouse", false] call GTA_fnc_remoteExec;
  _house setVariable ["locked", false, true];
  _house setVariable ["Trunk", nil, true];
  _house setVariable ["containers", nil, true];
  deleteMarkerLocal format ["house_%1", _house getVariable "uid"];
  _house setVariable ["uid", nil, true];

  //--- Remove from keychain
  life_vehicles = life_vehicles - [_house];

  //--- Remove from houses array
  _index = [life_houses, str getPosATL _house] call GTA_fnc_nestedIndex;
  if (_index != -1) then {
    life_houses deleteAt _index;
  };

  //--- Unlock all doors
  _numOfDoors = getNumber (configFile >> "CfgVehicles" >> typeOf _house >> "numberOfDoors");
  for "_i" from 1 to _numOfDoors do {
    _house setVariable [format ["bis_disabled_Door_%1", _i], 0, true];
  };

  //--- Add sell price to bank
  GTA_money_bank = GTA_money_bank + _sellPrice;

  //--- Sync money
  [1] call GTA_fnc_updatePlayerPartial;
};
