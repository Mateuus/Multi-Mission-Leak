/*

	Author Shinji
	Liest die Eintr�ge des Spielers aus dem Dialog aus und tr�gt sie in die DB ruft danach alle Spierla auf das neue zeitung da ist

*/

_headline1 = ctrlText 8194;
_headline2 = ctrlText 8195;
_text1 = ctrlText 8196;
_text2 = ctrlText 8197;


[_headline1,_headline2,_text1,_text2] remoteExec ["DB_fnc_news_new",2];

hint parseText format ["Danke,  <t size='1.25' font='TahomaB' color='#8112B9'>%1</t> feuer deinen Beitrag. Die Presse laeuft auf Hochtouren und wird gleich soweit sein!", profilename ];

[0,0,true, [profilename]] remoteExec ["life_fnc_news_broadcast",0];

closedialog 0;
