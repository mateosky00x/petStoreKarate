package karate.request;

import com.intuit.karate.junit5.Karate;

public class _05_createUser {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/_05_createUser/createUser.feature").relativeTo(getClass());
    }
}
