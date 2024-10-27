import { By, Key } from 'selenium-webdriver';
import { driver, test, markers } from 'thousandeyes';

runScript();

async function runScript() {
    await configureDriver();

    const settings = test.getSettings();

    // Load page and wait for full load
    await driver.get(settings.url);
    await waitForPageLoad();
    await blockPopups();  // Initial block popups
    await driver.takeScreenshot();

    // Click actions with markers and page load check before screenshots
    await performClickWithMarkers('AcceptarTodo', By.css(`.bcp_grupo_botones > [data-translate="true"]:nth-child(2)`));
    await performClickWithMarkers('Productos', By.css(`.con_opciones > .bcp_titulo_categoria`));
    await performClickWithMarkers('Tarjetas', By.css(`[aria-label="Tarjetas"]`));
    await performClickWithMarkers('TarjetasCredito', By.css(`[data-id-producto="fd0ad79f-6a99-4fc6-ac0a-6cddb531a90c"] li:nth-child(1) > [data-translate="true"]`));

    // Only call blockPopups where necessary
    await blockPopups();
    await driver.takeScreenshot();

    await performClickWithMarkers('SolucionesDigitales', By.css(`.bcp_categoria:nth-child(2) > .bcp_titulo_categoria`));
    await performClickWithMarkers('TarjetaCreditoIO', By.css(`[aria-label="Tarjeta de Cr\\E9 dito iO"] > [data-translate="true"]`));
    await blockPopups();
    await driver.takeScreenshot();

    await performClickWithMarkers('Beneficios', By.css(`.bcp_categoria:nth-child(3) > .bcp_titulo_categoria`));
    await performClickWithMarkers('MundoCuentaSueldo', By.css(`[aria-label="Mundo Cuenta Sueldo"] > [data-translate="true"]`));
    await driver.takeScreenshot();

    await performClickWithMarkers('BancaPorInternet', By.css(`.bcp_btn_banca:nth-child(2) > span`));
    await performClickWithMarkers('Empresa', By.css(`[value="2"] .custom-control-label-radio`));
    await performClickWithMarkers('Persona', By.css(`[value="1"] .custom-control-label-radio`));
    await driver.takeScreenshot();

    await performClickWithMarkers('Volver', By.css(`.btn-text-secondary .paragraph-md`));
    await driver.takeScreenshot();
}

async function configureDriver() {
    await driver.manage().setTimeouts({
        implicit: 5 * 1000, // 5 seconds implicit timeout
    });

    // Set window size for large desktop display
    await driver.manage().window().setRect({ width: 1920, height: 1080 });
}

// Function to wait for the page to fully load
async function waitForPageLoad() {
    await driver.wait(async () => {
        return await driver.executeScript('return document.readyState') === 'complete';
    }, 10000); // 10 seconds to wait for page load
}

// Perform click with markers, console logging, and page load check before screenshots
async function performClickWithMarkers(markerName, selector) {
    console.log(`Starting marker: ${markerName}`);
    markers.start(markerName);
    console.log(`Attempting click on ${markerName}`);
    await click(selector);
    markers.stop(markerName);
    console.log(`Completed click on ${markerName}`);

    // Ensure page is fully loaded before taking screenshot
    await waitForPageLoad();
    console.log(`Page loaded, taking screenshot for ${markerName}`);
    await driver.takeScreenshot();
}

// Basic click function with delay and retry
async function click(selector) {
    const configuredTimeouts = await driver.manage().getTimeouts();
    const clickAttemptEndTime = Date.now() + configuredTimeouts.implicit;

    await reattemptUntil(attemptToClick, clickAttemptEndTime);

    async function attemptToClick() {
        const element = await driver.findElement(selector);
        await driver.executeScript("arguments[0].scrollIntoView(true);", element);
        await element.click();
    }
}

async function reattemptUntil(attemptActionFn, attemptEndTime) {
    const TIME_BETWEEN_ATTEMPTS = 100;
    let attemptError;
    while (Date.now() < attemptEndTime) {
        try {
            await attemptActionFn();
            attemptError = null;
            break;
        } catch (error) {
            attemptError = error;
            await driver.sleep(TIME_BETWEEN_ATTEMPTS);
        }
    }
    if (attemptError) throw attemptError;
}

// Function to block popups, run only as needed
async function blockPopups() {
    console.log("Setting up the popup-closing function inside the browser.");
    await driver.executeScript(`
        (function closePopups() {
            var popups = document.querySelectorAll('button[aria-label="Close"], .popup-close');
            popups.forEach(function(popup) { popup.click(); });
            setTimeout(closePopups, 1000);
        })();
    `);
    console.log("Popup-closing function has been set up.");
}