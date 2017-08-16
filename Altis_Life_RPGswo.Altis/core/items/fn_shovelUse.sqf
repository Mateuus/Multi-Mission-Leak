#include "..\..\macros.hpp"
/*
	File: fn_shovelUse.sqf
	Author: www.division-wolf.de
	Description:
	Schatzinsel
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val","_fail"];
_val = 1;
_fail = 90; //10%, geht schaufel kaputt
_dice = floor (random 100);


if (DWEV_action_inUse) exitWith {};

if(!((player distance (getMarkerPos "schatzinsel_1") < 330) || (player distance (getMarkerPos "schatzinsel_2") < 450))) exitWith {};
if (DWEV_inv_shovel == 0) exitWith {titleText["Du brauchst eine Schaufel", "PLAIN"];};
if(vehicle player != player) exitWith {hint "Du kannst nicht innerhalb des Fahrezuges Sammeln.";};

if(_dice >= _fail) exitWith 
{
	titleText["Deine Schaufel ist kaputt.","PLAIN"];
	[false,"shovel",1] call DWEV_fnc_handlelnv;
};

DWEV_action_inUse = true;

//RANDOM Item auswahl
//[ItemName, prozent] //anzahl beim test gefunden

_items = [];

/* Items nicht in der liste, damit die beim craften auch zwischen druch farmen müssen
_items pushBack ["iron_r",1];
_items pushBack ["copper_r",1];
_items pushBack ["glass",1];
_items pushBack ["cement",1];
_items pushBack ["goldberuf",1];
_items pushBack ["silberbar",1];
_items pushBack ["uranium4",1];
_items pushBack ["uranium5",1];
_items pushBack ["perlenk",1];
_items pushBack ["zimtp",1];
_items pushBack ["kokosbananamilk",1];
_items pushBack ["kriegsschrottp",1];
_items pushBack ["tropenholzp",1];
_items pushBack ["magmap",1];
_items pushBack ["",1];
_items pushBack ["",1];
_items pushBack ["",1];
_items pushBack ["",1];
_items pushBack ["",1];
*/

/*/ Dogen items wurden außenvor gelassen /
_items pushBack ["fahrsperre",3];
_items pushBack ["alarmanlage",3];
_items pushBack ["handschellen",3];
_items pushBack ["skalpell",3];
_items pushBack ["spikeStrip",3];
*/

/* Alles nur Fressen und Trinken 
_items pushBack ["apple",7];
_items pushBack ["water",7];
_items pushBack ["beer",7];
_items pushBack ["rabbit",7];
_items pushBack ["salema",7];
_items pushBack ["ornate",7];
_items pushBack ["mackerel",7];
_items pushBack ["tuna",7];
_items pushBack ["mullet",7];
_items pushBack ["catshark",7];
_items pushBack ["tbacon",7];
_items pushBack ["peach",7];
_items pushBack ["brot",7];
_items pushBack ["apfelsaft",7];
_items pushBack ["pfirsichsaft",7];
*/


/* Tanoa Items vorerst aus Altis entfernt
_items pushBack ["lehmp",5];
_items pushBack ["lehmp",5];
_items pushBack ["kautschukp",5];
_items pushBack ["kakaop",5];
_items pushBack ["tabakp",5];
_items pushBack ["zuckerrohrp",5];
_items pushBack ["kohlep",5];
_items pushBack ["melonp",5];
_items pushBack ["bananap",5];
_items pushBack ["kokosp",5];
_items pushBack ["schoko",5];
_items pushBack ["reifen",5];
_items pushBack ["platinp",5];
_items pushBack ["banana",7];
_items pushBack ["melon",7];
_items pushBack ["kriegsschrott",7];
_items pushBack ["lehm",7];
_items pushBack ["kautschuk",7];
_items pushBack ["tropenholz",7];
_items pushBack ["kakao",7];
_items pushBack ["tabak",7];
_items pushBack ["magma",7];
_items pushBack ["zuckerrohr",7];
_items pushBack ["kohle",7];
_items pushBack ["platin",7];
_items pushBack ["kokos",7];
*/

_items pushBack ["kevlar",1];
_items pushBack ["traubenzucker",1];
_items pushBack ["nitrov2",1];
_items pushBack ["kraftriegel",1];
_items pushBack ["redshot",1];
_items pushBack ["sechouse",1];
_items pushBack ["verband",1];
_items pushBack ["stoff",1];
_items pushBack ["ozelotpelz",1];
_items pushBack ["schwarzmarktoel",1];
_items pushBack ["farbeblau",1];
_items pushBack ["chemikalie",1];
_items pushBack ["gussform",1];
_items pushBack ["titan",1];
_items pushBack ["goldbar",1]; //bankgold
_items pushBack ["ipuranium",3]; //uraniumfilter
_items pushBack ["schnuller",3];
_items pushBack ["nitro",4];
_items pushBack ["pille",4];
_items pushBack ["lockpick",4];
_items pushBack ["ring",5];
_items pushBack ["oilp",5];
_items pushBack ["fuelF",5];
_items pushBack ["salt_r",5];
_items pushBack ["redgull",5];
_items pushBack ["pfefferp",5];
_items pushBack ["pilzsuppe",5];
_items pushBack ["uranium3",5];
_items pushBack ["perlen",5];
_items pushBack ["kartoffelp",5];
_items pushBack ["pommes",5];
_items pushBack ["salatp",5];
_items pushBack ["salatb",5];
_items pushBack ["curryp",5];
_items pushBack ["muell",15];
_items pushBack ["oilu",7];
_items pushBack ["fuelE",7];
_items pushBack ["copperore",7];
_items pushBack ["ironore",7];
_items pushBack ["salt",7];
_items pushBack ["sand",7];
_items pushBack ["diamond",7];
_items pushBack ["rock",7];
_items pushBack ["grapes",7];
_items pushBack ["pfeffer",7];
_items pushBack ["pilz",7];
_items pushBack ["golderz",7];
_items pushBack ["silbererz",7];
_items pushBack ["uranium1",7];
_items pushBack ["uranium2",7];
_items pushBack ["muschel",7];
_items pushBack ["kartoffel",7];
_items pushBack ["salat",7];
_items pushBack ["curry",7];
_items pushBack ["zimt",7];
_items pushBack ["shovel",7];

_anzahl = count _items;
_gesamt = 0; 
{ 
	_gesamt = _gesamt + (_x select 1); 
} forEach _items; 

_random = floor random _gesamt;
_prob = 0; 
_i = 0;
while {_prob < _random} do {
	_i = floor random _anzahl;
	_prob = _prob + ((_items select _i) select 1); 
};

_mine = (_items select _i) select 0;

//weiter gehts wie pickaxe
_diff = [_mine,_val,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Dein Inventar ist voll!"; DWEV_action_inUse = false;};
sleep 0.25;


for "_i" from 0 to 6 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_mine,_diff] call DWEV_fnc_handlelnv)) then
{
	_itemName = M_CONFIG(getText,"VirtualItems",_mine,"displayName");
	titleText[format["Du hast %2 %1 gefunden.",_itemName,_diff],"PLAIN"];
};

DWEV_action_inUse = false;