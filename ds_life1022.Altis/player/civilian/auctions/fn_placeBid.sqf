/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Place your bid to the server
*/

private ["_value","_careful"];

if(isNil "DS_placedBid")then{DS_placedBid = false;};
if(DS_placedBid)exitwith{hint "You can only place a bid once every 3 seconds"};
DS_placedBid = true;

_bidAmount = _this select 0;
waitUntil{sleep (random 0.5);DS_canBid};
if(isNull (findDisplay 366346))exitwith{DS_placedBid = false;};
DS_canBid = false;publicVariable "DS_canBid";
_currentBid = player getVariable ["bidAmount",0];
_currentBid = _currentBid + _bidAmount;

if([(_currentBid),true] call DS_fnc_checkMoney)exitWith
	{
	DS_canBid = true;publicVariable "DS_canBid";
	hint "You do not have enough money in your bank to make this bid";
	sleep 2.75;
	DS_placedBid = false;
	};
if(_currentBid < DS_auctionPrice)exitWith
	{
	DS_canBid = true;publicVariable "DS_canBid";
	hint "Your bid is not high enough";
	sleep 2.75;
	DS_placedBid = false;
	};
player setVariable ["bidAmount",_currentBid,true];
if(_currentBid > DS_auctionPrice)exitwith
	{
	player setVariable ["leading",true,true];
	hint format ["You are leading this auction at $%1",[_currentBid] call DS_fnc_numberText];
	player say3D "dingDong";
	DS_auctionPrice = _currentBid;
	publicVariable "DS_auctionPrice";
	DS_canBid = true;publicVariable "DS_canBid";
	{
		if((player distance _x < 200)&&(_x != player))then
			{
			_x setVariable ["leading",false,true];
			};
	}forEach allPlayers;
	sleep 2.75;
	DS_placedBid = false;
	};
player setVariable ["leading",false,true];
DS_canBid = true;publicVariable "DS_canBid";

sleep 2.75;
DS_placedBid = false;