//////////////////////////////////////////////////////////////////////////
//                            Script Made By                           					  //
//                                MacRae                              						  //
//                                                                    							  //
//                           MODIFIED BY XETOXYC,Blackd0g              			  //
//////////////////////////////////////////////////////////////////////////
private ["_unit","_chair"];
_chair = cursorTarget;
 _unit = player;

activeChairSeat = _chair;
 
if(lhm_sitting) then{
	lhm_sitting = false;
	
    _unit switchMove "";
	//[[_unit, ""], "lhm_fnc_animSync"] call lhm_fnc_mp;
	activeChairSeat enableSimulation true;  
} else {
	lhm_sitting = true;
	
    [[_unit, "Crew"], "lhm_fnc_animSync"] call lhm_fnc_mp;
	sleep 0.1;
	
	waitUntil {animationState player == "Crew"};
	
	if (_chair isKindOf "Land_Bench_01_F" || _chair isKindOf "Land_Bench_02_F" || _chair isKindOf "Land_Bench_F") then {
	_unit setPos (getPos _chair); 
    _unit setDir ((getDir _chair) - 180); 
    _unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) -0.38)];
	_chair enableSimulation false;
	} else {
	 _unit setPos (getPos _chair); 
    _unit setDir ((getDir _chair) - 180); 
    _unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) +1)];
	_chair enableSimulation false;
	};
};		