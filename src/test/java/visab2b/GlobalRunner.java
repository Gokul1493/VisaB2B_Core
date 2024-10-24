package visab2b;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class GlobalRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:visab2b/TestScript_MT103")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
