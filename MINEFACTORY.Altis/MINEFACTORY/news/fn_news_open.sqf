/*

	Author Shinji
	Öffnet die News Paper des Servers...

*/
_headline1 = [_this,0,0,["Fehler"]] call BIS_fnc_param;
_headline2 = [_this,1,0,["Fehler"]] call BIS_fnc_param;
_text1 = [_this,2,0,["Fehler"]] call BIS_fnc_param;
_text2 = [_this,3,0,["Fehler"]] call BIS_fnc_param;

_ok = createDialog "mp_news_paper";
disableSerialization;
waitUntil {!isNull (findDisplay 8180)};
_display = findDisplay 8180;

(_display displayCtrl 8182) ctrlSetStructuredText (parseText format["<t><t shadow='false' size='1.25' font='TahomaB' color='#000000'>%1</t></t>", _headline1]);
(_display displayCtrl 8184) ctrlSetStructuredText (parseText format["<t><t shadow='false' size='1.25' font='TahomaB' color='#000000'>%1</t></t>", _headline2]);
(_display displayCtrl 8183) ctrlSetStructuredText (parseText format["<t><t shadow='false' color='#000000'>%1</t></t>", _text1]);
(_display displayCtrl 8185) ctrlSetStructuredText (parseText format["<t><t shadow='false' color='#000000'>%1</t></t>", _text2]);
//[] spawn DB_fnc_news;


waitUntil { !dialog };