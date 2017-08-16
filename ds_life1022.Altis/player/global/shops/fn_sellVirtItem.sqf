/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sells a Virtual Item (All of that type in your inventory (Might make it singular as well later, probably not))
*/

disableSerialization;

private["_action","_index","_strName","_price","_amount","_longName","_atClanBase","_oldPrice"];

ctrlShow[777,false];

if(DS_mining)exitwith{};
_index = [DS_className] call DS_fnc_itemIndex;
_strName = [DS_className] call DS_fnc_itemStringConfig;
_longName = format ["DS_item_%1",DS_className];
_amount = missionNamespace getVariable _longName;
_price = ((DS_sellArray select _index)*_amount);
_oldPrice = _price;
_action = true;
//this addAction["<t color='#00FFFF'>Sell Illegal Goods</t>",DS_fnc_menuShop,[[],[53]],0,FALSE,FALSE,"",'isNull objectParent player && player distance _target < 6 && !DS_mining && playerSide isEqualTo civilian'];
_atClanBase = [] call DS_fnc_sellGangGoods;
if(!(DS_className in ["weedu","weedp","heroinu","heroinp","cocaineu","cocainep","illegalRelicp","illegalrelicu","meth"]))then
	{
	_atClanBase = false;
	};
if(_atClanBase)then
	{
	_price = (_price*0.7);
	_action = [
		"You are going to sell items in this clan base, because of this 30% of all profits will go to the local clans bank account",
		"Clan Tax",
		"Continue",
		"Exit"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	};
if(!_action)exitwith{};

if(_amount > 1)then
	{
		_action = [
			format ["Are you sure you want to sell %1 %2s for $%3",_amount,_strName,_price],
			"Sell Items",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
	}
	else
	{
		_action = [
			format ["Are you sure you want to sell A %1 for $%2",_strName,_price],
			"Sell Item",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
	};


if(!_action)exitwith{};

if(_amount != (missionNamespace getVariable _longName))exitwith{};//Possible exploit

[DS_className,false,_amount] call DS_fnc_handleInventory;
[_price,false,true] call DS_fnc_handleMoney;

if(_atClanBase)then
	{
	hint format ["You have sold %1 %2 for $%3 \n\n$%4 was added to the local clans bank balance",_amount,_StrName,[_price] call DS_fnc_numberText,[(_oldPrice*0.3)] call DS_fnc_numberText];
	[player,true,(_oldPrice*0.3),"added money",false] remoteExec ["HUNT_fnc_gangMoney",2];
	}
	else
	{
	hint format ["You have sold %1 %2 for $%3",_amount,_StrName,[_price] call DS_fnc_numberText];
	};

closeDialog 0;
_negMoral = ["weedu","weedp","heroinu","heroinp","cocaineu","cocainep","illegalrelicp","illegalrelicu","meth","goldbar"];
_posMoral = ["copperu","copperp","ironu","ironp","sandu","sandp","saltu","saltp","diamondu","diamondp","rocku","rockp","oilu","oilp","relic","woodp"];
if(DS_className in _negMoral)then{[5,false] spawn DS_fnc_moralAlter};
if(DS_className in _posMoral)then{[5,true] spawn DS_fnc_moralAlter};


switch(DS_classname)do
	{
	case "weedp":
		{
		[2,2] spawn DS_fnc_alterPrices;
		};
	case "heroinp":
		{
		[2,1] spawn DS_fnc_alterPrices;
		};
	case "cocainep":
		{
		[2,0] spawn DS_fnc_alterPrices;
		};
	case "copperp":
		{
		[1,0] spawn DS_fnc_alterPrices;
		};
	case "ironp":
		{
		[1,1] spawn DS_fnc_alterPrices;
		};
	case "saltp":
		{
		[1,2] spawn DS_fnc_alterPrices;
		};
	case "sandp":
		{
		[1,3] spawn DS_fnc_alterPrices;
		};
	case "diamondp":
		{
		[1,4] spawn DS_fnc_alterPrices;
		};
	case "rockp":
		{
		[1,5] spawn DS_fnc_alterPrices;
		};
	case "oilp":
		{
		[1,6] spawn DS_fnc_alterPrices;
		gasMoneyArray set[0,0];
		publicVariable "gasMoneyArray";
		};
	case "relic":
		{
		[1,7] spawn DS_fnc_alterPrices;
		};
	case "woodp":
		{
		[1,8] spawn DS_fnc_alterPrices;
		};
	case "illegalRelicp":
		{
		[2,3] spawn DS_fnc_alterPrices;
		};
	case "goldBar":
		{
		DS_illegalMoney = DS_illegalMoney + (_price/2);
		_time = time + 2200;
		waitUntil {((time > _time)||(!alive player))};
		if(DS_illegalMoney >= (_price/2))then
			{
			DS_illegalMoney = DS_illegalMoney - (_price/2);
			};
		};
	case "spyDocs":
		{
		DS_illegalMoney = DS_illegalMoney + (_price/2);
		if((DS_infoArray select 17) == 23)then { [2] call DS_fnc_questCompleted };
		_time = time + 2200;
		waitUntil {((time > _time)||(!alive player))};
		if(DS_illegalMoney >= (_price/2))then
			{
			DS_illegalMoney = DS_illegalMoney - (_price/2);
			};
		};
	};
