package visab2b.SFTPMT103_files;

import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("albania","Antigua","Armenia","Laos","GetAuditAPI").relativeTo(getClass());
    }    

}

