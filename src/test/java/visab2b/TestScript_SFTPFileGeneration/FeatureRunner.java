package visab2b.TestScript_SFTPFileGeneration;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
    	//ZambiaSFTPMT103FILEGENERATION
    	return Karate.run(
    			"AlbaniaSFTPMT103FILEGENERATION"
//    			"AlgeriaSFTPMT103FILEGENERATION",
//    			"AngolaSFTPMT103FILEGENERATION",
//    			"AntiguaSFTPMT103FILEGENERATION",
//    			"ArgentinaSFTPMT103FILEGENERATION",
//    			"ArmeniaSFTPMT103FILEGENERATION",
//    			"AutraliaSFTPMT103FILEGENERATION",
//    			"AutriaSFTPMT103FILEGENERATION",
//    			"AzerbaijanSFTPMT103FILEGENERATION",
//    			"BahamasSFTPMT103FILEGENERATION",
//    			"BahrainBHDSFTPMT103FILEGENERATION",
//    			"BahrainOTHERSFTPMT103FILEGENERATION",
//    			"BangladeshSFTPMT103FILEGENERATION",
//    			"BelarusSFTPMT103FILEGENERATION",
//    			"BelgiumSFTPMT103FILEGENERATION",
//    			"ZambiaSFTPMT103FILEGENERATION",
//    			"VietnamSFTPMT103FILEGENERATION",
//    			"BermudaSFTPMT103FILEGENERATION",
//    			"BoliviaSFTPMT103FILEGENERATION",
//    			"BosniaandHerzegovinaSFTPMT103FILEGENERATION",
//    			"BotswanaSFTPMT103FILEGENERATION",
//    			"BrazilSFTPMT103FILEGENERATION",
//    			"BritishVirginIslandSFTPMT103FILEGENERATION",
//    			"BulgariaSFTPMT103FILEGENERATION",
//    			"CambodiaSFTPMT103FILEGENERATION",
//    			"CanadaCADSFTPMT103FILEGENERATION",
//    			"CanadaUSDSFTPMT103FILEGENERATION",
//    			"CaymanIslandSFTPMT103FILEGENERATION",
//    			"ChileSFTPMT103FILEGENERATION",
//    			"ChinaSFTPMT103FILEGENERATION",
//    			"ColombiaSFTPMT103FILEGENERATION",
//    			"CoteDivoireSFTPMT103FILEGENERATION",
//    			"CostaRicaSFTPMT103FILEGENERATION",
//    			"CroatiaSFTPMT103FILEGENERATION",
//    			"CuracaoSFTPMT103FILEGENERATION",
//    			"CyprusSFTPMT103FILEGENERATION",
//    			"CzechRepublicSFTPMT103FILEGENERATION",
//    			"DenmarkSFTPMT103FILEGENERATION",
//    			"DominicanRepublicSFTPMT103FILEGENERATION",
//    			"EcuadorSFTPMT103FILEGENERATION",
//    			"EgyptSFTPMT103FILEGENERATION",
//    			"ElSalvadorSFTPMT103FILEGENERATION",
//    			"EstoniaSFTPMT103FILEGENERATION",
//    			"FinlandSFTPMT103FILEGENERATION",
//    			"FranceSFTPMT103FILEGENERATION",
//    			"GeorgiaSFTPMT103FILEGENERATION",
//    			"GermanySFTPMT103FILEGENERATION",
//    			"GhanaSFTPMT103FILEGENERATION",
//    			"GreeceSFTPMT103FILEGENERATION",
//    			"GuatemalaSFTPMT103FILEGENERATION",
//    			"GuyanaSFTPMT103FILEGENERATION",
//    			"HaitiSFTPMT103FILEGENERATION",
//    			"HondurasSFTPMT103FILEGENERATION",
//    			"HongKongSFTPMT103FILEGENERATION",
//    			"HungarySFTPMT103FILEGENERATION",
//    			"IcelandSFTPMT103FILEGENERATION",
//    			"IndonesiaSFTPMT103FILEGENERATION",
//    			"IrelandSFTPMT103FILEGENERATION",
//    			"IsraelSFTPMT103FILEGENERATION",
//    			"ItalySFTPMT103FILEGENERATION",
//    			"JamaicaSFTPMT103FILEGENERATION",
//    			"JapanSFTPMT103FILEGENERATION",
//    			"JordanSFTPMT103FILEGENERATION",
//    			"KazakhstanSFTPMT103FILEGENERATION",
//    			"KenyaSFTPMT103FILEGENERATION",
//    			"KuwaitSFTPMT103FILEGENERATION",
//    			"LaosSFTPMT103FILEGENERATION",
//    			"LatviaSFTPMT103FILEGENERATION",
//    			"LebanonSFTPMT103FILEGENERATION",
//    			"LithuaniaSFTPMT103FILEGENERATION",
//    			"LuxembourgSFTPMT103FILEGENERATION",
//    			"MalaysiaSFTPMT103FILEGENERATION",
//    			"MaldivesSFTPMT103FILEGENERATION",
//    			"MaltaSFTPMT103FILEGENERATION",
//    			"MauritiusSFTPMT103FILEGENERATION",
//    			"MexicoSFTPMT103FILEGENERATION",
//    			"MongoliaSFTPMT103FILEGENERATION",
//    			"MoroccoSFTPMT103FILEGENERATION",
//    			"MozambiqueSFTPMT103FILEGENERATION",
//    			"NamibiaSFTPMT103FILEGENERATION",
//    			"NetherlandsSFTPMT103FILEGENERATION",
//    			"NicaraguaSFTPMT103FILEGENERATION",
//    			"NigeriaSFTPMT103FILEGENERATION",
//    			"NorwaySFTPMT103FILEGENERATION",
//    			"OmanSFTPMT103FILEGENERATION",
//    			"PakistanSFTPMT103FILEGENERATION",
//    			"PanamaSFTPMT103FILEGENERATION",
//    			"ParaguaySFTPMT103FILEGENERATION",
//    			"PeruSFTPMT103FILEGENERATION",
//    			"PeurtoRicoSFTPMT103FILEGENERATION",
//    			"PhilippinesSFTPMT103FILEGENERATION",
//    			"PolandSFTPMT103FILEGENERATION",
//    			"PortugalSFTPMT103FILEGENERATION",
//    			"QatarSFTPMT103FILEGENERATION",
//    			"RomaniaSFTPMT103FILEGENERATION",
//    			"SaudiArabiaSFTPMT103FILEGENERATION",
//    			"SenegalSFTPMT103FILEGENERATION",
//    			"SerbiaSFTPMT103FILEGENERATION",
//    			"SingaporeSFTPMT103FILEGENERATION",
//    			"SlovakiaSFTPMT103FILEGENERATION",
//    			"SloveniaSFTPMT103FILEGENERATION",
//    			"SouthAfricaSFTPMT103FILEGENERATION",
//    			"SouthkoreaSFTPMT103FILEGENERATION",
//    			"SpainSFTPMT103FILEGENERATION",
//    			"SriLankaSFTPMT103FILEGENERATION",
//    			"SwedenSFTPMT103FILEGENERATION",
//    			"SwitzerlandSFTPMT103FILEGENERATION",
//    			"TaiwanSFTPMT103FILEGENERATION",
//    			"TanzaniaSFTPMT103FILEGENERATION",
//    			"ThailandSFTPMT103FILEGENERATION",
//    			"TrinidadandTobagoSFTPMT103FILEGENERATION",
//    			"TunisiaSFTPMT103FILEGENERATION",
//    			"TurkeySFTPMT103FILEGENERATION",
//    			"TurksandcaicosSFTPMT103FILEGENERATION",
//    			"UgandaSFTPMT103FILEGENERATION",
//    			"UkraineSFTPMT103FILEGENERATION",
//    			"UnitedArabEmiratesSFTPMT103FILEGENERATION",
//    			"UnitedKingdomSFTPMT103FILEGENERATION",
//    			"UnitedStatesSFTPMT103FILEGENERATION",
//    			"UruguaySFTPMT103FILEGENERATION",
//    			"UzbekistanSFTPMT103FILEGENERATION"
    			).relativeTo(getClass());
//    	return Karate.run("VietnamSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UzbekistanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UruguaySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UnitedStatesSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UnitedKingdomSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UnitedArabEmiratesSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UkraineSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("UgandaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("TurksandcaicosSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("TurkeySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("TunisiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("TrinidadandTobagoSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("ThailandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("TanzaniaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("TaiwanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SwitzerlandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SwedenSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SriLankaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SpainSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SouthkoreaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SouthAfricaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SloveniaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SlovakiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SingaporeSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SerbiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SenegalSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("SaudiArabiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("RomaniaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("QatarSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PortugalSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PolandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PhilippinesSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PeurtoRicoSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PeruSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("ParaguaySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PanamaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("PakistanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("OmanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("NorwaySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("NigeriaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("NicaraguaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("NetherlandsSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("NamibiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MozambiqueSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MoroccoSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MongoliaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MexicoSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MauritiusSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MaltaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MaldivesSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("MalaysiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("LuxembourgSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("LithuaniaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("LebanonSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("LatviaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("LaosSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("KuwaitSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("KenyaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("KazakhstanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("JordanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("JapanSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("JamaicaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("ItalySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("IsraelSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("IrelandSFTPMT103FILEGENERATION").relativeTo(getClass());	
//    	return Karate.run("IndonesiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("IcelandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("HungarySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("HongKongSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("HondurasSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("HaitiSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("GuyanaSFTPMT103FILEGENERATION").relativeTo(getClass());//
//    	return Karate.run("GuatemalaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("GreeceSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("GhanaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("GermanySFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("GeorgiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("FranceSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("FinlandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("EstoniaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("ElSalvadorSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("EgyptSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("EcuadorSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("DominicanRepublicSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("DenmarkSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CzechRepublicSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CyprusSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CuracaoSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CroatiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CostaRicaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CoteDivoireSFTPMT103FILEGENERATION").relativeTo(getClass());
//  	return Karate.run("ColombiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("Chin	aSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("ChileSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CaymanIslandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CanadaUSDSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CanadaCADSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("CambodiaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("BulgariaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("BritishVirginIslandSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("BrazilSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("BotswanaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("BosniaandHerzegovinaSFTPMT103FILEGENERATION").relativeTo(getClass());
//    	return Karate.run("BoliviaSFTPMT103FILEGENERATION").relativeTo(getClass());
// return Karate.run("BermudaSFTPMT103FILEGENERATION").relativeTo(getClass());
    }    

}
