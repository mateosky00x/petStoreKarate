package karate.request;

import com.intuit.karate.junit5.Karate;

public class _06_loginUser {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/_06_loginUser/loginUser.feature").relativeTo(getClass());
    }
}
