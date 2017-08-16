//moonshinescript made by spll3r

_gather = "schnaps"; 
_val = 1;
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

if(mdone) then
	{
			hint "Du destillierst nun den Schnaps!";
			disableUserInput true;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 7;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 7;
			[true,"schnaps",1] call life_fnc_handleInv;
			/*
			*/
			hint "Der Durchlauf ist fertig!";
			mdone = false;
			disableUserInput false;
			
			} else { hint "Zur Destillation muss sich Maische im Brennkessel befinden!";
	 };