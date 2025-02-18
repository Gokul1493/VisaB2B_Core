package visab2b.visaTestScript_UI_FORM;


import com.intuit.karate.junit5.Karate;

class TestRunner {
    
	@Karate.Test
    Karate testUsers() {
        return Karate.run("AlgeriaMT").karateEnv("Visa").relativeTo(getClass());
    }    
	 

}
