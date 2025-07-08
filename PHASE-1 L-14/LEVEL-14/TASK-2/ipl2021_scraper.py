import requests
from bs4 import BeautifulSoup
import pandas as pd
url = "https://www.espncricinfo.com/series/ipl-2021-1249214/match-results"
headers = {
    'User-Agent': 'Mozilla/5.0'
}
response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.content, 'html.parser')
year = "2021"
series_type = "League"
series_name = "IPL 2021"

data = []
match_cards = soup.select('a.ds-no-tap-higlight')

for card in match_cards:
    try:
        match_href = "https://www.espncricinfo.com" + card['href']
        match_name = card.text.strip()

        parent = card.find_parent('div', class_='ds-px-4 ds-py-3')

        if not parent:
            continue

        desc = parent.find('span', class_='ds-text-tight-s')
        if not desc:
            continue

        desc_parts = [x.strip() for x in desc.text.split(",")]
        match_no = desc_parts[0] if len(desc_parts) > 0 else ""
        match_venue = desc_parts[1] if len(desc_parts) > 1 else ""
        match_date = ", ".join(desc_parts[2:]) if len(desc_parts) > 2 else ""

        teams = parent.select("p.ds-text-tight-m span")
        if len(teams) >= 2:
            match_team1 = teams[0].text.strip()
            match_team2 = teams[1].text.strip()
        else:
            match_team1 = match_team2 = ""

        match_type = "T20"
        match_datetime_start = match_date
        match_date_end = match_date

        data.append([
            year, series_type, series_name, match_no, match_type,
            match_name, match_href, match_team1, match_team2,
            match_datetime_start, match_date_end, match_venue
        ])
    except Exception as e:
        print(f"Error: {e}")

columns = [
    "year", "series_type", "series_name", "match_no", "match_type", "match_name",
    "match_href", "match_team1", "match_team2", "match_datetime_start", "match_date_end", "match_venue"
]
df = pd.DataFrame(data, columns=columns)

print(df.head())
df.to_csv("ipl_2021_matches.csv", index=False)
print(" Data saved to 'ipl_2021_matches.csv'")
