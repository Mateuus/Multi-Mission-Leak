/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	warns/kicks pub cops who are out of bounds
*/

if((str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"]))then
	{
	while{true}do
		{
		if((miscInfoArray select 7) && (player distance (getMarkerPos "police_hq_1") > 7500) && (player distance (getMarkerPos "respawn_west") > 1000))then
			{
			player say3D "fail";
			hint "WARNING YOU ARE NOT ALLOWED TO TRAVEL OVER 8km's FROM KAVALA AS A PUBLIC SLOT COP";
			titleText ["!!~~ WARNING YOU ARE NOT ALLOWED TO TRAVEL OVER 8km's FROM KAVALA AS A PUBLIC SLOT COP ~~!!", "plain down"];
			};
		if((miscInfoArray select 7) && (player distance (getMarkerPos "police_hq_1") > 8000) && (player distance (getMarkerPos "respawn_west") > 1000))then
			{
			if(!isNull objectParent player)then
				{
				_pubsVeh = (vehicle player);
				deleteVehicle _pubsVeh;
				};
			["PubInKav",false,true] call BIS_fnc_endMission;
			sleep 35;
			};
		sleep 10;
		};
	};