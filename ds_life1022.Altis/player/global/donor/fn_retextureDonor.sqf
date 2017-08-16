/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Do retextures from the donor menu
*/

private ["_texture","_textureName"];

if(!(playerSide isEqualTo civilian))exitWith{hint "You can not do this as a police officer or whitelisted civilian"};
if((lbCurSel 1501) isEqualTo -1)exitWith{hint "You have not selected a texture to apply"};

_texture = lbText [1501,lbCurSel 1501];
_textureName = lbData [1501,lbCurSel 1501];
_textureName = format ["extras\textures\%1",_textureName];

if(player getVariable ["restrained",false])exitWith{hint "Can't do this while in a vehicle or restrained"};
if(DS_donorUsed2)exitWith{hint "You have used this too recently. It can only be used once every 20 seconds"};
DS_donorUsed2 = true;

if(!isNull objectParent player)then {
	if(((vehicle player) in DS_keyRing)&&(!((vehicle player) getVariable ["policeVehicle",false])))then {
		if(_texture isEqualTo "Clan Texture")then {
			[1] call DS_civ_donorRetexture;
		} else {
			(vehicle player) setObjectTextureGlobal [0,_textureName];
			(vehicle player) setObjectTextureGlobal [1,_textureName];
			(vehicle player) setObjectTextureGlobal [2,_textureName];
			(vehicle player) setObjectTextureGlobal [3,_textureName];
			(vehicle player) setObjectTextureGlobal [4,_textureName];
			(vehicle player) setObjectTextureGlobal [5,_textureName];
		};
		hint "Retexture complete. If you see no results then this vehicle can not be retextured";
	} else {
		hint "You can not texture a vehicle you do not have the keys to, or police vehicles. To texture your clothing exit the vehicle";
		DS_donorUsed2 = false;
	};
} else {
	if(_texture == "Clan Texture")then {
		[0] call DS_civ_donorRetexture;
	} else {
		player setObjectTextureGlobal [0,_textureName];
		player setObjectTextureGlobal [1,_textureName];
		player setObjectTextureGlobal [2,_textureName];
		player setObjectTextureGlobal [3,_textureName];
		(backpackContainer player) setObjectTextureGlobal [0,_textureName];
	};

	hint "Retexture complete. If you see no results then this outfit can not be retextured";
};

sleep 20;
DS_donorUsed2 = false;