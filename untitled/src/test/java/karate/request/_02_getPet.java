package karate.request;
import com.intuit.karate.junit5.Karate;


public class _02_getPet {
    @Karate.Test
    Karate testSample(){
        return  Karate.run("classpath:karate/request/_02_consultPet/getPet.feature").relativeTo(getClass());
    }
}
