/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the players inventory menu
*/

private ["_cop","_index","_value","_string","_tooltip","_timePlayed","_team","_timeStr"];

if(DS_mining)exitwith{};

if(!dialog) then {
	if(!(createDialog "playerMenu"))exitWith{};
};

disableSerialization;

_dialog = findDisplay 666666;
_money = _dialog displayCtrl 2015;
_title = _dialog displayCtrl 1424;
_closePlayers = _dialog displayCtrl 2022;
_weight = _dialog displayCtrl 2009;
_closePlayersInv = _dialog displayCtrl 2023;
_btnGiveMoney = _dialog displayCtrl 2001;
_inventory = _dialog displayCtrl 9009;
_licenses = _dialog displayCtrl 2014;
_totalTimeText = _dialog displayCtrl 666008;
_teamTimeText = _dialog displayCtrl 666009;
_btnCell = _dialog displayCtrl 666004;
_btnKeys = _dialog displayCtrl 666003;
_btnGang = _dialog displayCtrl 666007;
_btnSync = _dialog displayCtrl 666001;
_btnMarket = _dialog displayCtrl 666002;
_btnStats = _dialog displayCtrl 666000;
_btnAdmin = _dialog displayCtrl 666006;
_btnQuests = _dialog displayCtrl 666013;
_btnBugReport = _dialog displayCtrl 666053;

_btnGive = _dialog displayCtrl 2002;
_btnUse = _dialog displayCtrl 9499;
_btnRemove = _dialog displayCtrl 3009;
_btnIntro = _dialog displayCtrl 6664;

_viewDistance = _dialog displayCtrl 10011;

if(!(player getVariable ["DSAdmin",false]))then {
	_btnAdmin ctrlEnable false;
	_btnAdmin ctrlShow false;
};

//Cos of current UID spoofing
_btnAdmin ctrlEnable false;
_btnAdmin ctrlShow false;

_tempString = "";
_noImg = ["houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap","packCPU","packBattery","packCircuitBoard","packGlass","packBronze","packSteel","pawnee","convoy","idChanger","bones","blackfoot","armourAdv","insurance","airBags"];

//Text
_title ctrlSetStructuredText parseText "<t size='1.6' color='#848484'>Darkside Inventory Management</t>";
_money ctrlSetStructuredText parseText format ["<img size='1.3' image='extras\icons\bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='extras\icons\money.paa'/> <t size='0.8'>$%2</t>",[DS_atmCoin] call DS_fnc_numberText,[DS_coin] call DS_fnc_numberText];
_weight ctrlSetStructuredText parseText format ["<t color='#848484'>Weight: %1 / %2</t>",DS_currentWeight,DS_maxWeight];

//Buttons
_btnGiveMoney ctrlSetTooltip "Give Money";
_btnGiveMoney buttonSetAction "[] spawn DS_fnc_giveMoney;";

//Combos
lbClear _closePlayers;
lbClear _closePlayersInv;

//Fill the nearby player arrays
_nearUnits = [];
_crew = [];

{if((player distance _x < 5))then{_nearUnits pushBack _x;};} forEach allPlayers;

if(!isNull objectParent player)then {
	_crew = (crew (vehicle player));
	{if(isPlayer _x)then{_nearUnits pushBackUnique _x;};} forEach _crew;
};

{
	if((!isNull _x)&&(alive _x)&&(((player distance _x) < 5)||(_x in _crew))&&(!(_x isEqualTo player)))then {
		_cop = if((side _x) isEqualTo west)then{"(Officer)"}else{""};

		_index = _closePlayers lbAdd format ["%1%2",_cop,(name _x)];
		_closePlayers lbSetData [_index,(_x call BIS_fnc_objectVar)];

		_index = _closePlayersInv lbAdd format ["%1%2",_cop,(name _x)];
		_closePlayersInv lbSetData [_index,(_x call BIS_fnc_objectVar)];
	};
} forEach _nearUnits;

lbSort [_closePlayers,"ASC"];
lbSort [_closePlayersInv,"ASC"];

//List
lbClear _inventory;

//Inventory list
{
	_value = missionNamespace getVariable (format ["DS_item_%1",_x]);

	if(_value > 0)then {
		_string = [_x] call DS_fnc_itemStringConfig;
		_tooltip = [_x] call DS_fnc_itemTooltipConfig;
		if(_x in DS_illegalItemsArray)then{_tooltip = format ["(Illegal) - %1",_tooltip];};

		_img = format ["extras\icons\%1.jpg",_x];
        if([_x,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg"};
		if([_x,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg"};
		if([_x,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg"};
		if(_x in _noImg)then{_img = ""};

		_index = _inventory lbAdd format ["%1x - %2",_value,_string];
		_inventory lbSetData [_index,_x];
		_inventory lbSetTooltip [_index,_tooltip];

		if(_x in DS_illegalItemsArray)then {
			if(playerside isEqualTo civilian)then {
				_inventory lbSetColor [_index,[1,0,0,0.5]];
			} else {
				_inventory lbSetColor [_index,[0,1,0,0.5]];
			};
		} else {
			_inventory lbSetColor [_index,[0,1,0,0.5]];
		};

		if(!(_img isEqualTo ""))then{_inventory lbSetPicture [_index,_img];};
	};
} forEach DS_itemArray;

{
	if(missionNameSpace getVariable _x)then {
		_string = [_x] call DS_fnc_itemStringConfig;
		_tempString = _tempString + format ["%1<br/>",_string];
	};
} forEach DS_licenseArray;

if(_tempString isEqualTo "")then{_tempString = "No Licenses"};

_licenses ctrlSetStructuredText parseText format ["<t size='0.8px'>%1</t>",_tempString];

_timePlayed = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
_timePlayed = (floor(_timePlayed/60));
player setVariable ["timePlayed",_timePlayed,true];

switch(playerside)do {
	case west: {
		_team = (DS_infoArray select 0);
		_team = (floor(_team/60));
		_timeStr = "Cop Time ";
	};
	case civilian: {
		_team = (DS_infoArray select 1);
		_team = (floor(_team/60));
		_timeStr = "Civilian Time ";
	};
	case independent: {
		_team = (DS_infoArray select 2);
		_team = (floor(_team/60));
		_timeStr = "WL Civ Time ";
	};
};

_teamTimeText ctrlSetStructuredText parseText format ["
<t size='0.8px'>
%2: %1 Hours
</t>
",_team,_timeStr];

_totalTimeText ctrlSetStructuredText parseText format ["
<t size='0.8px'>
Play Time: %1 Hours
</t>
",_timePlayed];

if(DS_viewDistance < 1)then {
	ctrlSetText [10011,"View Distance: Default"];
} else {
	ctrlSetText [10011,format ["View Distance: %1m",round(DS_viewDistance)]];
};

//Buttons
_btnCell ctrlSetTooltip "Player cellphone";
_btnCell buttonSetAction "[] spawn DS_fnc_menuPhone;";

_btnKeys ctrlSetTooltip "Opens a menu to edit your key chain";
_btnKeys buttonSetAction "[] spawn DS_fnc_menuKeys;";

if(playerSide isEqualTo civilian)then {
	_btnGang ctrlSetTooltip "Open the player gang menu";
	_btnGang buttonSetAction "[] spawn DS_civ_openGangMenu;";

	_btnMarket ctrlSetTooltip "View current market prices";
	_btnMarket buttonSetAction "[] spawn DS_fnc_marketPrices;";
};

if(playerSide isEqualTo west)then {
	_btnGang ctrlSetTooltip "Open the wanted menu";
	_btnGang buttonSetAction "[] spawn DS_cop_wantedlist;";
};

if(player getVariable ["security",false])then {
	_btnGang ctrlSetTooltip "Open the wanted menu";
	_btnGang buttonSetAction "[] spawn DS_cop_wantedlist;";
};

_btnQuests ctrlSetTooltip "Quest Log";
_btnQuests buttonSetAction "[DS_questFocus] spawn DS_fnc_openQuestLog;";

_btnSync ctrlSetTooltip "Sync your data";
_btnSync buttonSetAction "[] spawn DS_fnc_syncData;";

_btnStats ctrlSetTooltip "Check your stats";
_btnStats buttonSetAction "[] spawn DS_fnc_showPlayerStats;";

_btnBugReport ctrlSetTooltip "Report a bug";
_btnBugReport buttonSetAction "createDialog ""bugMenu"";";

_btnGive ctrlSetTooltip "Give selected item to targeted player";
_btnUse ctrlSetTooltip "Use your selected item";
_btnRemove ctrlSetTooltip "Remove the selected item from your inventory";
_btnIntro ctrlSetTooltip "Disable or enable the server intro";