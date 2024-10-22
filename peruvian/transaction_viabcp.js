import { By, Key } from 'selenium-webdriver';
import { driver, test, markers } from 'thousandeyes';

runScript();

async function runScript() {

    await configureDriver();

    const settings = test.getSettings();

    markers.start('inicio');
    // Load page
    await driver.get(settings.url);
    // Click on 'Aceptar todo'
    await click(By.css(`.bcp_grupo_botones > [data-translate="true"]:nth-child(2)`));
    await driver.takeScreenshot();
    markers.stop('inicio');

    markers.start('productosTarjetasDeuda');
    // Click on 'Productos'
    await click(By.css(`.con_opciones > .bcp_titulo_categoria`));
    // Click on 'Tarjetas'
    await click(By.css(`[aria-label="Tarjetas"]`));
    // Click on 'Compra Deuda'
    await click(By.css(`[data-id-producto="fd0ad79f-6a99-4fc6-ac0a-6cddb531a90c"] li:nth-child(8) > [data-translate="true"]`));
    await driver.takeScreenshot();
    markers.stop('productosTarjetasDeuda');


    markers.start('beneficiosCuentaSueldo');
    // Click on 'Beneficios'
    await click(By.css(`.bcp_categoria:nth-child(3) > .bcp_titulo_categoria`));
    // Click on 'Mundo Cuenta Sueldo'
    await click(By.css(`[aria-label="Mundo Cuenta Sueldo"] > [data-translate="true"]`));
    await driver.takeScreenshot();
    markers.stop('beneficiosCuentaSueldo');

    markers.start('bancaInternet');
    // Click on 'Banca por Internet'
    await click(By.css(`[href="https://bcpzonasegura.viabcp.com/"]:nth-child(2) > span`));
    // Click on 'Empresa'
    await click(By.css(`[value="2"] .custom-control-label-radio`));
    await driver.takeScreenshot();
    // Click on 'Persona'
    await click(By.css(`[value="1"] .custom-control-label-radio`));
    await driver.takeScreenshot();
    markers.stop('bancaInternet');

    // Click on 'end'
    markers.start('end');
    await click(By.css(`.btn-text-secondary .paragraph-md`));
    await driver.takeScreenshot();
    markers.stop('end');
}

async function configureDriver() {
    await driver.manage().setTimeouts({
        implicit: 7 * 1000, // If an element is not found, reattempt for this many milliseconds
    });
}

async function click(selector) {
    await simulateHumanDelay();

    const configuredTimeouts = await driver.manage().getTimeouts();
    const clickAttemptEndTime = Date.now() + configuredTimeouts.implicit;

    await reattemptUntil(attemptToClick, clickAttemptEndTime);

    async function attemptToClick() {
        await driver.findElement(selector)
            .click();
    }
}

async function reattemptUntil(attemptActionFn, attemptEndTime) {
    const TIME_BETWEEN_ATTEMPTS = 100;
    let numberOfAttempts = 0;
    let attemptError;
    while (Date.now() < attemptEndTime || numberOfAttempts === 0) {
        try {
            numberOfAttempts += 1;
            await attemptActionFn();
        }
        catch (error) {
            attemptError = error;
            await driver.sleep(TIME_BETWEEN_ATTEMPTS);
            continue; // Attempt failed, reattempt
        }
        attemptError = null;
        break; // Attempt succeeded, stop attempting
    }

    const wasAttemptSuccessful = !attemptError;
    if (!wasAttemptSuccessful) {
        throw attemptError;
    }
}

async function simulateHumanDelay() {
    await driver.sleep(550);
}