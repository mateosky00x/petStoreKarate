package karate.request;

import com.intuit.karate.junit5.Karate;

public class _01_postPet {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/_01_createPet/postPet.feature").relativeTo(getClass());
    }
}
