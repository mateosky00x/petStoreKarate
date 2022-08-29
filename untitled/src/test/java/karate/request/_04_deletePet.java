package karate.request;

import com.intuit.karate.junit5.Karate;

public class _04_deletePet {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/_04_deletePet/deletePet.feature").relativeTo(getClass());
    }
}
