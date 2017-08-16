/*#######################################
#	MuellInfo Cfg						#
#	Author: [MdF] Feindflug				#
#######################################*/

private["_display","_stadt","_summe","_distance","_farbe"];
if(playerSide != civilian) exitWith {hint "Du kannst die Funktion nur als Zivilist nutzen!";};
if(player getVariable "MuellMarker" >= muellMarkMAX) exitWith {hint format["Du hast schon %1 Markierungen auf der Karte!",muellMarkMAX];};
if(!createDialog "Muell_Infomenue") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?

waitUntil {!isNull (findDisplay 99992)};
disableSerialization;
_display = findDisplay 99992;
_stadt = _display displayCtrl 99993;
_distance = _display displayCtrl 99994;
_farbe = _display displayCtrl 99995;
_summe = _display displayCtrl 99996;
_muellC = muellSetContainers;

// Dropdown Menue mit Städten füllen
lbClear _stadt;
{
	_stadt lbAdd format["%1", _x select 0];
	_stadt lbSetData [(lbSize _stadt)-1,str(_x select 1)];
} foreach (_muellC select 0);

// Dropdown Menue mit Distance in Metern füllen
lbClear _distance;
{
	_distance lbAdd format["%1", _x select 0];
	_distance lbSetData [(lbSize _distance)-1,str[(_x select 1),(_x select 2)]];
} foreach (_muellC select 1);

// Dropdown Menue mit Marker Farbe füllen
lbClear _farbe;
{
	_farbe lbAdd format["%1", _x select 0];
	_farbe lbSetData [(lbSize _farbe)-1,str[(_x select 1),(_x select 2)]];
} foreach (_muellC select 2);