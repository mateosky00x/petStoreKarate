package karate.request;

import com.intuit.karate.junit5.Karate;

public class updatePet {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/putPet.feature").relativeTo(getClass());
    }
}
