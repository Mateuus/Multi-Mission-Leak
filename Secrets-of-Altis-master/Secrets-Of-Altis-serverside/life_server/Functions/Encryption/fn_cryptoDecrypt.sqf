 
 
 
 
 
private["_keyIndex"]; 
Crypt_finish = false; 
 
_list = [ 
[35,"life_fnc_FEykxDjBMLEfCMJy45Z1uP1tD","life_fnc_ladebildschirm","call life_fnc_ladebildschirm;"], 
[35,"life_fnc_JG2CufyUQMPxJRZdCRwWvUJmE","life_fnc_initialization",""], 
[35,"life_fnc_K2hUrgw4yWNpr7husft7v4Zkj","life_fnc_init","[] spawn life_fnc_init;"], 
[35,"life_fnc_4lwyQ58yGET4wkCrTkcp7xPr4","life_fnc_keyBoardhandler","waitUntil {!(isNull (findDisplay 46))};(findDisplay 46) displayAddEventHandler ['KeyDown', '_this call life_fnc_keyBoardHandler'];"], 
[35,"life_fnc_QFi487K8kb6660aG9wCF6lVpY","life_fnc_anfang","WaitUntil{UIsleep 1; !life_loading}; call life_fnc_anfang;"], 
[35,"life_fnc_SI6bOc7Yo8o5WVuKHgDCCnd9t","life_fnc_callAction",""], 
[35,"life_fnc_vxD93BOAnpKKWJhygRYOLkYxx","life_fnc_dialCall",""], 
[35,"life_fnc_iivbt2MSXEtS5nyIDI3FESjRP","life_fnc_erfolgerhalten",""], 
[35,"life_fnc_WU1BnhGNjvBNJNVsxCur30Gx6","life_fnc_gegenstanderhalten",""], 
[35,"life_fnc_wvcYpftBcZcXNS52ake6f4tKi","life_fnc_hangup",""], 
[35,"life_fnc_OK6MG6146wSXrPodM33mcCqS1","life_fnc_notizen",""], 
[35,"life_fnc_sNd3T9ytOU6VeavcsHSsQNC5s","life_fnc_phone",""], 
[35,"life_fnc_Ay2lhVFs2GFX6mxpshRCYcUMY","life_fnc_phonebooth",""], 
[35,"life_fnc_JPQBkE68YdLjChg1xDsMde0On","life_fnc_tablet",""], 
[35,"life_fnc_OmxR74OapcbWJjEX8lNCjDDAN","life_fnc_selfie",""], 
[35,"life_fnc_P6rQewfscyjagtcvnAqijWXTB","life_fnc_kennzeichen",""], 
[35,"life_fnc_xCSZ5U7bbgXUiKMusoR7RDcw6","life_fnc_weaponShopSelection",""], 
[35,"life_fnc_CsLejg6Dlw9gNhEA6k9N7HZrF","life_fnc_timemachine","life_mission_completed = true"] 
]; 
 
{ 
_this spawn compile format[' 
_key = toArray _this; 
_keyLength = (count _key)-1;  
_item = %2; 
_num = %1; 
_number = 0; 
_keyIndex = 0; 
_decrypted = []; 
_salt = (_item splitString "_"); 
_salt = _salt select ((count _salt) - 1); 
_salt = toArray _salt; 
_saltLength = (count _salt)-1; 
_saltLength = _saltLength; 
_saltIndex = 0; 
_content = call (call compile %2); 
for "_i" from 0 to count _content -1 do { 
if(_keyIndex == _keyLength)then{_keyIndex = 0;}; 
if(_saltIndex == _saltLength)then{_saltIndex = 0;}; 
if((_key select _keyIndex) mod 2 != 0)then{ 
_number = (_key select _keyIndex) + (_i mod _num) - (_salt select _saltIndex); 
}else{ 
_number = (_key select _keyIndex) - (_i mod _num) + (_salt select _saltIndex); 
}; 
_char = _content select _i; 
_char = _char - _number;  
_decrypted pushBack _char; 
_keyIndex = _keyIndex + 1;  
_saltIndex = _saltIndex + 1; 
}; 
%3 = compileFinal toString _decrypted; 
%4 
',_x select 0, str (_x select 1),_x select 2,_x select 3]; 
} forEach _list; 
 
Crypt_finish = true;