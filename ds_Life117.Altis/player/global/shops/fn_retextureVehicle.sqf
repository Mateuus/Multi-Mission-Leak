/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys a License
*/
disableSerialization;

private ["_search"];

_search = nearestObjects[getPos (vehicle player), ["Air","LandVehicle"],60];
_search = _search select 0;
ctrlShow[66654,false];
switch(DS_className)do
	{
	case "0": 
		{
		if(player distance (getMarkerPos "clanVeh4") < 500)then
			{
			_search setObjectTextureGlobal [0,"extras\textures\vehicles\AMCStrider.jpg"];
			_search setObjectTextureGlobal [1,"extras\textures\vehicles\AMCStrider.jpg"];
			};
		if(player distance (getMarkerPos "fd") < 500)then
			{
			_search setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			_search setObjectTextureGlobal [1,"extras\textures\vehicles\scorp_hell.jpg"];
			};
		if(player distance (getMarkerPos "clanBaseSpawn3") < 500)then
			{
			_search setObjectTextureGlobal [0,"extras\textures\vehicles\hms.jpg"];
			_search setObjectTextureGlobal [1,"extras\textures\vehicles\hms.jpg"];
			};
		if(player distance (getMarkerPos "clanVeh7") < 500)then
			{
			_search setObjectTextureGlobal [0,"extras\textures\vehicles\TF.jpg"];
			_search setObjectTextureGlobal [1,"extras\textures\vehicles\TF.jpg"];
			};
		if(player distance (getMarkerPos "clanVeh2") < 500)then
			{
			_search setObjectTextureGlobal [0,"extras\textures\vehicles\FUTEXTURE.jpg"];
			_search setObjectTextureGlobal [1,"extras\textures\vehicles\FUTEXTURE.jpg"];
			};
		if(player distance (getMarkerPos "clanVeh2") < 500)then
			{
			_search setObjectTextureGlobal [0,"extras\textures\vehicles\FUTEXTURE.jpg"];
			_search setObjectTextureGlobal [1,"extras\textures\vehicles\FUTEXTURE.jpg"];
			};
		};
	};

hint "Vehicle retextured, if you see no results, the vehicle type can not be textured. This is not a permanent change";
