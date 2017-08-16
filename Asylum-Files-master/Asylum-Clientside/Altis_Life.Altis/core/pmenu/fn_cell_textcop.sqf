private["_msg","_to"];
ctrlShow[3016,false];
_msg = ctrlText 3003;
_to = "The Police";
if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[3016,true];};
if([_msg] call KRON_StrLen > 200) exitWith {hint "The message you entered is too long to send!"};
if(life_is_arrested) exitWith {titleText["Prison inmates are not allowed to message officers of the law!","PLAIN"];ctrlShow[3016,true];};

[[_msg,name player,1],"life_fnc_clientMessage",true,false] spawn life_fnc_MP;
[] call life_fnc_cellphone;
hint format["You sent %1 a message: %2",_to,_msg];
[[name player, position player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
ctrlShow[3016,true];
[[ceil (random 5000), format["%1 911: %2", name player, _msg], 1500, 8, 2, position player, getPlayerUID player],"life_fnc_createDispatch",false,false] spawn life_fnc_MP;