/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys a License
*/
disableSerialization;

private ["_price","_fail"];
_fail = true;
ctrlShow[66654,false];
switch(DS_className)do
	{
	case "0": 
		{
		if(player distance (getMarkerPos "clanVeh4") < 500)then
			{
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\AMCclothes(RolledUp).jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\AMCclothes(RolledUp).jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "fd") < 500)then
			{
			player setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\vehicles\scorp_hell.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "clanBaseSpawn3") < 500)then
			{
			player setObjectTextureGlobal [0,"extras\textures\vehicles\hms.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\vehicles\hms.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "clanBaseSpawn2") < 500)then
			{
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\FUclothes.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\FUclothes.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "clanBaseSpawn7") < 500)then
			{
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\TFClothes.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\TFClothes.jpg"];
			_fail = false;
			};
		};
	case "1": 
		{
		if(player distance (getMarkerPos "clanVeh4") < 500)then
			{
			(backPackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\AMCbackpack.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "fd") < 500)then
			{
			(backPackContainer player) setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "clanBaseSpawn3") < 500)then
			{
			(backPackContainer player) setObjectTextureGlobal [0,"extras\textures\vehicles\hms.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "clanBaseSpawn2") < 500)then
			{
			(backPackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\FUBackpack.jpg"];
			(backPackContainer player) setObjectTextureGlobal [1,"extras\textures\clothing\custom\FUBackpack.jpg"];
			_fail = false;
			};
		if(player distance (getMarkerPos "clanBaseSpawn7") < 500)then
			{
			(backPackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfBackpack.jpg"];
			(backPackContainer player) setObjectTextureGlobal [1,"extras\textures\clothing\custom\tfBackpack.jpg"];
			_fail = false;
			};
		};
	};
if(_fail)exitwith{hint "This is not your texture to use"};
hint "Clothing retextured, if you see no results, the clothing type you are wearing can not be textured";
