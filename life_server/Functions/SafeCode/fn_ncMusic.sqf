if((ee1 getVariable["nightclub_playing",false])) exitWith
{
	hint "Wait for the music to turn off!";
	sleep 60;
	hint "";
	ee1 setVariable["nightclub_playing",false,true];

};
ee1 setVariable["nightclub_playing",true,true];

while {(ee1 getVariable["nightclub_playing",false])} do
{
	[[ee1, "nightclub",30],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	sleep 80;
};