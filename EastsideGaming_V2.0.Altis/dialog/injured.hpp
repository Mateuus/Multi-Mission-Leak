class esg_injured {
	idd = 2788;
  name= "esg_injured";
	fadein=0;
  duration = 99999999999;
  fadeout=0;
  movingEnable = 0;
  onLoad="uiNamespace setVariable ['esg_injured',_this select 0]";
  objects[]={};
	class controlsBackground {
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = -1;
			text = "<t align='center' size='2' font='PuristaBold'>Du bist Verwundet</t><br/><br/><t align='center'>Du wurdest Verwundet und bist nun Ohnmächtig! Eine Anfrage an den Rettungsdienst wurde automatisch versendet.</t><br/><t align='center'>Du hast nur noch 10 Minuten zum Leben! Andere Bürger können dich stabilisieren und dir somit jeweils 3 Minuten mehr Lebenszeit gewährleisten.</t><br/><t align='center'>Nur der Rettungsdienst kann eine Herzdruckmassage ausführen und dich somit wieder ins Leben zurück holen! Sollte dieser nicht kommen, dann wirst du an deinen Verletzungen verbluten und ein neues Leben beginnen müssen!</t>"; //--- ToDo: Localize;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.076 * safezoneH + safezoneY;
			w = 0.479531 * safezoneW;
			h = 0.258 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};

	class Controls {
		class zeit: Life_RscText
		{
			idc = 1000;
			text = "Verbleibende Zeit:"; //--- ToDo: Localize;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.285 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
