/* 

	Author Shinji
	Kleiner Slamom am anfang, danach nur noch auf zeit zum ende fahren...
*/
private["_check1","_check2","_check3","_check4","_check5","_check6"];

hint "Deine Aufgabe ist es, den Slalom anzufahren. Sobald du alle 5 Checkpoints erreicht hast, musst du nur noch in der gegebenen Zeit das Ziel erreichen!";

sleep 10;

_sec = 0;
_min = 0;
license_prog = true;
license_granted = false;
_waypoint = false;

_check1 = false; _check2 = false; _check3 = false; _check4 = false; _check5 = false; _check6 = false;

_owners = getPlayerUID player;
vehicle1 = "C_Boat_Civil_01_F" createVehicle (getMarkerPos "boating_start");
vehicle1 setVariable["vehicle_info_owners",_owners,true];


player moveindriver vehicle1;
hint "Los gehts!!!";

sleep 2;

while {license_prog} do
{
		if (!_waypoint) then {
			if ((player distance (getmarkerpos "boating")) < 7) then {
				_check1 = true; titleText ["Checkpoint Reached...", "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_1")) < 7) then {
				_check2 = true; titleText ["Checkpoint Reached...", "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_2")) < 7) then {
				_check3 = true; titleText ["Checkpoint Reached...", "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_3")) < 7) then {
				_check4 = true; titleText ["Checkpoint Reached...", "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_4")) < 7) then {
				_check5 = true; titleText ["Checkpoint Reached...", "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_5")) < 7) then {
				_check6 = true; titleText ["Checkpoint Reached...", "PLAIN"];
			};
		};
			if ( _check1 && _check2 && _check3 && _check4 && _check5 && _check6) then {	
	
				if (!_waypoint) then {
					_waypoint = true;
					ziel_marker= createMarkerLocal ["auftrags_ziel_marker", position player ];
					"auftrags_ziel_marker" setMarkerBrushLocal "Cross";
					"auftrags_ziel_marker" setMarkerColorLocal "ColorRed";
					"auftrags_ziel_marker" setMarkerPosLocal (getmarkerpos "boating_end");
					"auftrags_ziel_marker" setMarkerTypeLocal "hd_WARNING"; 
					"auftrags_ziel_marker" setMarkerTextLocal "Dein Ziel befindet sich hier";
					"auftrags_ziel_marker" setMarkerSizeLocal [1, 1];
					titleText ["DEIN ZIEL BEFINDET SICH NUN AUF DER KARTE! Am Strand, Im Norden von hier an...", "PLAIN"];
				};
				
				if ((player distance (getmarkerpos "boating_end")) < 10) then {
					license_granted = true; titleText ["GOAL Reached...", "PLAIN"];
				};			
			};
			if (license_granted) exitwith {};
			_sec = _sec + 1;
			if (_sec >= 60) then {
				_sec = 0;
				_min = _min + 1;
			};
			if (_min >= 3) exitwith {
				license_prog = false;			
			};
			hintsilent format["Time gone... %1 min- %2 sec / 3 min.",  _min, _sec];
		sleep 1;
};
									
sleep 5;
if (license_granted) then {
	
	titleText ["Lizenz erhalten, Glueckwunsch!", "PLAIN"];	
	license_civ_boat = true;
	playsound "made_it";

 } else {

	hint "Du hast die Schule nicht beenden koennen, die Zeit ist abgelaufen oder aber du hast nicht alle Checkpoints erreicht! Versuchs nochmal...";

};

	deleteMarkerLocal "auftrags_ziel_marker";
	license_boating_in_use = false;
	publicVariable "license_boating_in_use"; 

deletevehicle vehicle1; 
sleep 0.5;
player setPos current_position_p;