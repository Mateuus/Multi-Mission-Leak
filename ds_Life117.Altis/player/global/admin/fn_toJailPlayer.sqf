/*
			Author: Shawn "Huntah" Macgillivray
			
	
			Description:
			Sends target to jail (By Admins)
*/
private ["_reason","_action","_value"];

_time = "30";
_reason = "Glitching";
player allowDamage false;
if((vehicle player) != player)then
	{
	player action ["getOut", vehicle player];
	};
sleep 1;
[player,_time,_reason,true] spawn DS_fnc_jail;
cutText ["","BLACK IN"];
vehicle player switchCamera "EXTERNAL";