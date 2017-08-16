
_texturen = [
	"MINEFACTORY\textures\Nummernschilder\default.paa"
/*	"images\lp\Nummernschild_ADAC.paa",
	"images\lp\Nummernschild.paa",
	"images\lp\Nummernschild_MEDIC.paa"*/
];
_tempPlakat = "Land_Billboard_F" createVehicleLocal (player modelToWorld [0,1,0]);
{
_tempPlakat setObjectTexture [0, _x];
sleep 2;
}forEach _texturen;
deleteVehicle _tempPlakat;