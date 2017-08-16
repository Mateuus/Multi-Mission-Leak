if(life_adminlevel < 1) exitWith {hint "You are not an admin!";};
private["_msg","_to"];
_msg = ctrlText 3003;
_to = call compile format["%1",(lbData[3004,(lbCurSel 3004)])];
if(isNull _to) exitWith {};
if(_msg == "") exitWith {hint "You must enter a message to send!";};

[[_msg,name player,3],"life_fnc_clientMessage",_to,false] spawn life_fnc_MP;
[] call life_fnc_cellphone;
hint format["Admin Message Sent To: %1 - Message: %2",name _to,_msg];