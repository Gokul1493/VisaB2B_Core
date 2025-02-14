package visab2b;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

class GlobalRunner {

	@Test
	void testParallel() {
		Results results = Runner.path("classpath:visab2b/TestScript_MT103_RS")
				// .outputCucumberJson(true)
				.parallel(5);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

}
