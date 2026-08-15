import { test, expect } from '@playwright/test';

test('creates order and processes via worker', async ({ page }) => {
  await page.goto('/');

  // Expect title
  await expect(page.locator('h1')).toContainText('Postgres + RabbitMQ');

  // Verify mock data is there
  await expect(page.getByText('Hung Vu')).toBeVisible({ timeout: 10000 });

  // Fill the form to place a new order
  await page.fill('input[placeholder="e.g. Hung Vu"]', 'Test User');
  await page.fill('input[placeholder="e.g. Laptop"]', 'Test Item');
  await page.fill('input[type="number"]', '5');
  
  await page.click('button[type="submit"]');

  // Order should appear as 'pending' very quickly, then 'processed' later (simulating async)
  await expect(page.getByText('Test User')).toBeVisible({ timeout: 10000 });
  
  // The background worker takes 3 seconds to process, so we wait and expect 'processed' status
  // Playwright's auto-retrying assertions are perfect for polling this
  // We look for the row containing Test User and check its status cell
  const row = page.locator('tr', { hasText: 'Test User' });
  await expect(row.locator('span', { hasText: 'processed' })).toBeVisible({ timeout: 15000 });
});
