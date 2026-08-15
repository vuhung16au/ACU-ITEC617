import { test, expect } from '@playwright/test';

test('has title and displays users from mongodb', async ({ page }) => {
  await page.goto('/');

  // Expect a title "to contain" a substring.
  await expect(page.locator('h1')).toContainText('MongoDB & Mongoose');

  // We should see the mock data users if the DB was seeded properly
  await expect(page.getByText('Hung Vu')).toBeVisible({ timeout: 10000 });
  await expect(page.getByText('Minh Nguyen')).toBeVisible({ timeout: 10000 });
});
