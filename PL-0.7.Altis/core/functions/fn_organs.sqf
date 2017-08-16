
while{true} do
{
	waitUntil {(player getVariable "missingOrgan")};
	life_max_health = .50;
	while{(player getVariable "missingOrgan")} do {
		life_thirst =  50;
		life_hunger =  50;
		if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
		sleep 5;
	};
	life_max_health = 1;
};
