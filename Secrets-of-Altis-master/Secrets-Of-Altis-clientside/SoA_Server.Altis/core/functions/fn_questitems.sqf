/*
		fn_questitems.sqf
		Author: G00golplexian
	
		Description: Lists up useable Quest items...
*/
_item = _this select 0;

switch(_item) do {

//Halloween-Eventquest
	case (_item == "quest1"): {titleText ["In dem Tagebucheintrag steht, der Fischer war oft im Golf von Pyrgos unterwegs.","PLAIN"]};
	case (_item == "quest2"): {titleText ["Das Logbuch besagt, ein Mädchen sei in einem See in der Nähe von Vikos ertrunken.","PLAIN"]};
	case (_item == "quest3"): {titleText ["Auf der Schatzkarte ist ein großes X markiert, vielleicht sollte ich mich dort umschauen!","PLAIN"]};
	case (_item == "skelett"): {titleText ["Der Außerirdische sagte, ich solle die Leichenteile zu einem Voodoopriester bringen.","PLAIN"]};

};