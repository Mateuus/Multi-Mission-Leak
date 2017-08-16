/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Warns gang area owners of people in their hideout
*/
if(DS_warned)exitwith{};
if(!alive player)exitwith{};
DS_warned = true;
if(_this select 1)then
	{
	titleText [format["Police have been spotted at your hideout (Hideout %1)",(_this select 0)],"PLAIN"];
	hint format["Police have been spotted at your hideout (Hideout %1)",(_this select 0)];
	systemchat format["Police have been spotted at your hideout (Hideout %1)",(_this select 0)];
	player say3D "dingDong";
	}
	else
	{
	titleText [format["Civilians have been spotted at your hideout (Hideout %1)",(_this select 0)],"PLAIN"];
	hint format["Civilians have been spotted at your hideout (Hideout %1)",(_this select 0)];
	systemChat format["Civilians have been spotted at your hideout (Hideout %1)",(_this select 0)];
	player say3D "dingDong";
	};
sleep 120;
DS_warned = false;