/*File: fn_profTypeAuthor: Jacob "PapaBear" Tyler Description:Text changing*/

//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param;if(_type == "" ) exitWith {[]};_profName = "";switch ( _type ) do{

//text to license
case "heroin": {_profName = "Heroin_Prof";};case "cocaine": { _profName = "Cocain_Prof";};case "marijuana": { _profName = "Canabis_Prof";};case "copper": { _profName = "Copper_Prof";};case "iron": { _profName = "Iron_Prof";};case "salt": {_profName = "Salt_Prof"; };case "sand": { _profName = "Sand_Prof";};case "diamond": { _profName = "Diamond_Prof";};case "oil": { _profName = "Oil_Prof";};case "cement": { _profName = "Rock_Prof";};case "apple": { _profName = "Fruit_Prof";};
case "pebble": { _profName = "Pebble_Prof";
};case "peach": { _profName = "Fruit_Prof";};case "heroinu": {_profName = "Heroin_Prof";};case "cannabis": { _profName = "Canabis_Prof";};case "copperore": { _profName = "Copper_Prof";};case "ironore": { _profName = "Iron_Prof";};case "oilu": { _profName = "Oil_Prof";};case "rock": { _profName = "Rock_Prof";};
//license to text
case "Heroin_Prof": {_profName = "Heroin";};case "Cocain_Prof": { _profName = "Cocaine";};case "Canabis_Prof": { _profName = "Cannabis";};case "Copper_Prof": { _profName = "Copper";};case "Iron_Prof": { _profName = "Iron";};case "Salt_Prof": {_profName = "Salt";};case "Sand_Prof": { _profName = "Sand";};case "Diamond_Prof": { _profName = "Diamond";};case "Oil_Prof": { _profName = "Oil";};case "Rock_Prof": { _profName = "Rock";};case "Fruit_Prof": { _profName = "Fruit";};
case "Pebble_Prof": { _profName = "Pebble";
};default{""};};_profName;