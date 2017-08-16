/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens and updates the players inventory menu
*/

private["_noImg","_bug","_viewDistance","_quest","_admin","_buttonstats","_buttonSync","_buttonKeys","_timePlayed","_timeStr","_tstatus","_tstatusNew","_timePlayedTeam","_tempString","_licenses","_dialog","_money","_title","_closePlayers","_nearUnits","_cop","_weight","_closePlayersInv","_inventory","_string","_short","_value","_toolTip","_counter","_img","_buttonMarket"];

if(DS_mining)exitwith{};//Anti Exploit

if(!dialog) then
{
	if(!(createDialog "playerMenu")) exitWith {};
};

disableSerialization;

_dialog = findDisplay 666666;
_money = _dialog displayCtrl 2015;
_title = _dialog displayCtrl 1424;
_closePlayers = _dialog displayCtrl 2022;
_weight = _dialog displayCtrl 2009;
_closePlayersInv = _dialog displayCtrl 2023;
_giveMoney = _dialog displayCtrl 2001;
_inventory = _dialog displayCtrl 9009;
_licenses = _dialog displayCtrl 2014;
_tstatus = _dialog displayCtrl 666008;
_tstatusNew = _dialog displayCtrl 666009;
_buttonCell = _dialog displayCtrl 666004;
_buttonKeys = _dialog displayCtrl 666003;
_buttonGang = _dialog displayCtrl 666007;
_buttonSync = _dialog displayCtrl 666001;
_buttonMarket = _dialog displayCtrl 666002;
_buttonstats = _dialog displayCtrl 666000;
_admin = _dialog displayCtrl 666006;
_quest = _dialog displayCtrl 666013;
_bug = _dialog displayCtrl 666053;
_viewDistance = _dialog displayCtrl 10011;
if(!(player getVariable ["DSAdmin",false]))then
	{
	_admin ctrlEnable false;
	_admin ctrlShow false;
	};
_cop = "";
_tempString = "";
_noImg = ["houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steriods","noRecoil","quickCap",
"packCPU","packBattery","packCircuitBoard","packGlass","packBronze","packSteel","pawnee","convoy","idChanger","bones"];

//Text
_title ctrlSetStructuredText parseText "<t size='1.6' color='#848484'>Darkside Inventory Management</t>";
_money ctrlSetStructuredText parseText format["<img size='1.3' image='extras\icons\bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='extras\icons\money.paa'/> <t size='0.8'>$%2</t>",[DS_atmcoin] call DS_fnc_numberText,[DS_coin] call DS_fnc_numberText];
_weight ctrlSetStructuredText parseText format ["<t color='#848484'>Weight: %1 / %2</t>",DS_currentWeight,DS_maxWeight];

//Buttons
_giveMoney ctrlSetTooltip "Give Money";
_giveMoney buttonSetAction "[] spawn DS_fnc_giveMoney;";



//Combos
lbClear _closePlayers;
_nearUnits = [];
//full array with unit names
{ if(player distance _x < 5) then {_nearUnits pushBack _x;};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 5) then
	{
		_cop = "";
		if((side _x) == west)then{_cop = "(Officer)"};
		_closePlayers lbAdd format["%1%2",(_cop),(name _x)];
		_closePlayers lbSetData [(lbSize _closePlayers)-1,str(_x)];
		_closePlayersInv lbAdd format["%1%2",(_cop),(name _x)];
		_closePlayersInv lbSetData [(lbSize _closePlayersInv)-1,str(_x)];
	};
} foreach _nearUnits;

//list
lbClear _inventory;
//Inventory list
_counter = 0;
{
	_value = missionNamespace getVariable _x;
	if(_value > 0)then
		{
		_string = [_x] call DS_fnc_itemStringConfig;
		_short = [_x,"DS_item_",""] call KRON_Replace;
		_toolTip = [_x] call DS_fnc_itemTooltipConfig;
		_img = format ["extras\icons\%1.jpg",_short];
		if([_short,"bp"] call KRON_StrInStr)then
			{
			_img = "extras\icons\bluePrint.jpg"
			};
		if([_short,"ammo"] call KRON_StrInStr)then
			{
			_img = "extras\icons\vehAmmo.jpg"
			};
		if([_short,"gun"] call KRON_StrInStr)then
			{
			_img = "extras\icons\mcuGun.jpg"
			};
		if(_short in _noImg)then{_img = ""};
		_inventory lbAdd format ["%1x - %2",_value,_string];
		_inventory lbSetPicture [(lbSize _inventory)-1, _img];
		_inventory lbSetData [(lbSize _inventory)-1,_short];
		_inventory lbSetTooltip [_counter, _toolTip];
		_inventory lbSetColor [_counter, [0, 1, 0, 0.5]];
		_counter = _counter + 1;
		};
}forEach DS_itemArray;

{
	_true = missionNameSpace getVariable _x;
	if(_true)then
		{
		_string = [_x] call DS_fnc_itemStringConfig;
		_tempString = _tempString + format ["%1<br/>",_string];
		};
}forEach DS_licenseArray;

if(_tempString == "")then{_tempString = "No Licenses"};

_licenses ctrlSetStructuredText parseText format ["<t size='0.8px'>%1</t>",_tempString];

_timePlayed = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
_timePlayed = (floor(_timePlayed/60));

switch(playerside)do
	{
	case west:
		{
		_timePlayedTeam = (DS_infoArray select 0);
		_timePlayedTeam = (floor(_timePlayedTeam/60));
		_timeStr = "Cop Time ";
		};
	case civilian:
		{
		_timePlayedTeam = (DS_infoArray select 1);
		_timePlayedTeam = (floor(_timePlayedTeam/60));
		_timeStr = "Civilian Time ";
		};
	case independent:
		{
		_timePlayedTeam = (DS_infoArray select 2);
		_timePlayedTeam = (floor(_timePlayedTeam/60));
		_timeStr = "WL Civ Time ";
		};
	};
	
_tstatusNew ctrlSetStructuredText parseText format["
<t size='0.8px'>
%2: %1 Hours
</t>
",_timePlayedTeam,_timeStr];
		
_tstatus ctrlSetStructuredText parseText format["
<t size='0.8px'>
Play Time: %1 Hours
</t>
",_timePlayed];

if(DS_viewDistance < 1)then
	{
	ctrlSetText[10011,"View Distance: Default"];
	}
	else
	{
	ctrlSetText[10011,format["View Distance: %1m",round(DS_viewDistance)]];
	};

//buttonS

_buttonCell ctrlSetTooltip "Player cellphone";
_buttonCell buttonSetAction "[] spawn DS_fnc_menuPhone;";

_buttonKeys ctrlSetTooltip "Opens a menu to edit your key chain";
_buttonKeys buttonSetAction "[] spawn DS_fnc_menuKeys;";

if(playerside == civilian)then
	{
	_buttonGang ctrlSetTooltip "Open the player gang menu";
	_buttonGang buttonSetAction "[] spawn DS_civ_openGangMenu;";
	_buttonMarket ctrlSetTooltip "View current market prices";
	_buttonMarket buttonSetAction "[] spawn DS_fnc_marketPrices;";
	};
if(playerside == west)then
	{
	_buttonGang ctrlSetTooltip "Open the wanted menu";
	_buttonGang buttonSetAction "[] spawn DS_cop_wantedlist;";
	};
	
if(player getVariable ["security",false])then
	{
	_buttonGang ctrlSetTooltip "Open the wanted menu";
	_buttonGang buttonSetAction "[] spawn DS_cop_wantedlist;";
	};

_quest ctrlSetTooltip "Quest Log"; 
_quest buttonSetAction "[DS_questFocus] spawn DS_fnc_openQuestLog;";
_buttonSync ctrlSetTooltip "Sync your data"; 
_buttonSync buttonSetAction "[] spawn DS_fnc_syncData;";
_buttonstats ctrlSetTooltip "Check your stats"; 
_buttonstats buttonSetAction "[] spawn DS_fnc_showPlayerStats;";
_bug ctrlSetTooltip "Report a bug"; 
_bug buttonSetAction "createDialog ""bugMenu"";";