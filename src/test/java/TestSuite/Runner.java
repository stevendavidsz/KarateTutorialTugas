package TestSuite;
import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    public Karate runMealplan(){
        return Karate.run("mealPlan/mealPlan").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runMiscplan(){
        return Karate.run("recipe/recipe").relativeTo((getClass()));
    }

}
