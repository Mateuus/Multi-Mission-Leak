/*
hackvault

cgbankvault is the variable name
*/

private ["_cops"];

_cops = (west countSide playableUnits);
if(_cops < 9) exitWith { ["Musi byc obecnych 9 policjantow aby rabowac bank!", false] spawn domsg; }; 

_storename = "hi";



if(life_inv_hackingtool == 0) exitwith {
	["Potrzebujesz cos w stylu urzadzenia zaklocajacego aby otworzyc sejf!", false] spawn domsg;	
};


if (cgbankvault getVariable ["robbed", false]) exitwith {["This bank was recently robbed.",30,"red"] spawn domsg;};
if (cgbankvault getVariable ["hacking", false]) exitwith {["This is already being hacked...",30,"red"] spawn domsg;};
if (cgbankvault animationPhase "d_l_Anim" == 1) exitwith {["The bank appears unlocked...",30,"red"] spawn domsg;};

if (life_inv_hackingtool > 0 && !hacking && cgbankvault animationPhase "d_l_Anim" == 0 ) then {
	 ["dbank", false] remoteExec ["fnc_dispatch",west];

	["Ustawiles ustawienie zaklocajace obok banku. Za okolo 5 minut otworzy sie!", false] spawn domsg;
	cgbankvault say "bankAlarm";
	cgbankvault setVariable["hacking", true, true];

	_veh = "Land_MobilePhone_smart_F" createvehicle (getpos player);
	_veh attachto [player, [-.02,-.006,-0.02], "RightHandMiddle1"];
	_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
	_veh setpos (getpos _veh);

	_num = 300; 
	while {_num > 0} do {
		if ( _num == 300 || _num == 240 || _num == 180 || _num == 120 || _num == 60 ) then {


			playSound3D ["cg_sndimg\sounds\starthack.ogg", player, false, getPosASL player, 1, 1, 225];

			[1,format["911: BANK JEST RABOWANY!",_storename]] remoteExecCall ["life_fnc_broadcast", west];
			[1,format["911: BANK JEST RABOWANY!",_storename]] remoteExecCall ["life_fnc_broadcast", independent];
		};
		if(deadPlayer) exitwith {
		};
		_num = _num - 1;
		uiSleep 1;
	};
	detach _veh;
	deletevehicle _veh;

	if(deadPlayer) then {
		cgbankvault setVariable["hacking", nil, true];
		hacking = false;
	};

	if(!deadPlayer) then {
		cgbankvault setvariable ["robbed", true, true];
		cgbankvault animate ["d_l_Anim",1];
		cgbankvault setVariable["hacking", nil, true];
		playSound3D ["cg_sndimg\sounds\endhack.ogg", player, false, getPosASL player, 1, 1, 225];
		[] call fnc_cgbankresettimer;
	};
};



