
while {true} do {


//waitUntil {isPlayer cursorTarget && cursorTarget isKindOf "Man" && Alive cursorTarget};
waitUntil {cursorTarget isKindOf "Man"};
_curTarget = cursorTarget;
_curTargetcheck = cursorTarget;
_myactionone = cursorTarget addAction ["<t color='#FF0000'>Bandage</t>", "

		if (isNull objectParent player) then 
		{
		player switchMove "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";
		
		waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
		};
		cursorTarget setVariable ["bleedingon",1,true]; 

		["Add",0.5] remoteExecCall ["fnc_doHealth",cursortarget]; 

		cursorTarget removeAction _myactionone;
"];

_myactiontwo = cursorTarget addAction ["<t color='#FF0000'>Stitch</t>", "

		if (isNull objectParent player) then 
		{
		player switchMove "AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon";
		
		waitUntil{animationState player != "AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon";};
		};
		cursorTarget setVariable ["woundedon",1,true]; 
		["Add",0.8] remoteExecCall ["fnc_doHealth",cursortarget]; 
		cursorTarget removeAction _myactiontwo;
"];

_myactionthree = cursorTarget addAction ["<t color='#FF0000'>Splint</t>", "
		if (isNull objectParent player) then 
		{
		player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
		
		waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
		};
		cursorTarget setVariable ["fractureon",1,true]; 
		["Add",0.1] remoteExecCall ["fnc_doHealth",cursortarget]; 
		cursorTarget removeAction _myactionthree;
"];

_myactionfour = cursorTarget addAction ["<t color='#FF0000'>Epi-Pen</t>", "
		if (isNull objectParent player) then 
		{
		player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
		
		waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
		};
		cursorTarget setVariable ["unconciouson",1,true]; 
		["Add",0.1] remoteExecCall ["fnc_doHealth",cursortarget]; 
		cursorTarget removeAction _myactionfour;
"];

};

waitUntil {cursorTarget != _curTargetcheck};
_curTarget removeAction _myactionone;
_curTarget removeAction _myactiontwo;
_curTarget removeAction _myactionthree;
_curTarget removeAction _myactionfour;
uiSleep 0.1;
};


// "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";