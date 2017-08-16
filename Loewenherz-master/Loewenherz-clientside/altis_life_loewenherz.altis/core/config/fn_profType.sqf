/*
File: fn_profType
Author: Jacob "PapaBear" Tyler
Description:
Text changing
*/
//convert name to prof name
_type = param [0,"",[""]];

if(_type == "" ) exitWith {[]};

    //diag_log format["Type::%1",_type];
_profName = "";
switch ( _type ) do
{
//text to license
case "heroin": {_profName = "Heroin_Prof"; };
case "heroinu": {_profName = "Heroin_Prof"; };
case "cocaine": { _profName = "Cocaine_Prof";};
case "cocainep": { _profName = "Cocaine_Prof";};
case "marijuana": { _profName = "Cannabis_Prof";};
case "cannabis": { _profName = "Cannabis_Prof";};
//case "kroku": { _profName = "Krok_Prof";};
//case "krokp": { _profName = "Krok_Prof";};
//case "methu": { _profName = "Meth_Prof";};
//case "methp": { _profName = "Meth_Prof";};
case "rye": { _profName = "Distilling_Prof";};
case "whiskey": { _profName = "Distilling_Prof";};
case "hops": { _profName = "Brewing_Prof";};
case "yeast": { _profName = "Brewing_Prof";};
case "beerp": { _profName = "Brewing_Prof";};
case "cornmeal": { _profName = "Shining_Prof";};
case "mash": { _profName = "Shining_Prof";};
case "moonshine": { _profName = "Shining_Prof";};
case "bottledbeer": { _profName = "Bottling_Prof";};
case "bottledwhiskey": { _profName = "Bottling_Prof";};
case "bottledshine": { _profName = "Bottling_Prof";};
case "copper_r": { _profName = "Copper_Prof"; };
case "ironore": { _profName = "Iron_Prof";};
case "copper": { _profName = "Copper_Prof"; };
case "iron": { _profName = "Iron_Prof";};
case "salt": {_profName = "Salt_Prof"; };
case "sand": { _profName = "Sand_Prof";};
case "diamond": { _profName = "Diamond_Prof";};
case "diamondc": { _profName = "Diamond_Prof";};
case "oil": { _profName = "Oil_Prof";};
case "cement": { _profName = "Rock_Prof";};
case "apple": { _profName = "Fruit_Prof"; };
case "peach": { _profName = "Fruit_Prof";};
case "berries": { _profName = "Fruit_Prof";};
case "copperore": { _profName = "Copper_Prof"; };
case "iron_r": { _profName = "Iron_Prof";};
case "oilu": { _profName = "Oil_Prof";};
case "rock": { _profName = "Rock_Prof";};
case "rabbit": { _profName = "Hunting_Prof";};
case "adog": { _profName = "Hunting_Prof";};
case "dog": { _profName = "Hunting_Prof";};
case "goat": { _profName = "Hunting_Prof";};
case "sheep": { _profName = "Hunting_Prof";};
case "rooster": { _profName = "Hunting_Prof";};
case "hen": { _profName = "Hunting_Prof";};
case "rabbitC": { _profName = "Hunting_Prof";};
case "adogC": { _profName = "Hunting_Prof";};
case "dogC": { _profName = "Hunting_Prof";};
case "goatC": { _profName = "Hunting_Prof";};
case "sheepC": { _profName = "Hunting_Prof";};
case "roosterC": { _profName = "Hunting_Prof";};
case "henC": { _profName = "Hunting_Prof";};
case "salema": { _profName = "Fishing_Prof";};
case "ornate": { _profName = "Fishing_Prof";};
case "mackerel": { _profName = "Fishing_Prof";};
case "mullet": { _profName = "Fishing_Prof";};
case "tuna": { _profName = "Fishing_Prof";};
case "catshark": { _profName = "Fishing_Prof";};
case "turtle": { _profName = "Fishing_Prof";};
case "tabak": { _profName = "Cigarette_Prof";};
case "zigarette": { _profName = "Cigarette_Prof";};
//license to text
case "Heroin_Prof": {_profName = "Heroin"; };
case "Cocaine_Prof": { _profName = "Cocaine";};
case "Cannabis_Prof": { _profName = "Weed";};
//case "Meth_Prof": { _profName = "Meth";};
//case "Krok_Prof": { _profName = "Krok";};
case "Shining_Prof": { _profName = "Shining";};
case "Bottling_Prof": { _profName = "Bottling";};
case "Distilling_Prof": { _profName = "Distilling";};
case "Brewing_Prof": { _profName = "Brewing";};
case "Copper_Prof": { _profName = "Copper"; };
case "Iron_Prof": { _profName = "Iron";};
case "Salt_Prof": {_profName = "Salt"; };
case "Sand_Prof": { _profName = "Sand";};
case "Diamond_Prof": { _profName = "Diamond";};
case "Oil_Prof": { _profName = "Oil";};
case "Rock_Prof": { _profName = "Rock";};
case "Fruit_Prof": { _profName = "Fruit"; };
case "Ticket_Prof": { _profName = "Ticket"; };
case "Arrest_Prof": { _profName = "Arrest"; };
case "Impound_Prof": { _profName = "Impound"; };
case "Revive_Prof": { _profName = "Revive"; };
//case "Rogue_Prof": { _profName = "Rogue"; };
//case "Hero_Prof": { _profName = "Hero"; };
case "Citizen_Prof": { _profName = "Citizen"; };
case "Criminal_Prof": { _profName = "Criminal"; };
//case "Hunting_Prof": { _profName = "Hunting"; };
case "Fishing_Prof": { _profName = "Fishing"; };
case "Thief_Prof": { _profName = "Thief"; };
case "Cigarette_Prof": { _profName = "Tabak";};
case "Cigarette_Prof": { _profName = "Zigaretten";};
case "Smoke_Prof": { _profName = "Smoke";};
case "Repair_Prof": { _profName = "Repair";};
case "RedGull_Prof": { _profName = "RedGull";};
case "shooting_Prof": { _profName = "shooting";};
case "ADAC_Prof": { _profName = "ADAC";};

//license to text
case "Heroin": {_profName = "Heroin_Prof"; };
case "Cocaine": { _profName = "Cocaine_Prof";};
case "Weed": { _profName = "Cannabis_Prof";};
//case "Meth": { _profName = "Meth_Prof";};
//case "Krok": { _profName = "Krok_Prof";};
case "Shining": { _profName = "Shining_Prof";};
case "Bottling": { _profName = "Bottling_Prof";};
case "Distilling": { _profName = "Distilling_Prof";};
case "Brewing": { _profName = "Brewing_Prof";};
case "Copper": { _profName = "Copper_Prof"; };
case "Iron": { _profName = "Iron_Prof";};
case "Salt": {_profName = "Salt_Prof"; };
case "Sand": { _profName = "Sand_Prof";};
case "Diamond": { _profName = "Diamond_Prof";};
case "Oil": { _profName = "Oil_Prof";};
case "Rock": { _profName = "Rock_Prof";};
case "Fruit": { _profName = "Fruit_Prof"; };
case "Citizen": { _profName = "Citizen_Prof"; };
case "Criminal": { _profName = "Criminal_Prof"; };
//case "Hunting": { _profName = "Hunting_Prof"; };
case "Fishing": { _profName = "Fishing_Prof"; };
case "Thief": { _profName = "Thief_Prof"; };
case "Ticket": { _profName = "Ticket_Prof"; };
case "Arrest": { _profName = "Arrest_Prof"; };
case "Impound": { _profName = "Impound_Prof"; };
case "Revive": { _profName = "Revive_Prof"; };
//case "Rogue": { _profName = "Rogue_Prof"; };
//case "Hero": { _profName = "Hero_Prof"; };
case "Tabak": { _profName = "Cigarette_Prof";};
case "Zigaretten": { _profName = "Cigarette_Prof";};
case "Smoke": { _profName = "Smoke_Prof";};
case "Repair": { _profName = "Repair_Prof";};
case "RedGull": { _profName = "RedGull_Prof";};
case "shooting": { _profName = "shooting_Prof";};
case "ADAC": { _profName = "ADAC_Prof";};
default{""};
};

diag_log format["_profName::%1",_profName];

_profName