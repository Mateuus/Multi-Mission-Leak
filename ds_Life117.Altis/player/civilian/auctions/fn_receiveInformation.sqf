/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Civilians nearby the auction house get notified about what is being auctioned and what it's cost is
*/
private ["_itemArray","_times","_exit"];

_itemArray = _this select 0;
_times = _this select 1;
_exit = false;

if(_times == 10)exitWith
	{
	player say3D "dingDong";
	hint "The auctions are over, The Auctions run each day between 10 and 12 noon. Return during these times for another chance";
	systemchat "The auctions are over, The Auctions run each day between 10 and 12 noon. Return during these times for another chance";
	};

if(_times == 0)exitWith
	{
	if(isNull (_itemArray select 7))exitWith
		{
		hint "No one bid on this item";
		_exit = true;
		};
	if(player == _itemArray select 7)then
		{
		if([(_itemArray select 6),true] call DS_fnc_checkMoney)exitWith
			{
			hint "Auction failed, you didn't have enough money in your bank. An admin note has been added incase this was an attempt at exploiting";
			_exit = true;
			[["Auction Exploit?",(name player),(_itemArray select 6),player],"HUNT_fnc_reportBug",false,false] spawn BIS_fnc_MP;
			};
		player say3D "success";
		hint format ["Congratulations you have won the auction. The buy price of $%1 has been taken from you bank and your goods have been delivered",[(_itemArray select 6)] call DS_fnc_numberText];
		systemchat format ["Congratulations you have won the auction. The buy price of $%1 has been taken from you bank and your goods have been delivered",[(_itemArray select 6)] call DS_fnc_numberText];
		[(_itemArray select 6),true,false] call DS_fnc_handleMoney;
		[_itemArray] call DS_civ_receiveAuctionItem;
		}
		else
		{
		hint format ["The winner of the auction was %1 at a price of $%2",(name (_itemArray select 7)),[(_itemArray select 6)] call DS_fnc_numberText];
		systemChat format ["The winner of the auction was %1 at a price of $%2",(name (_itemArray select 7)),[(_itemArray select 6)] call DS_fnc_numberText];
		player say3D "fail";
		};
	};
if(_exit)exitwith{};
player say3D "dingDong";
hint format ["!!!BlackMarket Auctions!!! \n\n The following item is up for Auction \n\n %1 \n\n It's current price is... \n\n $%2 \n\n %3 \n\nYou will have a chance to place a bid shortly",_itemArray select 2,[DS_auctionPrice] call DS_fnc_numberText,_itemArray select 5];
systemChat format ["!!!BlackMarket Auctions!!! The following item is up for Auction, %1. It's current price is $%2. You will have a chance to place a bid shortly",_itemArray select 2,[DS_auctionPrice] call DS_fnc_numberText];

sleep 7;

if((vehicle player) != player)exitwith{};

player say3D "dingDong";
hint format ["!!!BlackMarket Auctions!!! \n\n The following item is up for Auction \n\n %1 \n\n It's current price is... \n\n $%2 \n\n %4 \n\n You have %3 chance(s) left to bid",_itemArray select 2,[DS_auctionPrice] call DS_fnc_numberText,_times,_itemArray select 5];
systemChat format ["!!!BlackMarket Auctions!!! The following item is up for Auction, %1. It's current price is $%2. You have %3 chance(s) left to bid",_itemArray select 2,[DS_auctionPrice] call DS_fnc_numberText,_times];
disableSerialization;
closeDialog 0;
sleep 0.2;
createDialog "bidMenu";
