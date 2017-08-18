/*
	File: fn_stealVehicle.sqf
	Author: Kevin Webb
	
	Description:
	Allows the player to put a stolen vehicle in their garage.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_color","_check"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_price = _price * 0.65;

if(life_cash < _price ) exitWith { hint format["We require a fee of %1 to make that vehicle yours.",_price]; };

_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1",_vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;

if(isNull _vehicle) exitWith {};

_check = false;
{
	if(player distance _x < 200 && side _x == west) then
	{
		_check = true;
	};
};
if(_check) exitWith { hint "The cops are too close to complete this action!";};

if(typeOf _vehicle in["B_MRAP_01_F","I_MRAP_03_hmg_F","B_MRAP_01_hmg_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_CRV_F"]) exitWith {hint "Unfortunately, you cannot make that type of vehicle yours! You will have to sell it instead.";};

_color = 0;
if(typeOf _vehicle in["C_Offroad_01_F"]) then
{
	_color = floor(random 12);
};
while {typeOf _vehicle in["C_Offroad_01_F"] && _color in [6,7,8]} do
{
	_color = floor(random 12);
};
if(typeOf _vehicle in["C_Hatchback_01_F"]) then
{
	_color = floor(random 7);
};
if(typeOf _vehicle in["C_Hatchback_01_sport_F"]) then
{
	_color = floor(random 6);
};
if(typeOf _vehicle in["C_SUV_01_F"]) then
{
	_color = floor(random 8);
};
while {typeOf _vehicle in["C_SUV_01_F"] && _color in[1,4,5]} do
{
	_color = floor(random 8);
};
if(typeOf _vehicle in["B_Quadbike_01_F"]) then
{
	_color = floor(random 9);
};

hint format["You have been charged %1 for this transaction and the vehicle has been added to your garage.",_price];
life_atmcash = life_atmcash - _price;
[[_vehicle],"TON_fnc_vehicleIsDead",false,false] spawn life_fnc_MP;
sleep 0.05;
[[(getPlayerUID player),playerSide,_vehicle,_color,1],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
[[getPlayerUID player,profileName,"490"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
closeDialog 0;
sleep 0.5;
if(!isNil "_vehicle" && !isNull _vehicle) then
{
	deleteVehicle _vehicle;
};