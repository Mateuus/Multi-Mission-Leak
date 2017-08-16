class life_deathcam
{
    idd = 410;
    movingEnabled = false;
    enableSimulation = true;
   
  class controlsBackground {
	  
 class hintergrundtext: Life_RscStructuredText
 {
 idc = -1;
 text = "Aufgrund deiner Verletzungen bist du Bewusstlos! Du kannst von einem Zivilisten , Polizisten oder Fara Mitarbeiter wiederbelebt werden. Dazu benötigt die Person nur einen Erste-Hilfe-Koffer.";
 x = 0.188052 * safezoneW + safezoneX; 
 y = 0.0749805 * safezoneH + safezoneY;
 w = 0.623897 * safezoneW;
 h = 0.136006 * safezoneH;
 colorBackground[] = {1,1,1,0.1};
 };
 
 
 };
   
   
    class controls
    { 
        class respawnButton : Life_RscButtonMenu
        {
            idc = 411;
            colorBackground[] = {0.2, 0.6, 1, 1};
            text = "Aufgeben";
            align = "center";
            onButtonClick = "player setDamage 1;";
            x = safezoneX + 0.66 * safezoneW;
            y = safezoneY + 0.1 * safezoneH;
            w = 0.1 * safezoneW;
            h = 0.02 * safezoneH;
        };
       
    };
};