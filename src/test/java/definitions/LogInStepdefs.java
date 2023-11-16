package definitions;

import dev.failsafe.internal.util.Assert;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;

import static org.hamcrest.MatcherAssert.assertThat;
import static support.DriverFactory.getDriver;

public class LogInStepdefs {
    @Then("I click on {string} page")
    public void iClick(String url) {
        getDriver().findElement(By.xpath("//a[contains(text(),'Log in')]"));



    }

    @Then("I open {string} page")
    public void iOpenPage(String arg0) {
        getDriver().get("https://env-jam.portnov.com/login?returnUrl=%2F");
    }

    @Then("I type {string} into email field")
    public void iTypeIntoEmailField(String email) {
        getDriver().findElement(By.xpath("//input[@id='Email']")).sendKeys(email);
    }

    @Then("I type {string} into password field")
    public void itypeIntoPasswordField(String password) {
        getDriver().findElement(By.xpath("//input[@id='Password']")).sendKeys(password);
    }

    @And("I click button {string}")
    public void iClickButton(String btn) {
        getDriver().findElement(By.xpath("//button[contains(text(),'Log in')]")).click();
    }

    @Then("I should see {string} button on upper header")
    public void iShouldSeeButtonOnUpperHeader(String MyAccount) {
        getDriver().findElement(By.xpath("//a[contains(text(),'My account')]")).sendKeys(MyAccount);
    }

    @Then("I get message-error {string}")
    public void iGetAllert(String error) {
        getDriver().getWindowHandles().contains(error);
    }

    @Then("I verify that password field is masked")
    public void iVerifyThatPasswordFieldIsMasked() {
        Assertions.assertThat(getDriver().findElement(By.xpath("//input[@id='Password']")).getAttribute("type").equals("password")).isTrue();
    }


    @Then("text {string} is displayed on the message error")
    public void textIsDisplayedOnTheMessageError(String expectedText) {
        getDriver().getWindowHandles().contains(expectedText);
        getDriver().findElement(By.xpath("//div[@class=\"message-error validation-summary-errors\"]")) ;
        expectedText="The password field is required.";

    }
}
