/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Do retextures from the donor menu
*/

private ["_textureName"];

_textureName = lbData[1501,lbCurSel (1501)];
_textureName = format ["extras\textures\%1",_textureName];

if(DS_donorUsed2)exitwith{hint "You have used this too recently, it can only be used once per 20 seconds"};
DS_donorUsed2 = true;

if((vehicle player) != player)then
	{
	if(((vehicle player) in DS_keyRing)&&(!((vehicle player) getVariable ["policeVehicle",false])))then
		{
		[[(vehicle player),true,[_textureName,_textureName]],"DS_fnc_globalTexture",true,false] spawn DS_fnc_MP;
		hint "Retexture complete, If you see no results then this vehicle can not be retextured";
		}
		else
		{
		hint "You can not texture a vehicle you do not have the keys to, or police vehicles. To texture clothing exit the vehicle";
		};
	}
	else
	{
	player setObjectTextureGlobal [0,_textureName];
	player setObjectTextureGlobal [1,_textureName];
	(backPackContainer player) setObjectTextureGlobal [0,_textureName];
	hint "Retexture complete, If you see no results then this outfit can not be retextured";
	};
sleep 20;
DS_donorUsed2 = false;