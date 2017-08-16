/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up realEstate shop
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_name","_price","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [] call DS_fnc_realestateConfig;

lbClear _vehicleList;

{
	_name = (_x select 0);
	_price = (_x select 1);
	_rent = (_x select 2);
	_toolTip = format ["Price $%1 || Rental Payments $%2",[(_x select 1)] call DS_fnc_numberText,[(_x select 2)] call DS_fnc_numberText];
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	if(DS_atmcoin >= _price)then
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
		}
		else
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [1, 0, 0, 0.5]];
		};
	_temp = format ["%1",_forEachIndex];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_temp];
}forEach _shopArray;
