/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_exit"];
_succ = false;
_exit = false;
if(an_cash < life_shop_cartTotal) exitWith {hintSilent "You do not have enough to complete this purchase!";};
if(count life_shop_cart isEqualTo 0) exitWith {hintSilent "No items in the cart.";};
_result = [
"Select Purchase Delivery Method",
"Delivery Method",
"Cargo",
"Direct"
] call BIS_fnc_guiMessage;
if(_result) then {
  _positionPlayer = getPosATL player;
  _cargo = createVehicle ["R3F_WeaponBox", _positionPlayer, [], 0, "CAN_COLLIDE"];
  clearItemCargoGlobal _cargo;
  clearWeaponCargoGlobal _cargo;
  clearMagazineCargoGlobal _cargo;
  _cargo setVariable ["PlayerOwner",(getPlayerUID player),true];
  _cargo addEventHandler ["ContainerOpened", "[_this select 0,_this select 1] call life_fnc_crletiuhiufroe"];
  _cargo allowDamage false;
  {
    _className = (_x select 0);
    _itemInfo = [_className] call BIS_fnc_itemType;
    _itemCategory = _itemInfo select 0;
    _itemType = _itemInfo select 1;
    switch (_itemCategory) do {
    	case "Weapon":
    	{
    		_cargo addWeaponCargoGlobal [_className, 1];
    		_succ = true;
    	};
    	case "Mine",
    	case "Magazine":
    	{
    		_cargo addMagazineCargoGlobal [_className, 1];
    		_succ = true;
    	};
    	default
    	{
    		if (_itemType isEqualTo "Backpack") then {
    			_cargo addBackpackCargoGlobal [_className, 1];
    			_succ = true;
    		} else {
    			_cargo addItemCargoGlobal [_className, 1];
    			_succ = true;
    		};
    	};
    };
  } forEach (life_shop_cart);
  if(_succ) exitWith {closeDialog 0; [life_shop_cartTotal,0,1] call life_fnc_sewawruk; hintSilent "Your purchase was succesful. Your Cargo will be here shortly!"; life_shopInfo_array = nil; life_shop_cart = nil; life_shop_cartTotal = nil;};
} else {
  {
    _className = (_x select 0);
    if(_className in ["ItemWatch","ItemMap","ItemGPS","ItemRadio","ItemCompass","ToolKit","FirstAidKit","Binocular","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","Medikit","Rangefinder","B_UavTerminal"]) then {
    	if(!(player canAdd _className)) exitWith {_exit = true;};
      if(_exit) exitWith {closeDialog 0; hintSilent "You do not have enough Room!";_succ = false;};
    };
    [_className,true] call life_fnc_waxecruwuka;
    _succ = true;
  } forEach (life_shop_cart);
  if(_exit) exitWith {closeDialog 0; hintSilent "You do not have enough Room!";_succ = false;};
  if(_succ) exitWith {closeDialog 0; [life_shop_cartTotal,0,1] call life_fnc_sewawruk; hintSilent "Your purchase was succesful."; life_shopInfo_array = nil; life_shop_cart = nil; life_shop_cartTotal = nil;};
};
