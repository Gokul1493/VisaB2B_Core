package visab2b.TestScript_FORM;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Albania_Form","Algeria_Form").relativeTo(getClass());
        
//      "Albania_Form","Algeria_Form","Angola_Form","Antigua_Form",
//		"Argentina_Form","Armenia_Form","Australia_Form","Austria_Form","Azerbaijan_Form",
//		"Bahamas_Form","Bahrain(Any Currency)_Form","Bahrain(BHD)_Form","Bangladesh_Form",
//		"Belarus_Form","Belgium_Form","Bermuda_Form","Bolivia_Form","Bosnia and Herzegovina_Form",
//		"botswana_Form","Brazil_Form","British Virgin Islands_Form","Bulgaria_Form",
//		"Cambodia_Form","Canada(CAD)_Form","Canada(USD)_Form","Cayman Islands_Form",
//		"Chile_Form","China_Form","Colombia_Form","Costa Rica_Form","Cote D’ivoire_Form","Croatia_Form",
//		"Curacao_Form","Cyprus_Form","Czech Republic_Form","Denmark_Form","Dominican Republic_Form",
//		"Ecuador_Form","Egypt_Form","El Salvador_Form","Estonia_Form","Finland_Form","France_Form",
//		"Georgia_Form","Germany_Form","GetAuditsform","Ghana_Form","Greece_Form","Guatemala_Form",
//		"Guyana_Form","Haiti_Form","Honduras_Form","Hong Kong_Form","Hungary_Form","Iceland_Form",
//		"Indonesia_Form","Ireland_Form","Israel_Form","Italy_Form","Jamaica_Form","Japan_Form","Jordan_Form",
//		"Kazakhstan_Form","Kenya_Form","Kuwait_Form","Laos_Form","Latvia_Form","Lebanon_Form","Lithuania_Form",
//		"Luxembourg_Form","Malaysia_Form","Maldives_Form","Malta_Form","Mauritius_Form","Mexico_Form","Mongolia_Form",
//		"Morocco_Form","Mozambique_Form","Namibia_Form","Netherlands_Form","New Zealand_Form","Nicaragua_Form","Nigeria_Form",
//		"Norway_Form","Oman_Form","Pakistan_Form","Panama_Form","Paraguay_Form","Peru_Form","Philippines_Form",
//		"Poland_Form","Portugal_Form","PuertoRico_Form","Qatar_Form","Romania_Form","Saudi Arabia_Form",
//		"Senegal_Form","Serbia_Form","Singapore_Form","Slovakia_Form","Slovenia_Form","South Africa_Form",
//		"South Korea_Form","Spain_Form","Sri Lanka_Form","Sweden_Form","Switzerland_Form","Taiwan_Form",
//		"Tanzania_Form","Thailand_Form","Trinidad and Tobago_Form","Tunisia_Form","Turkey_Form","Turks and Caicos Islands_Form",
//		"Uganda_Form","Ukraine_Form","United Arab Emirates_Form","United Kingdom_Form","United States_Form",
//		"Uruguay_Form","Vietnam_Form","Zambia_Form"
    }    

}
		