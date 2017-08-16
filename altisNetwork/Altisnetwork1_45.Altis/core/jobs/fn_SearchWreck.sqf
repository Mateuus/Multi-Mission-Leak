private["_sum","_finding","_txt"];
_finding = ["artifactold","artifactnew","gold"] call BIS_fnc_selectRandom;
if (_finding == "artifactold") then {_txt = "Old Artifact";};
if (_finding == "artifactnew") then {_txt = "New Artifact";};
if (_finding == "gold") then {_txt = "Gold Artifacts";};
_sum = [_finding,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
life_wreck_searched = true; //used to remove search action in fn_TreasureHunt.sqf
if(_sum > 0) then
{
	life_action_inUse = true;
	life_action_in_Use = true;
	titleText["Searching Wreck...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,_finding,1] call life_fnc_handleInv)) then
	{
		titleText["You have collected a " + _txt,"PLAIN"];
	};
};
//wtf
life_action_inUse = false;
life_action_in_Use = false; 