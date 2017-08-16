/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the vehicle upgrades shop
*/
disableSerialization;
private["_type","_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = 
[
["Land Vehicle Fuel Upgrade",12000,"0","Installing this upgrade will cause your vehicle to use half it's normal fuel amount","refuelKit"],
["Land Vehicle Storage Upgrade",26000,"1","Installing this upgrade will add extra capacity to your vehicles boot, enabling it carry it more","vehBoot"],
["Land Vehicle Security Upgrade",21000,"2","Installing this upgrade will make your vehicle harder to lockpick and will install a GPS tracking device","lockpick"],
["Land Vehicle Airbags",17000,"8","Installing this upgrade will allow you to go unharmed through 10 vehicle crashes","lockpick"],
["Air Vehicle Fuel Upgrade",35000,"3","Installing this upgrade will cause your vehicle to use half it's normal fuel amount","refuelKit"],
["Air Vehicle Storage Upgrade",49000,"4","Installing this upgrade will add extra capacity to your vehicles boot, enabling it carry it more","vehBoot"],
["Air Vehicle Security Upgrade",52000,"5","Installing this upgrade will make your vehicle harder to lockpick and will install a GPS tracking device","lockpick"],
["Vehicle Insurance",666,"6","Purchasing vehicle insurance will return your vehicle to the garage after it is destroyed twice, this has no effect if the vehicle is chopped. This upgrade will also prevent the clean up script running on this vehicle","carShop"],
["Thermal Vision",750000,"7","This will enable thermal vision cameras to be used on this vehicle (If the vehicle has them)","thermal"],
["Ammo Upgrade",750000,"9","This will add extra ammo to the Pawnees, Orcas, Kajmans, Striders, Hunters, Ifrits, Armed Offroads and Gorgons","vehAmmo"],
["Animal Repellent",35000,"10","This will add extra an animal repellent system to your vehicle, causing all wild animals to flee before you","carShop"]
];

lbClear _vehicleList;

{
	_className = (_x select 2);
	_name = (_x select 0);
	_price = (_x select 1);
	_img = (_x select 4);
	_img = format ["extras\icons\%1.jpg",_img];
	_toolTip = (_x select 3);
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
	if(DS_coin >= _price)then
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
		}
		else
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [1, 0, 0, 0.5]];
		};
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
}forEach _shopArray;
