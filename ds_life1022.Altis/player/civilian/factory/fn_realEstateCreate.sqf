/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Crafts a Real Estate
*/

private ["_amount","_temp","_multiplier","_TotalScore","_str","_action","_exit","_sellPrice"];

_exit = false;

if((DS_realEstateArray select 28) > 0)then
	{
	_sellPrice = ((DS_realEstateArray select 28)*0.8);
	_action = [
	format ["You already have your own developed property, would you like to sell this for $%1?",[_sellPrice] call DS_fnc_numberText],
	"Sell Your Property?",
	"Yes Sell",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(_action)then
		{
		DS_realEstateArray set [28,0];
		[_sellPrice,true,true] call DS_fnc_handleMoney;
		hint format ["You have sold your custom property, $%1 has been added to your bank account",[_sellPrice] call DS_fnc_numberText];
		}
		else
		{
		_exit = true;
		};
	};
if(_exit)exitwith{};

closeDialog 0;
sleep 0.3;

hintC "

                                    Custom Real Estate     (Read Carefully)\n\n
Explanation:\n\nCustom Real Estate can be bought here for $10m, the more 'Special Items' you have on you when you buy, will mean the higher chance you will create a higher quality property\n\n

";

waitUntil {isNull (findDisplay 57)};
hint "";
hintC "

                                                     Special Items are: \n\n
* Treated Bronze - High Quality Glass - Steel - Hardened Lumber - Cement\n
* Legal Relics - Washed Illegal Relics - Classified Documents - Cut Diamonds\n
* CircuitBoard - Small Battery - CPU - Super Vehicle Security Upgrade\n\n\n

";

waitUntil {isNull (findDisplay 57)};
hint "";
hintC "

                                                     Rent Payments: \n\n

Your rent payments will be a value decided by the amount of goods you used in your Real Estates development\n\n
All the special items are useful, you must use at minimum one of each special item\n\n
However using more items will give you a higher chance of creating prime Real Estate

";

waitUntil {isNull (findDisplay 57)};
hint "";
hintC "

                                                            Tips: \n\n

Use Alcohol or Steroids to increase your carry weight, allowing you hold more materials for a higher chance at creating prime Real Estate\n\n
Each Item has a maximum usage amount, using anymore of an item than this amount is useless. The exact values are on the help screen (J Key)

";

waitUntil {isNull (findDisplay 57)};
hint "";

_ingredientsArray = [
["DS_item_mattBronze",DS_item_mattBronze,3,3,40],
["DS_item_mattCrystalGlass",DS_item_mattCrystalGlass,3,3,30],
["DS_item_mattSteel",DS_item_mattSteel,3,3,70],
["DS_item_mattTreatedLumber",DS_item_mattTreatedLumber,7,7,120],
["DS_item_rockp",DS_item_rockp,9,9,140],
["DS_item_relic",DS_item_relic,3,3,20],
["DS_item_illegalRelicp",DS_item_illegalRelicp,7,7,30],
["DS_item_spyDocs",DS_item_spyDocs,10,10,30],
["DS_item_diamondp",DS_item_diamondp,9,9,125],
["DS_item_mattCircuitBoard",DS_item_mattCircuitBoard,25,25,20],
["DS_item_mattSmallBattery",DS_item_mattSmallBattery,15,15,40],
["DS_item_mattCpu",DS_item_mattCpu,30,30,12],
["DS_item_vehSecurityAdv",DS_item_vehSecurityAdv,50,50,5]

];

_pos = (position player);
_sleep = 0.05;

if(((DS_infoArray select 13) < 37))exitwith{hint "You must complete the quest 'Big Auction Spender' before using this feature"};

//First lets make sure the play has all the needed items
{
	_temp = (_x select 1);
	if(_temp == 0)then
		{
		_exit = true;
		};
}forEach _ingredientsArray;
if(_exit)exitwith{hint "You are lacking all the needed items to begin this Real Estate creation. Remember you MUST have at least 1 of each special item to begin"};
if([10000000,true] call DS_fnc_checkMoney)exitwith{hint "You must have at least $10m in your bank to begin this"};
//Lets make sure they know what they're doing
_action = [
	"Beginning this process will remove all the special items from your inventory, continue?",
	"Begin Development",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

//First lets make sure the play has all the needed items
{
	_temp = (_x select 1);
	if(_temp == 0)then
		{
		_exit = true;
		};
}forEach _ingredientsArray;
if(_exit)exitwith{hint "You are lacking all the needed items to begin this Real Estate creation. Remember you MUST have at least 1 of each special item to begin"};

if(DS_mining)exitwith{hint "Something is preventing you doing this, if you feel this is a bug please report it"};
DS_mining = true;
//Progress bar
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Developing Real Estate (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Developing Real Estate (%2%1)...","%",round(_cp*100)];
	if(_cP >= 1) exitWith {};
	if(!alive player)exitwith{};
	if(player distance _pos > 5)exitwith{};
	if(DS_tazed)exitwith{};
};
DS_mining = false;
"progressBar" cutText ["","PLAIN"];
if(!alive player)exitwith{};
if(player distance _pos > 5)exitwith{systemchat "You moved too far away"};

//Calc score

_TotalScore = 0;
_multiplier = 0;
_amount = 0;

{
	if((_x select 1) > 0)then
		{
		_amount = (_x select 1);
		if(_amount > (_x select 4))then{_amount = (_x select 4)};
		_multiplier = (_x select 2) + random (_x select 3);
		_totalScore = _totalScore + _multiplier*_amount;
		};
}forEach _ingredientsArray;

if([10000000,true] call DS_fnc_checkMoney)exitwith{hint "You must have at least $10m in your bank to begin this"};
[10000000,true,false] call DS_fnc_handleMoney;
{
	[(_x select 0),false,(_x select 1)] call DS_fnc_handleInventory;
}forEach _ingredientsArray;

_totalScore = _totalScore*4.5;

player say3D "success";
hint format ["Congratulations, your new property has been developed and rented out!\n\n\nYou will receive $%1 per paycheck for this property",[_totalScore] call DS_fnc_numberText];

DS_realEstateArray set [28,_totalScore];
[] call DS_fnc_compileData;

if((DS_infoArray select 13) == 52)then { [0] call DS_fnc_questCompleted };