private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west && playerSide != east) exitWith {hint "Vous n'etes pas flic."};
if(_shop == "hospital" && playerSide != independent && playerSide != east) exitWith {hint "Vous n'etes pas medecin."};
createDialog "shops_menu";
[] call life_fnc_virt_update;