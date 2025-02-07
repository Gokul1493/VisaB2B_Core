package visab2b.TestScript_corporate.baseFunctions;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("Add_OpsChecker_User").relativeTo(getClass());
    }

}
