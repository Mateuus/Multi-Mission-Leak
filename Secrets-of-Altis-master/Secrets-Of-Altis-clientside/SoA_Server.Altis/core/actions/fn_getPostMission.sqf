
if(isNull objectParent player) exitWith {hint "Du benötigst einen Altis Postwagen für einen Paketlieferauftrag!"};
if((typeOf vehicle player) != "C_Van_01_box_F" && (vehicle player getVariable "Life_VEH_color") != 7) exitWith {hint "Du benötigst einen Altis Postwagen für einen Paketlieferauftrag!"};
if(life_postdone) exitWith {hint "Du hast vor Kurzem schon einen Auftrag angenommen, du kannst nur jede halbe Stunde einen Auftrag annehmen!"};

[] spawn {
	life_postdone = true;
	sleep (45 * 60);
	life_postdone = false;
};

_rnd = [];
life_postpaket = 3;
postmarkers = [];

_rnd1 = [post_1,post_2,post_3,post_4,post_5] call Bis_fnc_SelectRandom;
_rnd pushback _rnd1;

_rnd2 = [post_6,post_7,post_8,post_9,post_10] call Bis_fnc_SelectRandom;
_rnd pushback _rnd2;

_rnd3 = [post_11,post_12,post_13,post_14,post_15] call Bis_fnc_SelectRandom;
_rnd pushback _rnd3;

{
	_x addAction["<t color='#00FF00'>Paket abliefern</t>",life_fnc_postMissionFinish];
} foreach _rnd;

closedialog 0; 
sleep 0.01; 
closedialog 0;
titleText["Deine Lieferziele wurden zugewiesen, schau auf die Karte um zu sehen, wo du hin musst!","PLAIN"];

{
	_marker = createMarkerLocal [format["%1_postmarker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorYellow";
	_marker setMarkerTypeLocal "mil_warning";
	_marker setMarkerTextLocal " Paket abliefern!";
	_marker setMarkerSizeLocal [2,2];

	postmarkers pushBack _marker;
} foreach _rnd;

//timer starten
disableSerialization;

30 cutRsc ["life_post","PLAIN"];
_display = uiNamespace getVariable "life_post";
_paketfirma = _display displayCtrl 601;
_pakettext = _display displayCtrl 602;
_paketfirma ctrlSettext "Altis Post AG";
_pakettext ctrlSetText format["%1/3 Paket(e) übrig",life_postpaket];

6 cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
timepost = time + (45 * 60);
while {true} do {
	//if(round(timepost - time) < 1) exitWith {};
	if(life_postpaket == 0) exitWith {};
	_timer ctrlSetText format["%1",[(timepost - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};

6 cutFadeOut 1;
30 cutFadeOut 1;
{deleteMarkerLocal _x } foreach postmarkers;