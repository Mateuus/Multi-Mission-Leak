//moonshinescript made by spll3r


_gather = "schnaps"; 
_val = 1;
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

if(mdone) then
	{
			hint "Du destillierst nun den Schnaps!";
			//life_inv_l = 0;
			mdone = false;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 5;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 5;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 5;
			[true,"schnaps",1] call life_fnc_handleInv;
			/*
			life_inv_schnaps = life_inv_schnaps + 1;
			life_carryWeight = life_carryWeight + 2;
			*/
			hint "Der Durchlauf ist fertig!";
				 
			
			} else { hint "Zur Destillation muss sich Maische im Brennkessel befinden!";
	 };