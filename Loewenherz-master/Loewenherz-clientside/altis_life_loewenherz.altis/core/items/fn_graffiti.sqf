/*
	File: fn_placeGraffiti.sqf
	Author: Bloodwyn
	Written for Loewenherz
	Usage of this file is restricted to permitted servers e.g. Loewenherz. For more information contact the author.
	Description:
	Places a random Graffiti on the floor.

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
*/

//config
_path="core\textures\graffiti\";
_textures=["acab.paa","lh.paa","scull.paa","police.paa","akpeace.paa","monkey.paa","anarchy.paa","legalize.paa","peace.paa"];//Hier Namen der Texturen eintragen

player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 0.5;
waituntil {animationState player == "AinvPknlMstpSnonWnonDnon_medic_1"};
waituntil {!(animationState player == "AinvPknlMstpSnonWnonDnon_medic_1")};
_graf = "UserTexture10m_F" createVehicle [0,0,0];
_graf attachTo [player,[0,0,0.05]];
_graf setVectorUp [0,0.5,0.1];
_graf setVectorUp [0,0.5,0];
player setVectorUp surfaceNormal position player;
sleep 0.001; //Nicht wegmachen! ArmA ist zu langsam
detach _graf;
player setVectorUp [0,0,1];
_graf setObjectTextureGlobal [0,(_path+(selectRandom _textures))];

sleep 600;
deleteVehicle _graf;


