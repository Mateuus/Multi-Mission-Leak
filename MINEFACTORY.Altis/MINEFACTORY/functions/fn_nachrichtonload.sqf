/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/

private["_nachricht","_nachrichtOben","_nachrichtObenPic"];
disableSerialization;
_nachricht = uiNameSpace getVariable ["Nachricht",displayNull];
_nachrichtOben = _nachricht displayCtrl 80501;
_nachrichtObenPic = _nachricht displayCtrl 80511;


_nachrichtOben ctrlSetFade 1;
_nachrichtOben ctrlCommit 0;
_nachrichtObenPic ctrlSetFade 1;
_nachrichtObenPic ctrlCommit 0;