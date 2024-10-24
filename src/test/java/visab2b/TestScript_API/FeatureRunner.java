package visab2b.TestScript_API;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("albania","Antigua","Armenia","Laos","GetAuditAPI").relativeTo(getClass());
    }    

}

