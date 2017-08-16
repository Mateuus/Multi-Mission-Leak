class agb
{
    idd = 32154;
    name = "agb";
    movingEnable = false;
    enableSimulation = false;
    
    class controlsBackground
    {
		class BGha: Life_RscPicture
		{
			idc = 38531;
			text = "textures\bg.jpg";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};
        class RscTitleBackground : Life_RscText
        {
            colorBackground[] = {1,0.537,0,0.7};
            idc = -1;
            text = "Die Serverregeln:";
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.340312 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class RscBackground : Life_RscText
        {
            colorBackground[] = {0, 0, 0, 0.6};
            idc = -1;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.340312 * safezoneW;
            h = 0.462 * safezoneH;
        };
		
        class RsclolStatus : Life_RscStructuredText
        {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0};
            sizeEx = 0.0001;
            text = 
			"<t size = '1'>Die kompletten Regeln stehen in unserem Forum.<br/>Um direkt zu den Regeln zu kommen:<br/><a color='#FFB124' href='http://www.hawaii-life.net/regeln.html'>Hier klicken</a><br/><br/>Atlis Life Server<br/><t color='#FFB124'>Name:</t> [GER] Hawaii Life RPG<br/><t color='#FFB124'>IP:</t> s.hawaii-life.net<br/><t color='#FFB124'>Port:</t> 2302<br/><br/>Direktlinks:<br/><a color='#FFB124' href='http://invite.teamspeak.com/ts.hawaii-life.net/'>Teamspeak:</a> ts.hawaii-life.net<br/><a color='#FFB124' href='http://www.hawaii-life.net/'>Homepage:</a> hawaii-life.net<br/><br/>Restarts<br/><t color='#FFB124'>0:00, 4:00, 8:00, 12:00, 16:00, 20:00</t><br/><br/><t color='#FF0000'>Mit dem Spielen auf Hawaii Life akzeptieren Sie die Regeln und verpflichten sich diese einzuhalten.</t></t>";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.319687 * safezoneW;
			h = 0.451 * safezoneH;
		};
    };
	
    class Controls
    {
        class naz : Life_RscButtonMenu
        {
            idc = -1;
            text = "Nicht Akzeptieren";
            colorBackground[] = {1,0,0,0.7};
            onButtonClick = "closeDialog 0;";
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class az : Life_RscButtonMenu
        {
            idc = -1;
            text = "Akzeptieren";
            colorBackground[] = {0,1,0,0.7};
            onButtonClick = "rulesok = true; closeDialog 0;";
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH; 
        };
    };
};