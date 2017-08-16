private ["_gear","_house","_query"]; 
 
_house = _this select 0; 
 
_gear = _this select 1; 
_waffen = [_gear,0,[],[[]]] call BIS_fnc_param; 
_magazine = [_gear,1,[],[[]]] call BIS_fnc_param; 
_items = [_gear,2,[],[[]]] call BIS_fnc_param; 
_uniform = [_gear,3,[],[[]]] call BIS_fnc_param; 
_vest = [_gear,4,[],[[]]] call BIS_fnc_param; 
_backpack = [_gear,5,[],[[]]] call BIS_fnc_param; 
_headgear = [_gear,6,[],[[]]] call BIS_fnc_param; 
 
_query = format["UPDATE hausinventar SET waffen='%1', magazine='%2', items='%3', uniform='%4',vest='%5', backpack='%6',headgear='%7' WHERE name='%8'",_waffen,_magazine,_items,_uniform,_vest,_backpack,_headgear,_house]; 
[_query,1] call DB_fnc_asyncCall; 
 
_text = format ["*** Haus Inventar Update | Waffen: %1 | Magazine: %2 | Items: %3 | Uniformen: %4 | Westen: %5 | Rucksäcke: %6 | Mützen: %7 | Haus: %8 |",_waffen,_magazine,_items,_uniform,_vest,_backpack,_headgear,_house]; 
[3,_text]call TON_fnc_log; 
