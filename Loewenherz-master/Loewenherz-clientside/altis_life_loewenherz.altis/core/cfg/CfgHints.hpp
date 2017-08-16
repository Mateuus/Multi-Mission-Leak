class CfgHints
{
	class Rules
	{
		// Topic title (displayed only in topic listbox in Field Manual)
		displayName = "Key Bindings";
		class Rule1
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Key Bindings";
            // Optional hint subtitle, filled by arguments from 'arguments' param
			displayNameShort = "Willkommen auf Loewenherz, %13!";
			// Structured text, filled by arguments from 'arguments' param
			description = "%2 Drücke %15 um dein Fahrzeug auf/abzuschließen. <br/>%2 %17 Fahrzeug Kofferraum <br/>%2 %16 Spieler Menü <br/>%2 %18 sich ergeben <br/>%2 %14 zum  niederschlagen anderen Spieler";
			// Optional structured text, filled by arguments from 'arguments' param (first argument
			// is %11, see notes bellow), grey color of text
            //tip = "The free look represents turning the head sideways and up or down.";
			arguments[] = {
				{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
                {"name"}, // Nested array means element (specially formatted part of text)
				"name player", // Simple string will be simply compiled and called
				{"Shift + G"},
				{"U"},
				{"Z"},
				{"T"},
				{"Shift + C"}
				// String is used as a link to localization database in case it starts by str_
			};
			// Optional image
			//image = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
	};
};