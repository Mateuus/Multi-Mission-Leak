
_list = [
	[Schild_tunnel_1,[0,170,0]],
	[Schild_tunnel_2,[0,170,0]],
	[Schild_tunnel_3,[250,250,250]],
	[Schild_tunnel_4,[250,250,250]],
	[Schild_tunnel_5,[0,170,0]],
	[Schild_tunnel_6,[0,170,0]],
	[Schild_tunnel_7,[0,170,0]],
	[Schild_tunnel_8,[0,170,0]],
	[Schild_tunnel_9,[250,250,250]],
	[Schild_tunnel_10,[250,250,250]],
	[eisplakat_1,[250,250,250]],
	[eisplakat_2,[250,250,250]],
	[heli_info_plakat_1,[250,250,250]],
	[gericht,[250,250,250]],
	[licht_kavalamed,[250,250,250]],
	[licht_kavalamed2,[250,250,250]],
	[licht_kavalamed3,[250,250,250]],
	[spielstrasse_1,[250,250,250]],
	[spielstrasse_2,[250,250,250]],
	[gefaengnis_2,[250,250,250]],
	[gefaengnis_3,[250,250,250]],
	[gefaengnis_4,[250,250,250]],
	[plakat_krankenhausathira,[250,250,250]],
	[plakat_krankenhausathira2,[250,250,250]],
	[plakat_krankenhausathira3,[250,250,250]],
	[ims_plakat1,[250,250,250]],
	[ims_plakat2,[250,250,250]],
	[brunnen,[53,81,92]],
	[airport_werbung_1,[0,255,0]],
	[airport_werbung_2,[0,255,0]],
	[palme_1,[255,0,0]],
	[palme_2,[255,0,0]],
	[hotel_kav_licht1,[39,217,187]],
	[hotel_kav_licht2,[39,217,187]]
];

{
	_obj = _x select 0;
	_color = _x select 1;

	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	_lightSource lightAttachObject [_obj,[0,-0.5,1.5]];

	_lightSource setLightColor _color;
	_lightSource setLightAmbient [1,1,0.2];
	//_lightSource setLightAttenuation [2,4,4,0,9,10];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare false;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;
	_lightSource setLightDayLight false;
} forEach _list;


_marktindoor = [
	[[3686.36,13111.6,1.5],[250,150,50]],	//dimitris
	[[3668.16,13113.8,1.5],[250,150,50]],	//gertrud
	[[3685.68,13119.7,1.5],[250,150,50]],	//kleidungsladen
	[[3669.43,13103.4,1.5],[50,50,50]],		//bank
	[[3687.63,13093.2,1.5],[50,50,50]],		//auktion
	[[3653.92,13097.7,1.5],[250,0,50]],		//hulabar
	[[3647.27,13078.5,1.5],[50,50,50]],		//apotheke
	[[3645.69,13096.4,1.5],[250,150,50]],	//arndt
	[[3638.14,13077.2,1.5],[250,150,50]],	//bürgerbüro
	[[3626.34,13098,1.5],[250,150,50]],		//turisteninfo
	[[3628.09,13077.7,1.5],[250,150,50]]	//supermarkt
];

{
	_pos = _x select 0;
	_color = _x select 1;

	_lightSource = "#lightpoint" createVehicleLocal _pos;
	_lightSource setLightColor _color;
	_lightSource setLightAmbient [1,1,0.2];
	//_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare false;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;
	_lightSource setLightDayLight false;
} forEach _marktindoor;