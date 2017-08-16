 
 
 
 
 
 
 
 
 
 
 
 
 
 
DYNMARKET_Serveruptime         = 04;    
DYNMARKET_UseExternalDatabase  = true;  
DYNMARKET_PriceUpdateInterval  = 05;    
DYNMARKET_CreateBackups        = true;  
DYNMARKET_CreateBackupInterval = 06;    
DYNMARKET_UserNotification     = false;  
 
 
 
DYNMARKET_UserNotification_Text =  
[ 
"Die Preise wurden aktuallisiert!", 
"Die neuen Preise wurden vom Altis Markt festgelegt..." 
]; 
 
 
 
DYNMARKET_Items_Groups = 
[ 
["Legal", 
[ 
["apple",-1,10,50], 
["peach",-1,30,100], 
["kohle",-1,310,1340], 
["weinp",-1,750,1820], 
["kies",-1,750,1670], 
["oilp",-1,1210,4160], 
["diamondc",-1,2370,5950], 
["salt_r",-1,1100,2860], 
["glass",-1,1100,3705], 
["cement",-1,850,2495], 
["zigarettenp",-1,1260,3480], 
["plastik",-1,3000,6940] 
 
], 
0.4 
], 
["Metall", 
[ 
["iron_r",-1,1100,4095], 
["copper_r",-1,1450,3705], 
["silberp",-1,1770,3830], 
["goldp",-1,2530,5450], 
["stahl",-1,4250,7820], 
["sschmuck",-1,4500,8900], 
["gschmuck",-1,5000,9600] 
 
], 
0.4 
], 
["Illegal",  
[ 
["xtc",1,1350,3380], 
["methp",1,1200,4400], 
["marijuana",1,2000,4475], 
["cocainep",1,1020,4150], 
["heroinp",1,770,3200], 
["zigarrenp",1,1620,5070], 
["lsdp",1,1430,3580], 
["sprengstoffp",1,2350,7000], 
["sense",1,6500,12000], 
["schnaps",1,6000,21500], 
["turtle",1,10000,22000] 
 
 
], 
0.4 
] 
]; 
 
 
 
DYNMARKET_Items_ToTrack        =  
[ 
["apple",50], 
["heroinu",1850], 
["salema",45], 
["ornate",40], 
["mackerel",175], 
["tuna",700], 
["mullet",250], 
["catshark",300], 
["rabbit",65], 
["water",5], 
["coffee",5], 
["turtlesoup",1000], 
["donuts",60], 
["tbacon",25], 
["lockpick",75], 
["pickaxe",750], 
["redgull",200], 
["peach",55], 
["cocaine",3000], 
["fuelF",500], 
["spikeStrip",100], 
["barrier",200], 
["barricade",200], 
["strahler",200], 
["goldbar",45000], 
["bauma",100], 
["mais",100], 
["zucker",100], 
["brenn",100], 
["schaufel",100], 
["vase",1450], 
["muenze",2950], 
["schmuck",9800], 
["silberu",400], 
["zigarettenu",400], 
["weinu",400], 
 
["sprengstoffu",400], 
["zigarrenu",400], 
["lsdu",400], 
["goldu",400], 
["methu",400], 
["bauschaufel",100], 
["kerosin",400], 
["zipties",400], 
["baumwolle",400], 
 
 
 
 
["kohle",790], 
["kies",1200], 
["weinp",1400], 
["cement",1950], 
["salt_r",2200], 
["zigarettenp",2680], 
["glass",2850], 
["copper_r",2850], 
["silberp",2850], 
["iron_r",3150], 
["oilp",3200], 
["diamond",3450], 
["goldp",4300], 
["diamondc",4600], 
["plastik",5800], 
["stahl",6640], 
["sschmuck",7800], 
["gschmuck",8750], 
 
 
["heroinp",2450], 
["xtc",2600], 
["lsdp",2750], 
["methp",3200], 
["marijuana",3440], 
["cocainep",3250], 
["zigarrenp",3900], 
["sprengstoffp",5460], 
["sense",9500], 
["schnaps",16250], 
["turtle",16500] 
]; 
 
 
 
 
 
DYNMARKET_Items_CurrentPriceArr = []; 
DYNMARKET_sellarraycopy = DYNMARKET_Items_ToTrack; 
DYNMARKET_Serveruptime = (DYNMARKET_Serveruptime * 3600) - 300; 
{ 
_currentArray = _x; 
DYNMARKET_Items_CurrentPriceArr pushBack [_currentArray select 0,_currentArray select 1,0]; 
} forEach DYNMARKET_Items_ToTrack; 
publicVariable "DYNMARKET_UserNotification"; 
publicVariable "DYNMARKET_UserNotification_Text"; 
if (DYNMARKET_UseExternalDatabase) then {[1] call TON_fnc_HandleDB;}; 
DYNMARKET_UpdateCount = 0; 
if (DYNMARKET_UseExternalDatabase) then { 
[] spawn { 
sleep DYNMARKET_Serveruptime; 
diag_log "### DYNMARKET >> CURRENT PRICES ARE BEING WRITTEN TO THE DATABASE    ###"; 
diag_log "### DYNMARKET >> AS PLANNED, AWAITING RESULT...                      ###"; 
[0] call TON_fnc_HandleDB; 
}; 
}; 
sleep 5; 
[] call TON_fnc_sleeper; 
