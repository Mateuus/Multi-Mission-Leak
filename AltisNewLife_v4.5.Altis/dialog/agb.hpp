class agb
{
    idd = 32154;
    name = "agb";
    movingEnable = 0;
    enableSimulation = false;
    
    class controlsBackground
    {
         class RscBackground : Life_RscText
        {
            colorBackground[] = {0.067,0.067,0.067,1};
            idc = -1;
            x = 0.0875;
            y = 0.12;
            w = 0.825;
            h = 0.82;
        };
                       
        class RsclolStatus : Life_RscStructuredText
        {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0};
            sizeEx = 0.0001;
			colorText[] = {0,0,0,1};
            text = "<t>Afin de donner à tous une meilleure experience de jeu, vous devez vous engager à respecter notre réglement disponible sur notre forum.<br / ><br / >- Jouer RP, pas de freekill ou de troll<br/>- Respecter les autres joueurs<br / >- Interdit de fausser le jeu : Hack / Cheat / Duplication / UseBug<br / ><br / >Vous pouvez nous retrouver et postuler pour un emploi sur : <br / >TS³    :  ts.altisnewlife.fr<br / >WEB   :  www.altisnewlife.fr<br / >FORUM :  forum.altisnewlife.fr<br / ><br /></t><t font ='PuristaBold'>Pour vivre sur notre île vous devez accepter chacunes des conditions indiquées dans le reglement et vous engagez à les respecter.</t>";
            x = 0.1125;
            y = 0.16;
            w = 0.775;
            h = 0.66;
        };    
    };
    
        class Controls
    {
        class naz : Life_RscButtonMenu
        {
            idc = -1;
            text = "REFUSER";
			colorBackground[] = {0.69,0.14,0,1};
            onButtonClick = "closeDialog 0;";
            x = 0.1075;
            y = 0.88;
            w = 0.3;
            h = 0.045;
            class Attributes 
            {
                align = "center";
            };
        };
        
        
        class az : Life_RscButtonMenu
        {
            idc = -1;
            text = "ACCEPTER";
			colorBackground[] = {0,0.59,0.04,1};
            onButtonClick = "rulesok = true; closeDialog 0;";
            x = 0.5825;
            y = 0.88;
            w = 0.3;
            h = 0.045;
            class Attributes 
            {
                align = "center";
            };    
        };
    };
};