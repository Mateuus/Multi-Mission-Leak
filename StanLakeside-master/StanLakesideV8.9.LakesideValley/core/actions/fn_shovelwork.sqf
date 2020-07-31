/*
File: shovelwork.sqf
koils a dick head
*/
private["_sum","_veh"];

["Popracujmy troche w wiezieniu! (Nie ruszaj sie przez 30 sekund)", false] spawn domsg;

if (!life_is_arrested) exitwith {
	["Nie jestes aresztowany", false] spawn domsg;
};

if((animationState cursorTarget) != "Incapacitated" && !life_knockout && !life_action_inUse && !(player getVariable["restrained",false]) && !(player getVariable["tied",false]) && !life_istazed) then {


_cme = 1;
_myposy = getPos player;
if(!life_action_inUse) then {




while {true} do {
	life_action_inUse = true;
	uiSleep 5;
	if( player distance _myposy > 1.8 ) exitwith { 
		life_action_inUse = false;
		["Za bardzo sie oddaliles.", false] spawn domsg;
	};
	_cme = _cme + 5;

	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

 		_clkent = 25;
		while{_clkent > 0} do
		{
			uiSleep 1;
			_clkent = _clkent - 1;
			if(animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
				player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
			};
		};


	if(_cme > 30) exitwith {
		if(life_bail_amount > 3000) then {
			life_bail_amount = life_bail_amount - 1500;
		};
		life_action_inUse = false;
		["bank","add", 50] call life_fnc_handleCash;
		[format ["Zarobiles $50 - USTAWIONO NOWA KAUCJE: %1", life_bail_amount], false] spawn domsg;
	};
};




life_action_inUse = false;
};
};