/* 
 File: fn_starttransporter.sqf 
 Author: Bloodwyn 
 
 Description: 
 Sec initialiazes the Moneytransporter+Marks the Moneytransporter with it´s Money. Triggers the end, if it got destroyed #crazy 
 
 Usage of this file is restricted to permitted servers e.g. Loewenherz. 
 Ask us for permission to use this file: www.lhzp.de 
*/ 
 
 
 
private ["_mtransport","_con","_refstations","_marker","_y","_MTMarkerSEC","_killed","_posMoney","_fire","_smoke","_value1","_item","_obj"]; 
if(playersNumber east < 1) exitWith{Hint "Es müssen mindestens 3 LSA Agenten im Dienst sein um den Transport zu starten";}; 
if(isServer) then { 
 
SECRadio1 setVariable ["Mtrans",true,true]; 
 
 
//verschiedener hint für jede Fraktion 
["Die LSA hat einen Geldtransporter gestartet! Der Transporter holt die Einnahemen an den Tankstellen ab. Überfalle und zerstöre ihn, um an das Geld zu kommen!","lhm_fnc_hint",civilian,FALSE] call lhm_fnc_mp; 
["Einer eurer Männer hat einen Geldtransport gestartet! Verteidige ihn mit allen Mitteln und sammle das Geld der markierten Tankstellen ein! Wenn du den Transporter zum Ausgangsort zurückbringst, erhältst du 30% des Geldes!","lhm_fnc_hint",east,FALSE] call lhm_fnc_mp; 
["Die LSA hat einen Geldtransporter gestartet. Die Polizisten halten sich weitgehend aus der Angelegenheit raus.","lhm_fnc_hint",west,FALSE] call lhm_fnc_mp; 
["Die LSA hat einen Geldtransporter gestartet! Du solltest in der Nähe des Transporters sehr Vorsichtig sein!","lhm_fnc_hint",independent,FALSE] call lhm_fnc_mp; 
 
//Geldtransporter und Container spawnen 
_mtransport="I_Truck_02_transport_F" createvehicle [0,0,0]; 
_mtransport setpos getMarkerpos "sec_car_spawn_2"; 
_mtransport setObjectTextureGlobal [0,"core\textures\vehicles\zamak\sec_zamak_front.jpg"]; 
_mtransport setObjectTextureGlobal[1,""]; 
_con="Land_Cargo20_grey_F" createvehicle [0,0,0]; 
_con attachTo [_mtransport,[0,-1.5,0.45]]; 
_con setDir 90; 
_con setVariable ["Money", 0, true]; 
 
//Tankstellenmänner finden und initialisieren 
 
_refstations=[]; 
 
{if((_x getVariable ["realname","Hans"])=="Gas station attendant")then{_refstations pushBack _x;};}foreach entities "man"; 
 
 
//SEC Marker der Tankstellen setzten 
{ 
 [[format["gothic%1", _forEachIndex],"ColorBlue","hd_flag",position _x,"Target",false],"lhm_fnc_Marker",east,false] call lhm_fnc_mp; 
  _x setVariable ["refnum",(_forEachIndex),false] 
}foreach _refstations; 
 
 
 
//globaler Marker für den Transporter während Fahrt 
_marker= createMarker ["SecTMarker",[0,0,0]]; 
"SecTMarker" setMarkerType "hd_destroy"; 
"SecTMarker" setMarkerColor "ColorBlue"; 
 
 
//Transporter zerstört: 
TransporterMoney = 
{ 
 _mtransport = _this select 0; // the Transporter 
 _con= _this select 1; 
 SECRadio1 setVariable ["Mtrans",false,true]; 
  for "_i" from 0 to 7 do{ 
   _y=format["gothic%1",_i]; 
   [[_y,nil,nil,nil,nil,true],"lhm_fnc_Marker",east,true] call lhm_fnc_mp; 
  }; 
 detach _con; 
 _MTMarkerSEC = createMarker [format["mt_%1",(mapGridPosition _mtransport)], getPos _mtransport]; 
 _MTMarkerSEC setMarkerShape "ICON"; 
 _MTMarkerSEC setMarkerType "hd_warning"; 
 _MTMarkerSEC setMarkerColor "ColorRed"; 
 _MTMarkerSEC setMarkerText format["Transporterwrack: %1 Millionen $!",(_con getVariable "Money")/1000000]; 
 _posMoney = position _mtransport; 
 
 
 //_fire = createVehicle ["test_EmptyObjectForFireBig",_posMoney, [], 0, "NONE"]; // add Fire 
 sleep 1; 
 _smoke = createVehicle ["test_EmptyObjectForSmoke",_posMoney, [], 0, "NONE"]; // add Smoke 
 
 // Create wad of cash 
 for "_i" from 1 to 150 do 
 { 
  _value1 = (round ((_con getVariable "Money")/150)); 
  _item = "lhm_cash"; 
  _obj = "Land_Money_F" createVehicle _posMoney; 
  _obj setVariable["item",["money",_value1],true]; 
  sleep 6; 
 }; 
 deleteVehicle _con; 
 deleteVehicle _smoke; 
 deleteMarker _MTMarkerSEC; 
}; 
 
 
_mtransport addMPEventHandler ["mpkilled", 
{ 
 ["Der Geldtransporter wurde zerstört und das Geld kan in den nächsten Minuten geborgen werden!","lhm_fnc_hint",civilian,FALSE] call lhm_fnc_mp; 
 ["Der Geldtransport ist gescheitert. Halte dich von der Unglücksstelle fern!","lhm_fnc_hint",east,FALSE] call lhm_fnc_mp; 
 ["Der Geldtransporter wurde zerstört. Die Polizisten halten sich weitgehend aus der Angelegenheit raus.","lhm_fnc_hint",west,FALSE] call lhm_fnc_mp; 
 
 
 _mtransport1 = _this select 0; 
 
 _con = attachedObjects _mtransport1; 
 if (count(_con) == 0) exitwith {}; 
 _con = _con - [Objnull]; 
 _con = _con select 0; 
 [_mtransport1,_con] spawn TransporterMoney; 
} 
]; 
 
 
//aktualisierung des Markers und Einladen von Geld 
while{!isNull _mtransport} do { 
 
  "SecTMarker" setmarkerpos getpos _mtransport; 
  "SecTMarker" setMarkerText format["Geldtransporter: %1 Millionen $!",(_con getVariable "Money")/1000000]; 
  { 
   if((_mtransport distance _x)<30)then{ 
    _con setVariable ["Money",((_con getVariable "Money")+320000), true]; 
    [[format["gothic%1",_x getVariable "refnum"],nil,nil,nil,nil,true],"lhm_fnc_Marker",east,false] call lhm_fnc_mp; 
    _x setVariable ["refnum", nil]; 
    _refstations= _refstations-[_x]; 
    ["Geld eingeladen!","lhm_fnc_hint",east,FALSE] call lhm_fnc_mp; 
   }; 
  }foreach _refstations; 
  sleep 15; 
}; 
 
 
deleteMarker _marker; 
};