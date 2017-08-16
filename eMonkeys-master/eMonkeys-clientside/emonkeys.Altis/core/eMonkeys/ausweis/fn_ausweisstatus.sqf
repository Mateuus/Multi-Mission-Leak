/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
if (_this == 1) then {
	hintsilent parsetext"<t size='1.5'>Lösche dein alten Ausweis bevor du einen neuen machst</t>";
};
if (_this == 2) then {
	hintsilent parsetext"<t size='1.5'>Du hast keinen Ausweis</t>";
};
if (_this == 3) then {
	hintsilent parsetext"<t size='1.5'>Dein Ausweis wurde gelöscht</t>";
	eM_ausweis = [];
};