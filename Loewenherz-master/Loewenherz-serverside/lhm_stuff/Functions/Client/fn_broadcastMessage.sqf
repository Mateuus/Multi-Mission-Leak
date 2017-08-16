/* 
    Author: Blackd0g 
    File: fn_broadcastMessage.sqf 
 
    Description: 
    Recieves a news broadcast 
 
    Parameters: 
    _this select 1 - Message String 
 _this select 2 - send by Name String 
 
    Returns: 
    Nothing 
*/ 
if(isServer) exitWith {}; 
disableSerialization; 
_message = param[0,"",[""]]; 
_from = param[1,"",[""]]; 
 
if(_from == "") exitWith {}; 
if(_message == "") exitWith {}; 
 
player say3D "lh_news_flash"; 
 
sleep 2.5; 
 
_maxChars = 75; 
if(count _message > _maxChars) then 
{ 
 for "_i" from 1 to 3 do 
 { 
  for "_i" from 0 to round((count _message) / _maxChars) do 
  { 
   _tmpMessage = _message select [_i * _maxChars,(_i + 1) * _maxChars]; 
 
   [ 
    parseText format [ 
     " 
      <t align='center'><t size='4'><img image='core\Textures\icons\misc
ewsflash.paa' /></t></t><br/><br/> 
      <t align='center' size='1'>%1</t> 
     " 
     , _tmpMessage], 
    [-0.7,0,0.3,0.5], 
    nil, 
    10, 
    0.9, 
    0 
   ] call BIS_fnc_textTiles; 
  }; 
  sleep 1; 
 }; 
} 
else 
{ 
 [ 
  parseText format [ 
   " 
    <t align='center'><t size='4'><img image='core\Textures\icons\misc
ewsflash.paa' /></t></t><br/><br/> 
    <t align='center' size='1'>%1</t> 
   " 
   , _message], 
  [-0.7,0,0.3,0.5], 
  nil, 
  60, 
  0.9, 
  0 
 ] call BIS_fnc_textTiles; 
}; 
 
systemChat format["gesendet von: %1", _from];;