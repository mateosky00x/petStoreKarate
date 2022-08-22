package karate.request;

import com.intuit.karate.junit5.Karate;

public class postPet {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/postPet.feature").relativeTo(getClass());
    }
}
