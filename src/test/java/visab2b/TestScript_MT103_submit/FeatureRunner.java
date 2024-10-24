package visab2b.TestScript_MT103_submit;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Unitedstates_MT103_submit").relativeTo(getClass());
    }    

}
