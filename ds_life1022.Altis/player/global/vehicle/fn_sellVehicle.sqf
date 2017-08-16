#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sells a players vehicle from his garage
*/

private ["_price","_vid","_vehicle","_priceArray","_action"];
_action = true;
if(_this select 0)exitwith
	{
	if(DS_doingStuff)exitwith{_action = false};
	DS_doingStuff = true;
	_price = 0;
	_vehicle = lbData[1501,(lbCurSel 1501)];
	_vehicle = (call compile format["%1",_vehicle]) select 0;
	_priceArray = [666] call DS_fnc_vehShopConfig;
	{
		if((_x select 0) == _vehicle)then
			{
			_price = (_x select 1);
			};
	}forEach _priceArray;
	if(_price == 0)then{_price = 666};

	if(!(playerSide isEqualTo civilian))then
		{
		_price = (round(_price/2));
		};
	_action = [
	format ["Would you like to sell this vehicle for $%1?",[_price] call DS_fnc_numberText],
	"Sell Vehicle",
	"Sell",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{DS_doingStuff = false;};
	_vid = lbValue[1501,(lbCurSel 1501)];
	[_price,player,_vid] remoteExec ["HUNT_fnc_sellVehicle",2];
	hint "Selling your vehicle, please wait...";
	closeDialog 0;
	DS_vehicleGarage = [];
	};
if(!_action)exitwith{};
hint format ["Your vehicle has been successfully sold for $%1",[(_this select 1)] call DS_fnc_numberText];
[(_this select 1),true,true] call DS_fnc_handleMoney;
DS_soldVehicle = DS_soldVehicle + 1;
//[] call DS_fnc_compileData;
DS_doingStuff = false;