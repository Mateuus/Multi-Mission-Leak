// Dialog made by www.division-wolf.de
class bugHunter
{
	idd = 39600;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	
	class controlsBackground {
		
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
		class BankTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Bug melden";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};

        class RscStructuredText_1101: DWEV_RscStructuredText
        {
            idc = 1101;
            text = "<t size='1.1' align='center'>Du möchtest uns einen Fehler melden? Das kannst du hier tun!</t>";
            x = 0.0375;
            y = 0.2;
            w = 0.925;
            h = 0.1;
        };
		
		class RscStructuredText_1102: DWEV_RscStructuredText
        {
            idc = 1102;
            text = "Achte bitte darauf den Fehler möglichst <t color='#FF0000'>präzise</t> und <t color='#FF0000'>detailliert</t> zu beschreiben.<br/>Den Status deiner Meldung kannst du im Forum einsehen. <br/> Vielen Dank für deine Mithilfe!";
            x = 0.06;
            y = 0.25;
            w = 0.925;
            h = 0.24;
        };
		
		class RscStructuredText_1103: DWEV_RscStructuredText
        {
            idc = 1103;
            text = "<t size='1.1' align='center'>Maximal 256 Zeichen!</t>";
            x = 0.06;
            y = 0.71;
            w = 0.925;
            h = 0.24;
        };
	};

	class controls {
		
		class ctrl_grafik_senden: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.4625;
            y = 0.80;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_senden: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Bugreport senden";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_bugReport;";
			x = 0.4625;
            y = 0.80;
			w = 0.075;
			h = 0.075;
		};

        class RscEdit_1400: DWEV_RscEdit
        {
            idc = 1400;
            text = "Gib hier deine Fehlerbeschreibung ein.";
            type = 2;
            style = 16;
			colorBackground[] = {0, 0, 0, 0};
            x = 0.06;
            y = 0.4;
            w = 0.88;
            h = 0.29;
        };
		
		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};
		
		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Bugreport schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};
		
		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet kann nicht ausgeschaltet werden, solange ein Programm läuft";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};

