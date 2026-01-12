package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class KarateTest {
    @Test
    void testParallel() {
        Results results = Runner
                .path("classpath:features") 
                .tags("@criar, @criarf, @token, @tokenf, @deletar, @deletarf, @buscar, @buscarf, @listar,@listarf, @adicionar, @adicionarf, @alterar , @alterarf")             


                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
