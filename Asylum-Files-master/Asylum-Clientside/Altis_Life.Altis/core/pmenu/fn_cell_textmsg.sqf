private["_msg","_to"];
ctrlShow[3015,false];
_msg = ctrlText 3003;
if(lbCurSel 3004 == -1) exitWith {hint "You must select a player you are sending the text to!"; ctrlShow[3015,true];};
_to = call compile format["%1",(lbData[3004,(lbCurSel 3004)])];
if(isNull _to) exitWith {ctrlShow[3015,true];};
if(isNil "_to") exitWith {ctrlShow[3015,true];};
if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[3015,true];};
if([_msg] call KRON_StrLen > 200) exitWith {hint "The message you entered is too long to send!"};
if(side _to == west && life_is_arrested) exitWith {titleText["Prison inmates are not allowed to message officers of the law!","PLAIN"];ctrlShow[3016,true];};

[[_msg,name player,0],"life_fnc_clientMessage",_to,false] spawn life_fnc_MP;
[] call life_fnc_cellphone;
hint format["You sent %1 a message: %2",name _to,_msg];
ctrlShow[3015,true];