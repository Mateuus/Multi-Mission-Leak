if (CurrentMode == "Altis") then {
	_light="#lightpoint"createVehicleLocal[10686.3,11560.5,21460.4];
	_light setLightColor[250,150,50];
	_light setLightAmbient[1,1,0.2];
	_light setLightAttenuation[1,0,0,0];
	_light setLightIntensity 1000;
	_light setLightUseFlare true;
	_light setLightFlareSize 0.2;
	_light setLightFlareMaxDistance 50;
	ES_camtarget="#lightpoint" createVehicleLocal [10686.3,11560.5,21460.4];
	ES_camtarget setPos [10686.3,11560.5,21460.4];

}else {

	_light="#lightpoint"createVehicleLocal[10686.3,11560.5,21460.4];
	_light setLightColor[250,150,50];
	_light setLightAmbient[1,1,0.2];
	_light setLightAttenuation[1,0,0,0];
	_light setLightIntensity 1000;
	_light setLightUseFlare true;
	_light setLightFlareSize 0.2;
	_light setLightFlareMaxDistance 50;
	ES_camtarget="#lightpoint" createVehicleLocal [10686.3,11560.5,21460.4];
	ES_camtarget setPos [10686.3,11560.5,21460.4];
};