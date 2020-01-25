/*
File: fn_rope.sqf
koils a dick head
*/
private["_sum","_breakaction"];


if(life_rope == 2) exitWith { 
["Nie mozesz tego zrobic.", false] spawn domsg;
titleFadeOut 5;
}; 

["To zajmie troche czasu..", false] spawn domsg;
titleFadeOut 20;
_cme = 1;
_myposy = getPos player;
if(!life_action_inUse) then {
while {true} do {
life_action_inUse = true;
player playMove "AmovPercMstpSnonWnonDnon_Scared2";
uiSleep 1;
_cme = _cme + 1;
	if( player distance _myposy > 1.8 ) exitwith { 
			["Za bardzo sie oddaliles.", false] spawn domsg;
	};
	if(_cme > 20) exitwith {
				life_action_inUse = false;

				playSound3D ["cg_sndimg\sounds\tieup.ogg", player, false, getPosASL player, 1, 1, 125];

				_veh = "Land_ExtensionCord_F" createvehicle (getpos player);
				_veh setVariable ["pickup",false,true];
				_veh attachto [player, [-.02,-.006,-0.02], "RightHandMiddle1"];
				_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
				_veh setpos (getpos _veh);
				_id = player addAction ["<t color = '#f4a84e'>Drop Rope</t>", {detach (_this select 3)},_veh];
				_id2 = player addAction["<t color = '#f4a84e'>Tie Person</t>",life_fnc_tieingAction,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (!life_action_inUse) '];
		
		[_veh,_id] spawn {
			_veh = _this select 0;
			_id = _this select 1;
			_suitcaseDeleted = false;
			life_rope = 2;
			while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted) OR life_rope == 2} do {
				if ((!(isNull objectParent player)) && (!(_suitcaseDeleted))) then 
				{
					player removeAction _id;
					detach _veh;
					deleteVehicle _veh;
					_suitcaseDeleted = true;
				};
			
				if ((_suitcaseDeleted) && (isNull objectParent player)) then {
					_veh = "Land_ExtensionCord_F" createvehicle (getpos player);
					_veh setVariable ["pickup",false,true];
					_veh attachto [player, [-0.02,-.006,-0.02], "RightHandMiddle1"];
					_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
					_veh setpos (getpos _veh);
					_id = player addAction ["<t color = '#f4a84e'>Drop Rope</t>", {detach (_this select 3)},_veh];	
					_id2 = player addAction["<t color = '#f4a84e'>Tie Person</t>",life_fnc_tieingAction,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (!life_action_inUse) '];
					_suitcaseDeleted = false;
				};
				
				if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
				if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
				if (!(!deadPlayer)) exitwith {detach _veh;};
				if((player getVariable["restrained",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
				uiSleep 0.2;
			};
			life_rope = 1;
			detach _veh;
			_veh setVariable ["pickup",true,true];
			player removeAction _id;
			player removeAction _id2;
		};
		titleText["You got some rope to tie people!","PLAIN"];
	};
	life_action_inUse = false;
};

};

