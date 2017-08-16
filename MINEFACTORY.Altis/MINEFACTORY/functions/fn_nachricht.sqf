/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/

private["_nachricht","_nachrichtOben","_nachrichtObenPic","_text"];
_text = (_this select 0);

disableSerialization;
_nachricht = uiNameSpace getVariable ["Nachricht",displayNull];
_nachrichtOben = _nachricht displayCtrl 80501;
_nachrichtObenPic = _nachricht displayCtrl 80511;


if(_text != "") then
{
	if(NachrichtSleep == 0) then
	{
		_nachrichtOben ctrlSetFade 0;
		_nachrichtOben ctrlCommit 1;
		_nachrichtObenPic ctrlSetFade 0;
		_nachrichtObenPic ctrlCommit 1;
		_nachrichtOben ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_text];
				
		NachrichtSleep = 10;
		[] spawn
			{
				while{true} do {
				
				if(NachrichtSleep < 1) exitWith{Nachrichtbool = true};
				NachrichtSleep = NachrichtSleep - 1;
				sleep 1;
				};
			};
		
		waitUntil{Nachrichtbool};
		Nachrichtbool = false;
				
		_nachrichtOben ctrlSetFade 1;
		_nachrichtOben ctrlCommit 2;
		_nachrichtObenPic ctrlSetFade 1;
		_nachrichtObenPic ctrlCommit 2;
	} else {
		NachrichtSleep = 10;
		_nachrichtOben ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_text];
	};
};
