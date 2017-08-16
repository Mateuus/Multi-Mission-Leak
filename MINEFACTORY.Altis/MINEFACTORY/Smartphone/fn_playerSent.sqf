/*

	Author Shinji
	Triggers if player sends the message from the new message system to another player...

*/

if (isnil "player_Send_message") then {
	player_Send_message = false;
};

if (player_Send_message) exitwith { hint "Bitte warte einen Moment bevor du eine weitere Nachricht schickst."; };

private["_mode","_reciever","_message","_index","_pos","_recieverTxt"];
_mode = [_this,0,3,[3]] call BIS_fnc_param;

_reciever = lbCurSel 2100;
_message = ctrlText 1400;
_recieverTxt = ctrlText 2100;

disableSerialization;
_display = findDisplay 10000;
_index =  cbChecked (_display displayCtrl 2800);
 

if ((lbText [2100,_reciever]) == profilename) exitwith {};

_sent = false;

if (!_index) then {
	_pos = [];
} else {
	_pos = getpos player;
};
if (_message == "" OR _message == ("Nachricht eingeben...")) exitwith {};

switch (_mode) do {
	case 0: {
		if (_reciever == -1 OR (lbText [2100,_reciever]) == "") exitwith {hint "Bitte füge einen Empfänger hinzu.";};	
		
		[_mode, (lbText [2100,_reciever]),_message,_pos, profileName] remoteExec ["life_fnc_recieveMessage",0];
		
		_sent = true;
		
		hint parseText format ["Deine Nachricht an <t color='#CD2B2B'>%1</t> ging soeben raus...", (lbText [2100,_reciever])];	
	};
	default {
		hint "Something went wrong... case sensitive has failed...!";			
	};
};

if (_sent) then {	

	
		
	player_Send_message = true; /*for trolls who think they can troll the other players with message dumps -.-*/
	sleep 5;
	player_Send_message = false;
};
