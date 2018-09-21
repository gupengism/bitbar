
module.exports = {
    'Basic Test Example' : function (browser) {
        browser
            .url('https://bitbar.github.io/testdroid-samples/')
            .waitForElementVisible('body', 4000)
            .pause(2000)
            .assert.title("Bitbar - Test Page for Samples")
            .end();
    }
};
