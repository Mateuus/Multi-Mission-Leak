
/* File: fn_usetobacco.sqf
     Author: jakesmithey 
     Description: An effect for smoking a cigarette.
*/
cutText ["Du hast dir eine Zigarette aus der Packung genommen..","PLAIN",2];
sleep 3; 
cutText ["Mmmm...Ich werde diese erfrischende, leckere Zigarette geniessen.","PLAIN",2];
 
if (!ES_smoke) then
{
	ES_smoke = true;
	[[player],"ES_fnc_drug_rauch",true,false] spawn BIS_fnc_MP;
	sleep 150;
	ES_smoke = false;
};