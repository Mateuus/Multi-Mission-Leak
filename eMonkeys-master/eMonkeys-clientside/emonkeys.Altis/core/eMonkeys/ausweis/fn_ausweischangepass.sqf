/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

_bild =_this select 1;

_passfoto = (findDisplay 26500) displayCtrl 1200;
_passfoto ctrlSetText format["core\textures\misc\ausweis\%1.jpg",_bild];
