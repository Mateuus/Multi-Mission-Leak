/*
	File: fn_buyHouse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Purchases a house and initiates DB entry
*/
private["_house", "_buildingID", "_buildingName", "_owners", "_isLocked", "_uid", "_price"];
if (life_corruptData) exitWith { hint "YOUR PLAYER DATA IS DAMAGED. You must log out to the lobby and rejoin. Your progress will not save until you do this. Most likely caused by a script-kiddie." };

_house = life_menu_house;
_maxHouses = switch (worldName) do
{
	case "Altis": { 5 };
	case "Tanoa": { 2 };
	default { 1 };
};

if (player distance _house > 20) exitWith {};
if (!(_house isKindOf "House")) exitWith {};

_uid = getPlayerUID player;
_price = [typeOf _house] call life_fnc_housePrice;
_buildingID = [_house] call life_fnc_getBuildID;
_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

_salePrice = _house getVariable ["salePrice", 0];
_saleOwner = _house getVariable ["saleOwner", ""];
if  (_salePrice > 0) then { _price = _salePrice; };

if (!license_civ_home) exitWith {hint "You do not have a home owners license!";};
if (count life_houses >= _maxHouses) exitWith {hint format["You may only own %1 house(s) at one time.",_maxHouses];};
if (_price < 0 || _buildingID in life_public_houses) exitWith{hint "This building is not for sale";};
if (life_atmmoney < _price) exitWith {hint format["You do not have $%1 in your bank to purchase %2",[_price] call life_fnc_numberText,_buildingName];};
//if ((_house getVariable['life_houseId',-1]) > -1 && life_donator < 5) exitWith{ hint "This house is available to rank 5 donors only."; };

["atm","take",_price] call life_fnc_uC;
titleText[format["You have purchased %1 for $%2!", _buildingName, [_price] call life_fnc_numberText],"PLAIN"];

if  (_salePrice > 0) then
{
	_house setVariable ["salePrice", nil, true];
	_house setVariable ["saleOwner", nil, true];
	life_forSaleHouses = life_forSaleHouses - [getpos _house];
	publicVariable "life_forSaleHouses";
	_online = {if(getPlayerUID _x == _saleOwner) exitWith {_x}; ObjNull} forEach allPlayers;
	if(!isNull _online) exitWith {
		[["atm","add",_price],"life_fnc_uC",_online,false] spawn life_fnc_MP;
		[[0,2],format["A house (%1) you have listed has sold, and %2 has been added to your bank!",_buildingName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_online];
	};
	//[[_saleOwner, player, format["You've sold a house (%1) and $%2 has been added to your bank account!", _buildingName, _price], _price],"ASY_fnc_addMessage",false,false] spawn life_fnc_MP;
	[[_saleOwner,_price],"KBW_fnc_offlineComp",false] call life_fnc_MP;
};


//[[2, player, format["Purchased house %1 for %2 at %3", _buildingName, _price, position _house]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

closeDialog 0;

[[_buildingID, _uid, 0, position _house],"DB_fnc_insertHouse",false,false] spawn life_fnc_MP;
life_houses set [count life_houses, _house];
life_experience = life_experience + 50;