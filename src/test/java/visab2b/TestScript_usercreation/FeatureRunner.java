package visab2b.TestScript_usercreation;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Add_OpsChecker_User").relativeTo(getClass());
    }    

}