package visab2b.TestScript_corporate;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
//        return Karate.run("Zambia.feature").tags("@positive").relativeTo(getClass());
        return Karate.run("Zambia.feature","GetAuditAPI.feature").tags("@positive,@zambiaAudit").relativeTo(getClass());
    }    

}
//.tags("@positive,@withoutamount")
//@positive,@withoutPOP,@withoutamount
