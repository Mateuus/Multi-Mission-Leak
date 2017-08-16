private ["_start","_musik","_CurSel"];
_start = [_this,0,0,[0]] call BIS_fnc_param;
_musik = [_this,1,false,[false]] call BIS_fnc_param;

_CurSel = 1;
if(_musik) then {_CurSel = 12;};

//InfoMenus
if(_start isEqualTo 0) exitWith {
disableSerialization;
createDialog "infoMenu";
switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};

_InfoMenus = ((findDisplay 41500) displayCtrl 2300);
lbClear _InfoMenus;

_InfoMenus lbAdd "Allgemeines";lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0.694,0.141,1]];
_InfoMenus lbAdd "Server Informationen"; lbSetValue [2300, (lbSize _InfoMenus)-1, 1];
_InfoMenus lbAdd "Changelog"; lbSetValue [2300, (lbSize _InfoMenus)-1, 2];lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0,0.082,1]];
_InfoMenus lbSetCurSel _CurSel;
};

//Infos
if(_start isEqualTo 1) exitWith {
private ["_index","_infoText"];
_index = ((findDisplay 41500) displayCtrl 2300) lbValue (lbCurSel 2300);

if(_index isEqualTo 0) exitWith {};


_infoText = call {
//Server
if(_index isEqualTo 1) exitWith {
"Altis Life Server<br/>
<t color='#FFB124'>Name:</t> Nextgeneration Life<br/>
<t color='#FFB124'>IP:</t> join.Nextgeneration-life.de<br/>
<t color='#FFB124'>Port:</t> 2302<br/><br/>
<t color='#FFB124'>Direktlinks:</t><br/>
<a href='ts3server://ts.Nextgeneration-life.de?port=9987'>Teamspeak: Ts.Nextgeneration-life.de</a><br/>
<a href='http://Nextgeneration-life.de'>Homepage: www.Nextgeneration-life.de</a><br/><br/>
Restart<br/>
<t color='#FFB124'>0:00, 6:00, 12:00, 16:00, 24:00</t>
";
};

//Changelogs
if(_index isEqualTo 2) exitWith {
"<t size='1.2px' align='center' color='#FFB124'>Bugs bitte im Forum melden</t><br/>
<t align='center' color='#FFB124'>Das kostet nichts und verbessert euer Gameplay</t><br/><br/>

<t align='center' color='#FF0000'>Wenn zu einem Update nichts im Changelog steht, dann wurden nur Bugfixes und/oder Performance Sachen gemacht.</t><br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V1 Patch 1</t><br/>
Server Erstellt<br/>
";
};

};

//Add Infos
((findDisplay 41500) displayCtrl 2304) ctrlSetStructuredText parseText ("<t size='0.8'>" + _infoText);
};
[] spawn life_fnc_InfoMenu;