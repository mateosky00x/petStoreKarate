package karate.request;

import com.intuit.karate.junit5.Karate;

public class _03_updatePet {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/_03_updatePet/putPet.feature").relativeTo(getClass());
    }
}
