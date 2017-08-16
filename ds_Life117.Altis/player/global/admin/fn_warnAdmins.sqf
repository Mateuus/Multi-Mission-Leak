/*
			Author: Shawn "Huntah" Macgillivray
			
	
			Description:
			Catches rookie script kidlets
*/

if((isEngineOn (vehicle player))&&(vehicle player isKindOf "Tank")&&((typeOf (vehicle player) != "I_APC_Wheeled_03_cannon_F")))exitWith	
	{
	deleteVehicle (vehicle player);
	[[0,format["%1 was just seen in a hacked in vehicle (A Tank), please report him to the admins",name player]],"DS_fnc_globalMessage"] spawn BIS_fnc_MP;
	[[1,format["%1 was just seen in a hacked in vehicle (A Tank), please report him to the admins",name player]],"DS_fnc_globalMessage"] spawn BIS_fnc_MP;
	[[2,format["%1 was just seen in a hacked in vehicle (A Tank), please report him to the admins",name player]],"DS_fnc_globalMessage"] spawn BIS_fnc_MP;
	player setDamage 1;
	};
	
while {true} do
	{

	[[(name player),"spawned in money on them"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	if(!DSL_haxor)then
		{
		DSL_haxor = true;[] call DS_fnc_complileData;
		};
		
	sleep 30;
	if((life_cash == 0)&&(life_atmcash == 0))exitwith{};
	
	};