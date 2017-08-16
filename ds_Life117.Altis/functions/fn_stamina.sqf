/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Fixes a players stamina for a number of reasons
*/



setShadowDistance 0;
player enableStamina false;
if((DS_infoArray select 17) > 35)exitwith
	{
	player setCustomAimCoef 0.2;
	};
if(DS_moral < 200)exitwith
	{
	if(DS_medicRevived)then
		{
		player setCustomAimCoef 0.2;
		}
		else
		{
		player setCustomAimCoef 2;
		};
	};
if(DS_moral < 500)exitwith
	{
	if(DS_medicRevived)then
		{
		player setCustomAimCoef 0.2;
		}
		else
		{
		player setCustomAimCoef 1;
		};
	};
if(DS_moral < 750)exitwith
	{
	if(DS_medicRevived)then
		{
		player setCustomAimCoef 0.2;
		}
		else
		{
		player setCustomAimCoef 0.5;
		};
	};
if(DS_moral > 749)exitwith
	{
	player setCustomAimCoef 0.2;
	};

if(((player getVariable ["policeSquad",""]) == "Sharp Shooter")&&(DS_sharpShooter != 0))exitwith{player setCustomAimCoef 0.05;};