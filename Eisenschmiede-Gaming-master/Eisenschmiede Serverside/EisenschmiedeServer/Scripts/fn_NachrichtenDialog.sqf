disableSerialization;
params
[
	["_display",displayNull,[displayNull]]
];

_control = _display ctrlCreate ["RscPicture",1212];
_control ctrlSetText "Images\Logos\EisenschmiedeNachricht.paa";
_control ctrlSetPosition [0.175,0.28,0.675,0.46];
_control ctrlCommit 0;
_control ctrlSetPosition [-0.2,0.04,1.375,0.9];
_control ctrlCommit 0.4;

waitUntil {ctrlCommitted _control};

_InfoBtn = _display ctrlCreate ["RscStructuredText",1313];
_InfoBtn ctrlSetPosition [-0.2,0.948,0.175,0.04];
_InfoBtn ctrlSetFont "PuristaSemiBold";
_InfoBtn ctrlSetBackgroundColor [0,0,0,0.8];
_InfoBtn ctrlSetToolTip ES_Nachricht;
_InfoBtn ctrlSetStructuredText parseText format["<t colorLink='%1'><a href='%2'>>KLICK MICH!</a></t>", ES_NachrichtFarbe, ES_NachrichtLink]; 
_InfoBtn ctrlCommit 0;

_closeBtn = _display ctrlCreate ["RscButtonMenu",1414];
_closeBtn ctrlSetFont "PuristaSemiBold";
_closeBtn ctrlSetPosition [1.0025,0.948,0.175,0.04];
_closeBtn ctrlSetText ">Schliessen ";
_closeBtn ctrlSetTextColor [0.8,0,0,1];
_closeBtn ctrlSetBackgroundColor [0,0,0,0.8];
_closeBtn buttonSetAction "closeDialog 0";
_closeBtn ctrlCommit 0;