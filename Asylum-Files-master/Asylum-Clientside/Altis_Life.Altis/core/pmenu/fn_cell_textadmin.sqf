private["_msg","_to","_from"];
ctrlShow[3017,false];
_msg = ctrlText 3003;
_to = "The Admins";
if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[3017,true];};
if([_msg] call KRON_StrLen > 200) exitWith {hint "The message you entered is too long to send!"};

[[_msg,name player,2],"life_fnc_clientMessage",true,false] spawn life_fnc_MP;
[] call life_fnc_cellphone;
hint format["You sent %1 a message: %2",_to,_msg];
ctrlShow[3017,true];