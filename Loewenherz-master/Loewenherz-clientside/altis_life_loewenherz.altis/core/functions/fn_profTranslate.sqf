/*
    File: fn_profTranslate.sqf
    Author: Barney
*/


private ["_was","_name"];
_was = param[0,"",[""]];

if(count(_was) == 0) exitWith {};

switch(_was) do {
    case "Oil_Prof": {_name = "Öl"};
    case "Iron_Prof": {_name = "Eisen"};
    case "Copper_Prof": {_name = "Kupfer"};
    case "Heroin_Prof": {_name = "Heroin"};
    case "Cannabis_Prof": {_name = "Weed"};
    case "Cocaine_Prof": {_name = "Kokain"};
    case "Salt_Prof": {_name = "Salz"};
    case "Fruit_Prof": {_name = "Früchte"};
    case "Diamond_Prof": {_name = "Diamanten"};
    case "Rock_Prof": {_name = "Steine"};
    case "Sand_Prof": {_name = "Sand"};
    case "Shining_Prof": {_name = "Shining"};
    case "Brewing_Prof": {_name = "Brauen"};
    case "Distilling_Prof": {_name = "Destillieren"};
    case "Bottling_Prof": {_name = "Botteln"};
    case "Fishing_Prof": {_name = "Fischen"};
    case "Thief_Prof": {_name = "Raub"};
    case "Cigarette_Prof": {_name = "Zigaretten"};
    case "Smoke_Prof": {_name = "Rauchen"};
    case "Repair_Prof": {_name = "Reparieren"};
    case "RedGull_Prof": {_name = "Redgull"};
    case "Revive_Prof": {_name = "Wiederbeleben"};
    case "Impound_Prof": {_name = "Beschlagnahmen"};
    case "Arrest_Prof": {_name = "Verhaften"};
    case "Ticket_Prof": {_name = "Strafzettel"};
    case "shooting_Prof": {_name = "Schussfähigkeit"};
    case "ADAC_Prof": {_name = "ADAC-Level"};

    default {_name = "Hildegard"};


};

_name
