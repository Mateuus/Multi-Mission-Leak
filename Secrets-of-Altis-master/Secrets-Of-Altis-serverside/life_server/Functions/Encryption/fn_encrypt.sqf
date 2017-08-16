 
 
 
 
 
 
 
 
 
 
 
 
private["_number","_content","_multiLine","_singleLine","_crypt","_n","_salt","_tmp","_fncName","_stack"]; 
_key = toArray (_this select 0);  
_filesToLoad = [""]; 
_content = switch(_this select 4)do{ 
case "file":{ 
_fncName = _this select 3;   
_fncName = _fncName splitString "\_."; 
_fncName = "life_fnc_" + (_fncName select ((count _fncName)-2));    
toArray loadFile (_this select 3);   
}; 
case "function": { 
_fncName = _this select 3; 
toArray str (missionnamespace getVariable[(_this select 3),""]) 
}; 
case "string":{ 
_fncName = ""; 
toArray (_this select 3); 
}; 
case "folder":{ 
_filesToLoad = FilesToEncrypt; 
}; 
}; 
 
{ 
if!(_filesToLoad isEqualTo [""])then{ 
_file = _x; 
_fncName = (_file splitString "_.") select 1; 
_fncName = "life_fnc_" + _fncName; 
_content = toArray (loadFile ("Plain_Functions\" + _file)); 
}; 
_singleLine = false; 
_multiLine = false; 
_num = (_this select 2); 
_keyLength = (count _key)-1; 
_keyIndex = 0;  
private["_salt"];  
_salt = _this select 1; 
switch(typeName _salt)do{ 
case "SCALAR" :{  
_tmp = []; 
for "_i" from 1 to _salt do { 
RAGE = true;  
while{RAGE}do{ 
_n = floor (random 122);        
if(!(_n in [46,47,58,59,60,61,62,63,64,91,92,93,94,95,96]) AND _n > 45)then{RAGE = false}; 
};    
_tmp pushBack _n; 
}; 
_salt = _tmp; 
}; 
case "STRING" :{ 
_salt = toArray _salt; 
}; 
default{ 
_salt = [46,90,68,78,89,56,46]; 
}; 
}; 
_saltLength = (count _salt)-1; 
_saltIndex = 0;  
_state = ""; 
_stack = 0; 
_crypt = [];  
private["_number"];  
_letterCount = 0; 
for "_i" from 0 to count _content -1 do { 
_item = _content select _i;  
switch (_state) do {  
case "/*":{if(_item == 42)then {_state = "/**";};}; 
case "/**":{if(_item != 47)then {_state = "/*"}else{_state = "";};}; 
case "//":{if(_item == 10)then{_state = "";_stack = 0;};}; 
case "/":{ 
switch (_item) do { 
case 47: {_state = "//";}; 
case 42: {_state = "/*";}; 
default{ 
_state = ""; 
_crypt pushBack _stack; 
_keyIndex = _keyIndex + 1;  
_saltIndex = _saltIndex + 1;  
_letterCount = _letterCount +1; 
_stack = 0; 
 
if(_keyIndex == _keyLength)then{_keyIndex = 0;}; 
if(_saltIndex == _saltLength)then{_saltIndex = 0;}; 
if((_key select _keyIndex) mod 2 != 0)then{ 
_number = (_key select _keyIndex) + (_letterCount mod _num) - (_salt select _saltIndex); 
}else{ 
_number = (_key select _keyIndex) - (_letterCount mod _num) + (_salt select _saltIndex); 
};          
_char = _item + _number;          
_crypt pushback _char;  
_keyIndex = _keyIndex + 1;  
_saltIndex = _saltIndex + 1;  
_letterCount = _letterCount +1; 
}; 
}; 
};    
default{          
if(_keyIndex == _keyLength)then{_keyIndex = 0;}; 
if(_saltIndex == _saltLength)then{_saltIndex = 0;}; 
if((_key select _keyIndex) mod 2 != 0)then{ 
_number = (_key select _keyIndex) + (_letterCount mod _num) - (_salt select _saltIndex); 
}else{ 
_number = (_key select _keyIndex) - (_letterCount mod _num) + (_salt select _saltIndex); 
};       
_char = _item + _number; 
if(_item != 47)then{         
_crypt pushback _char;  
_keyIndex = _keyIndex + 1;  
_saltIndex = _saltIndex + 1;  
_letterCount = _letterCount +1; 
}else{ 
_stack = _char; 
_state = "/"; 
}; 
};   
};    
}; 
"make_file" callExtension "D:\Arma3\Test\mpmissions\SoA_Server.Altis\core\crypt\fn_" + (toString _salt) + ".sqf|" + str _crypt;  
if(isNil"Rage_Files") then { 
Rage_Files = []; 
rage_EncryptedList = []; 
}; 
{Rage_Files pushBack _x} forEach (toArray format["class %1 {};",(toString _salt)]); 
Rage_files pushBack 10;  
 
{rage_EncryptedList pushBack _x} forEach (toArray format['[%3,"life_fnc_%1","%2",""],',toString _salt,_fncName,_num]);   
rage_EncryptedList pushBack 10;  
} forEach _filesToLoad; 
 
"make_file" callExtension "D:\Arma3\Test\mpmissions\SoA_Server.Altis\core\crypt\encryptedFiles.sqf|" + toString Rage_files + "


" + toString rage_EncryptedList;  
 
 
