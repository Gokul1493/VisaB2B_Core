package visab2b.TestScript_MT103;
import com.intuit.karate.junit5.Karate;

class FeatureRunner {

	// ReviewSubmit
	@Karate.Test
	Karate testUsers() {
		return Karate.run(

//				"Albania_MT103",
//				"Algeria_MT103",
//				"Angola_MT103",
//				"Antigua_MT103",
//				"Argentina_MT103",
//				"Armenia_MT103",
//				"Australia_MT103",
//				"Austria_MT103",
//				"Azerbaijan_MT103",
//				"Bahamas_MT103",
//				"BahrainANY_MT103",
//				"BahrainBHD_MT103",
//				"Bangladesh_MT103",
//				"Belarus_MT103",
//				"Belgium_MT103",
//				"Bermuda_MT103",
//				"Bolivia_MT103",
//				"BosniaandHerzegovina_MT103",
//				"Botswana_MT103",
//				"Brazil_MT103",
//				"BritishVirginIslands_MT103",
//				"Bulgaria_MT103",
//				"Cambodia_MT103",
//				"CanadaCAD_MT103",
//				"CanadaUSD_MT103",
//				"CaymanIslands_MT103",
//				"Chile_MT103",
//				"China_MT103",
				"Colombia_MT103",
//				"CostaRica_MT103",
//				"CoteDivoire_MT103",
//				"Croatia_MT103",
//				"Curacao_MT103",
//				"Cyprus_MT103",
//				"CzechRepublic_MT103",
//				"Denmark_MT103",
//				"DominicanRepublic_MT103",
//				"Ecuador_MT103",
//				"Egypt_MT103",
//				"ElSalvador_MT103",
//				"Estonia_MT103",
//				"Finland_MT103",
//				"France_MT103",
//				"Georgia_MT103",
//				"Germany_MT103",
//				"Ghana_MT103",
//				"Greece_MT103",
				"Guatemala_MT103",
//				"Guyana_MT103",
//				"Halti_MT103",
//				"Honduras_MT103",
//				"Hongkong_MT103",
//				"Hungary_MT103",
//				"Iceland_MT103",
//				"Indonesia_MT103",
//				"Ireland_MT103",
//				"Israel_MT103",
//				"Italy_MT103",
//				"Jamaica_MT103",
//				"Japan_MT103",
//				"Jordan_MT103",
//				"Kazakhstan_MT103",
//				"Kenya_MT103",
//				"Kuwait_MT103",
//				"Laos_MT103",
//				"Latvia_MT103",
//				"Lebanon_MT103",
//				"Lithuania_MT103",
//				"Luxembourg_MT103",
//				"Malaysia_MT103",
//				"Maldives_MT103",
//				"Malta_MT103",
//				"Mauritius_MT103",
//				"Mexico_MT103",
//				"Mongolia_MT103",
//				"Morocco_MT103",
//				"Mozambique_MT103",
//				"Namibia_MT103",
//				"Netherlands_MT103",
				"NewZealand_MT103",
//				"Nicaragua_MT103",
//				"Nigeria_MT103",
//				"Norway_MT103",
//				"Oman_MT103",
//				"Pakistan_MT103",
//				"Panama_MT103",
//				"Paraguay_MT103",
//				"Peru_MT103",
//				"Philippines_MT103",
//				"Poland_MT103",
//				"Portugal_MT103",
//				"PuertoRico_MT103",
//				"Qatar_MT103",
//				"Romania_MT103",
//				"SaudiArabia_MT103",
//				"Senegal_MT103",
//				"Serbia_MT103",
//				"Singapore_MT103",
//				"Slovakia_MT103",
//				"Slovenia_MT103",
//				"SouthAfrica_MT103",
				"SouthKorea_MT103",
//				"Spain_MT103",
//				"SriLanka_MT103",
//				"Sweden_MT103",
//				"Switzerland_MT103",
//				"Taiwan_MT103",
//				"Tanzania_MT103",
//				"Thailand_MT103",
//				"TrinidadandTobago_MT103",
				"Tunisia_MT103",
//				"Turkey_MT103",
//				"TurksandCaicosIslands_MT103",
//				"Uganda_MT103",
//				"Ukraine_MT103",
				"United Arab Emirates_MT103",
				"UnitedKingdom_MT103",
				"UnitedStates_MT103"
//				"Uruguay_MT103",
//				"Vietnam_MT103",
//				"Zambia_MT103",
//				"GetAuditsMT103ReviewSubmit"
				).relativeTo(getClass());

//		"Albania_MT103",
//		"Algeria_MT103",
//		"Angola_MT103",
//		"Antigua_MT103",
//		"Argentina_MT103",
//		"Armenia_MT103",
//		"Australia_MT103",
//		"Austria_MT103",
//		"Azerbaijan_MT103",
//		"Bahamas_MT103",
//		"BahrainANY_MT103",
//		"BahrainBHD_MT103",
//		"Bangladesh_MT103",
//		"Belarus_MT103",
//		"Belgium_MT103",
//		"Bermuda_MT103",
//		"Bolivia_MT103",
//		"BosniaandHerzegovina_MT103",
//		"Botswana_MT103",
//		"Brazil_MT103",
//		"BritishVirginIslands_MT103",
//		"Bulgaria_MT103",
//		"Cambodia_MT103",
//		"CanadaCAD_MT103",
//		"CanadaUSD_MT103",
//		"CaymanIslands_MT103",
//		"Chile_MT103",
//		"China_MT103",
//		"Colombia_MT103",
//		"CostaRica_MT103",
//		"CoteDivoire_MT103",
//		"Croatia_MT103",
//		"Curacao_MT103",
//		"Cyprus_MT103",
//		"CzechRepublic_MT103",
//		"Denmark_MT103",
//		"DominicanRepublic_MT103",
//		"Ecuador_MT103",
//		"Egypt_MT103",
//		"ElSalvador_MT103",
//		"Estonia_MT103",
//		"Finland_MT103",
//		"France_MT103",
//		"Georgia_MT103",
//		"Germany_MT103",
//		"Ghana_MT103",
//		"Greece_MT103",
//		"Guatemala_MT103",
//		"Guyana_MT103",
//		"Halti_MT103",
//		"Honduras_MT103",
//		"Hongkong_MT103",
//		"Hungary_MT103",
//		"Iceland_MT103",
//		"Indonesia_MT103",
//		"Ireland_MT103",
//		"Israel_MT103",
//		"Italy_MT103",
//		"Jamaica_MT103",
//		"Japan_MT103",
//		"Jordan_MT103",
//		"Kazakhstan_MT103",
//		"Kenya_MT103",
//		"Kuwait_MT103",
//		"Laos_MT103",
//		"Latvia_MT103",
//		"Lebanon_MT103",
//		"Lithuania_MT103",
//		"Luxembourg_MT103",
//		"Malaysia_MT103",
//		"Maldives_MT103",
//		"Malta_MT103",
//		"Mauritius_MT103",
//		"Mexico_MT103",
//		"Mongolia_MT103",
//		"Morocco_MT103",
//		"Mozambique_MT103",
//		"Namibia_MT103",
//		"Netherlands_MT103_submit",
//		"Netherlands_MT103",
//		"NewZealand_MT103",
//		"Nicaragua_MT103",
//		"Nigeria_MT103",
//		"Norway_MT103",
//		"Oman_MT103",
//		"Pakistan_MT103",
//		"Panama_MT103",
//		"Paraguay_MT103",
//		"Peru_MT103",
//		"Philippines_MT103",
//		"Poland_MT103",
//		"Portugal_MT103",
//		"PuertoRico_MT103",
//		"Qatar_MT103",
//		"Romania_MT103",
//		"SaudiArabia_MT103",
//		"Senegal_MT103",
//		"Serbia_MT103",
//		"Singapore_MT103",
//		"Slovakia_MT103",
//		"Slovenia_MT103",
//		"SouthAfrica_MT103",
//		"SouthKorea_MT103",
//		"Spain_MT103",
//		"SriLanka_MT103",
//		"Sweden_MT103",
//		"Switzerland_MT103",
//		"Taiwan_MT103",
//		"Tanzania_MT103",
//		"Thailand_MT103",
//		"TrinidadandTobago_MT103",
//		"Tunisia_MT103",
//		"Turkey_MT103",
//		"TurksandCaicosIslands_MT103",
//		"Uganda_MT103",
//		"Ukraine_MT103",
//		"United Arab Emirates_MT103",
//		"UnitedKingdom_MT103",
//		"UnitedStates_MT103",
//		"Uruguay_MT103",
//		"Vietnam_MT103",
//		"Zambia_MT103",
//		"GetAuditsMT103ReviewSubmit"
	}

}
