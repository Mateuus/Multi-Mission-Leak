//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                                                                      //
//                                                                      //
//1.Place a Camping Chair on the map.                                   //
//                                                                      //
//2.Add this to the Camping chair Init:                                 //
//this addAction ["Sit Down",life_fnc_sitdown];//
//                              4D6163526165                            //
//////////////////////////////////////////////////////////////////////////


_chair = _this select 0; 

//[[player, "Crew"], "MAC_fnc_switchMove"] spawn BIS_fnc_MP; 
[[[player], {(_this select 0) switchMove "Crew";}], "BIS_fnc_call", nil, false, true] call BIS_fnc_MP;
player setPos (getPos _chair); 
player setDir ((getDir _chair) - 180); 
standup = player addaction ["Aufstehen",life_fnc_standup];
player setpos [getpos player select 0, getpos player select 1,((getpos player select 2) +1)];