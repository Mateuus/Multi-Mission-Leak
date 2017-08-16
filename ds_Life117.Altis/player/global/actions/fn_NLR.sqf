/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Counts ze new life stuffs
*/
private ["_position","_nlr","_warnings","_copNumbers","_adminLevel","_player"];

_position = getpos(vehicle player);
_adminLevel = (DS_adminlevel);
_player = (name player);
sleep 20;
if(_position distance spawnIsland < 3000)exitwith{DS_nlr = false;};//Who cares
if((str(player) in ["cop_1","cop_4","cop_3","cop_5"])&&(miscInfoArray select 7)&&(_position distance kavAtm_4 < 6000))exitwith{DS_nlr = false;};//Pub cops, have no choice when locked into kavala
DS_nlr_time = 900;

if(playerside == west) then
	{	
	while {true} do
		{
		if(DS_nlr_time < 0)exitwith{hint 'New life cooldown is over';DS_nlr = false;DS_nlr_time = 0;};
		if(DS_revived)exitwith{DS_revived = false;DS_nlr = false;DS_nlr_time = 0;};
		if(!alive player)exitwith{DS_nlr_time = 0;};
		if((alive player)&&(player distance _position < 3000))then
			{
			hint format ["!!!Warning!!!  \n You are too close to the point of your last death\n\n this is in breach of the New life rule. \n\n\n You are not allowed back here for another %1 minutes\n\n\nMessage the admins if you have a valid explanation otherwise you could be kicked without warning\n\n\nIf there was less than five whitelisted police on when you died then you can ignore this message for one life only",(round(DS_nlr_time/60))];
			DS_nlr = true;
			}
			else
			{
			DS_nlr = false;
			};
		sleep 10;
		DS_nlr_time = DS_nlr_time - 10;
		};
	
	}
	else
	{
	while {true} do
		{
		if(DS_nlr_time < 0)exitwith{hint 'New life cooldown is over';DS_nlr = false;DS_nlr_time = 0;};
		if(DS_revived)exitwith{DS_revived = false;DS_nlr = false;DS_nlr_time = 0;};
		if(!alive player)exitwith{DS_nlr_time = 0;};
		if((alive player)&&(player distance _position < 3000))then
			{
			hint format ["!!!Warning!!!  \n You are too close to the point of your last death\n\n this is in breach of the New life rule. \n\n\n You are not allowed back here for another %1 minutes\n\n\nMessage the admins and get approval if you have a valid explanation otherwise you could be kicked without warning (Leave the area until you get approval\n\n\nExplain the glitch you claim to have died by a glitch",(round(DS_nlr_time/60))];
			DS_nlr = true;
			}
			else
			{
			DS_nlr = false;
			};
		sleep 10;
		DS_nlr_time = DS_nlr_time - 10;
		};
	
	};
DS_nlr = false;


