from playwright.sync_api import sync_playwright
import time

def register_render():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        
        # Go to Render signup
        page.goto('https://dashboard.render.com/register')
        time.sleep(2)
        
        # Fill signup form
        page.fill('input[type="email"]', 'lamhoabb2@gmail.com')
        page.fill('input[type="password"]', 'YOUR_PASSWORD_HERE')  # Need actual password
        
        # Click signup
        page.click('button[type="submit"]')
        time.sleep(3)
        
        print("✓ Signup form submitted")
        print("⚠ Check email lamhoabb2@gmail.com for verification link")
        
        # Keep browser open
        input("Press Enter after verifying email...")
        
        browser.close()

if __name__ == '__main__':
    register_render()
