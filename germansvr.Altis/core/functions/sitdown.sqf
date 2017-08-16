//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                                   									//
//							  ALTIS VERSION By                      	//
//		                          Maxos                                 //
//		                                                                //
//1.Place a Camping Chair on the map.                                   //
//                                                                      //
//2.Add this to the Camping chair Init:                                 //
//this addAction ["<t color='#0099FF'>Hinsetzen</t>","core\functions\sitdown.sqf"]//
//                              4D6163526165                            //
//////////////////////////////////////////////////////////////////////////


_chair = _this select 0; 
_unit = _this select 1; 

_unit setPos (getPos _chair); 
_unit setDir ((getDir _chair) - 180); 
_unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) +1)];
sleep 0.2;
standup = _unit addaction ["<t color='#0099FF'>Aufstehen</t>","core\functions\standup.sqf"];
[[_unit, "Crew"], "life_fnc_sit"] spawn BIS_fnc_MP; 


