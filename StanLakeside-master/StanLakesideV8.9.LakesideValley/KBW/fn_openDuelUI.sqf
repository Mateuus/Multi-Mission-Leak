/*
fn_openDuelUI.sqf
Kevin Webb
Description: As you can see, opens and sets up the duel UI.
*/
createDialog "Life_KBW_Duel";
{
	if(isPlayer _x && _x != player) then {
		_index = lbAdd[15101,name _x];
		lbsetData [15101,_index,str _x];
	};
} forEach _this;
/*[] spawn {
	waitUntil{!dialog};
	life_racers = [];
};*/