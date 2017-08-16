/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Civilians nearby the auction house get notified about what is being auctioned and what it's cost is
*/

private ["_itemArray","_times","_exit"];

if(!isNull objectParent player)exitwith{};//Dude is in a vehicle

disableSerialization;
closeDialog 0;

player setVariable ["BidAmount",0,true];

_itemArray = _this select 0;
_endItem = _this select 1;
_endAuction = _this select 2;

if(_endAuction)exitWith
	{
	player say3D "dingDong";
	hint "The auctions are over, The Auctions run each day between 10 and 12 noon. Return during these times for another chance";
	systemchat "The auctions are over, The Auctions run each day between 10 and 12 noon. Return during these times for another chance";
	};

if(_endItem)exitWith
	{
	if(isNull (_itemArray select 7))exitWith
		{
		hint "No one bid on this item";
		};
	if(player == _itemArray select 7)then
		{
		if([(_itemArray select 6),true] call DS_fnc_checkMoney)exitWith
			{
			hint "Auction failed, you didn't have enough money in your bank. An admin note has been added incase this was an attempt at exploiting";
			_exit = true;
			["Auction Exploit?",(name player),(_itemArray select 6),player] remoteExec ["HUNT_fnc_reportBug",2];
			};
		player say3D "success";
		hint format ["Congratulations you have won the auction. The buy price of $%1 has been taken from you bank and your goods have been delivered",[(_itemArray select 6)] call DS_fnc_numberText];
		systemchat format ["Congratulations you have won the auction. The buy price of $%1 has been taken from you bank and your goods have been delivered",[(_itemArray select 6)] call DS_fnc_numberText];
		[(_itemArray select 6),true,false] call DS_fnc_handleMoney;
		[_itemArray] call DS_civ_receiveAuctionItem;
		if(((DS_infoArray select 13) == 36)&&((_itemArray select 6) > 999999))then { [0] call DS_fnc_questCompleted };
		}
		else
		{
		hint format ["The winner of the auction was %1 at a price of $%2",(name (_itemArray select 7)),[(_itemArray select 6)] call DS_fnc_numberText];
		systemChat format ["The winner of the auction was %1 at a price of $%2",(name (_itemArray select 7)),[(_itemArray select 6)] call DS_fnc_numberText];
		player say3D "fail";
		};
	};

createDialog "auctionMenu";
_display = findDisplay 366346;
_textArea = _display displayCtrl 1100;
_btnClose = _display displayCtrl 2412;
_btn1 = _display displayCtrl 2400;
_btn2 = _display displayCtrl 2401;
_btn3 = _display displayCtrl 2402;
_btn4 = _display displayCtrl 2403;
_btn5 = _display displayCtrl 2404;
_btn6 = _display displayCtrl 2405;
_btn7 = _display displayCtrl 2406;
_btn8 = _display displayCtrl 2407;
_btn9 = _display displayCtrl 2408;
_btn10 = _display displayCtrl 2409;
_btn11 = _display displayCtrl 2410;
_btn12 = _display displayCtrl 2411;
player say3D "dingDong";
DS_blockEsc = (findDisplay 366346) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
//Initial show

_textArea ctrlSetStructuredText parseText format [
"<t color='#2E64FE' align='center'>This Auction is for a %1</t><br/>
<t color='#2E64FE' align='center'>Starting Price: $%2</t><br/><br/><br/>
<t align='center'>%3</t>",
(_itemArray select 2),
[DS_auctionPrice] call DS_fnc_numberText,
(_itemArray select 5)];

_btn1 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $10k</t>";
_btn1 buttonSetAction "[10000] spawn DS_civ_placeBid;";

_btn2 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $25k</t>";
_btn2 buttonSetAction "[25000] spawn DS_civ_placeBid;";

_btn3 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $75k</t>";
_btn3 buttonSetAction "[75000] spawn DS_civ_placeBid;";

_btn4 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $100k</t>";
_btn4 buttonSetAction "[100000] spawn DS_civ_placeBid;";

_btn5 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $150k</t>";
_btn5 buttonSetAction "[150000] spawn DS_civ_placeBid;";

_btn6 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $200k</t>";
_btn6 buttonSetAction "[200000] spawn DS_civ_placeBid;";

_btn7 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $300k</t>";
_btn7 buttonSetAction "[300000] spawn DS_civ_placeBid;";

_btn8 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $400k</t>";
_btn8 buttonSetAction "[400000] spawn DS_civ_placeBid;";

_btn9 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $500k</t>";
_btn9 buttonSetAction "[500000] spawn DS_civ_placeBid;";

_btn10 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $1m</t>";
_btn10 buttonSetAction "[1000000] spawn DS_civ_placeBid;";

_btn11 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $1.5m</t>";
_btn11 buttonSetAction "[1500000] spawn DS_civ_placeBid;";

_btn12 ctrlSetStructuredText parseText "<t size='0.9' align='center'>Bid + $3m</t>";
_btn12 buttonSetAction "[3000000] spawn DS_civ_placeBid;";

_btnClose ctrlSetStructuredText parseText "<t size='0.9' align='center'>Close Menu and opt out of currently offered item (Current bid is not cancelled)</t>";
_btnClose buttonSetAction "closeDialog 0;";

sleep 2;

while{(!(isNull (findDisplay 366346)))}do
	{
	_leading = "";
	if(player getVariable ["leading",false])then{_leading = "You are leading"};

	_textArea ctrlSetStructuredText parseText format [
	"<t color='#2E64FE' align='center'>This Auction is for a %1</t><br/>
	<t color='#2E64FE' align='center'>Current Price: $%2    %4</t><br/>
	<t align='center'>Time Remaining: %5 Seconds</t><br/><br/><br/>
	<t align='center'>%3</t>",
	(_itemArray select 2),
	[DS_auctionPrice] call DS_fnc_numberText,
	(_itemArray select 5),
	_leading,
	(DS_auctionTime - 3)];
	if(DS_auctionTime < 3)then{closeDialog 0;};
	sleep 0.5;
	};