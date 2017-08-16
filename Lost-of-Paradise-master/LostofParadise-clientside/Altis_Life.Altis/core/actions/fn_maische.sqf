//moonshinescript made by spll3r
if(mdone) exitwith 
			{
				hint "Die Maische wurde bereits hergestellt";
			 };
			 
if(life_inv_mais > 1 && life_inv_zucker > 0) then
	{		
			mdone = true;
			disableUserInput true;
			hint "Du maischt dass Wasser mit 2xMais und 1xZucker an.";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 7;
			
			life_inv_mais = life_inv_mais - 2;
			life_carryWeight = life_carryWeight - 4;
			life_inv_zucker = life_inv_zucker - 1;
			life_carryWeight = life_carryWeight - 4;
			
			hint "Du kannst nun mit der Destillation beginnnen!";
			disableUserInput false;
						
			} else { hint "Zur Einmaischung benoetigst du 2xMais und 1xZucker";
	 };