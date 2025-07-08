from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
import pandas as pd

# Set up Selenium options
options = Options()
options.add_argument("--headless")  # Run in headless mode
options.add_argument("--disable-gpu")
options.add_argument("--no-sandbox")

# Initialize the WebDriver
driver = webdriver.Chrome(options=options)

# Navigate to the commentary page (replace with actual URL of the first match)
url = "https://www.espncricinfo.com/series/ipl-2021-1249214/match-1/rcb-vs-mi-live-cricket-score"
driver.get(url)

# Wait for JavaScript to load
time.sleep(5)  # Adjust as necessary, based on your internet speed

# Extract commentary (assuming they are in divs with class 'live-comm')
commentary_divs = driver.find_elements(By.CSS_SELECTOR, '.live-comm')

commentary_data = []
for comm in commentary_divs:
    ball = comm.find_element(By.CSS_SELECTOR, '.ball').text.strip()
    description = comm.find_element(By.CSS_SELECTOR, '.description').text.strip()
    commentary_data.append([ball, description])

# Close the WebDriver
driver.quit()

# Convert to DataFrame
df = pd.DataFrame(commentary_data, columns=["Ball", "Description"])

# Print the first few rows
print(df.head())

# Save to CSV
df.to_csv("ball_by_ball_commentary.csv", index=False)
print("✅ Ball-by-ball commentary saved to 'ball_by_ball_commentary.csv'")
