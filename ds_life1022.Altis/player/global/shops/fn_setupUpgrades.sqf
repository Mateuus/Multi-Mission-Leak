/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the vehicle upgrades shop
*/

private ["_shop","_dialog","_list","_shopArray","_className","_name","_price","_img","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [
	["Land Vehicle Fuel Upgrade",12000,"0","Installing this upgrade will cause your vehicle to use half it's normal fuel amount","refuelKit"],
	["Land Vehicle Storage Upgrade",26000,"1","Installing this upgrade will add extra capacity to your vehicles boot, enabling it carry it more","vehBoot"],
	["Land Vehicle Security Upgrade",21000,"2","Installing this upgrade will make your vehicle harder to lockpick and will install a GPS tracking device","lockpick"],
	["Land Vehicle Airbags",17000,"8","Installing this upgrade will allow you to go unharmed through 10 vehicle crashes","lockpick"],
	["Air Vehicle Fuel Upgrade",35000,"3","Installing this upgrade will cause your vehicle to use half it's normal fuel amount","refuelKit"],
	["Air Vehicle Storage Upgrade",49000,"4","Installing this upgrade will add extra capacity to your vehicles boot, enabling it carry it more","vehBoot"],
	["Air Vehicle Security Upgrade",52000,"5","Installing this upgrade will make your vehicle harder to lockpick and will install a GPS tracking device","lockpick"],
	["Vehicle Insurance",666,"6","Purchasing vehicle insurance will return your vehicle to the garage after it is destroyed twice, this has no effect if the vehicle is chopped. This upgrade will also prevent the clean up script running on this vehicle","carShop"],
	["Ammo Upgrade",750000,"9","This will add extra ammo to the Pawnees, Orcas, Kajmans, Striders, Hunters, Prowlers, Quilins, Ifrits, Armed Offroads and Gorgons","vehAmmo"],
	["Animal Repellent",35000,"10","This will add extra an animal repellent system to your vehicle, causing all wild animals to flee before you","carShop"],
	["Special Upgrades",60000,"11","Special upgrades only available to certain vehicles, such as adding rear seats to choppers with two seats","carShop"],
	["Sea Vehicle Fuel Upgrade",8000,"12","Installing this upgrade will cause your vehicle to use half it's normal fuel amount","refuelKit"],
	["Sea Vehicle Storage Upgrade",22000,"13","Installing this upgrade will add extra capacity to your vehicles boot, enabling it carry it more","vehBoot"],
	["Sea Vehicle Security Upgrade",15000,"14","Installing this upgrade will make your vehicle harder to lockpick and will install a GPS tracking device","lockpick"]
];

lbClear _list;

{
	_className = (_x select 2);
	_name = (_x select 0);
	_price = (_x select 1);
	_img = (_x select 4);
	_img = format ["extras\icons\%1.jpg",_img];
	_tooltip = (_x select 3);
	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetPicture [_index,_img];
	if(DS_coin >= _price)then {
		_list lbSetColor [_index,[0,1,0,0.5]];
	} else {
		_list lbSetColor [_index,[1,0,0,0.5]];
	};
	_list lbSetData [_index,_className];
} forEach _shopArray;