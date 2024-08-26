from bs4 import BeautifulSoup
import requests
import pandas as pd
from io import StringIO

# automating through seasons 2024 - 2010
def nba_stats(start_year, end_year):
    all_stats = []
    for year in range(start_year, end_year-1, -1):
        url = f"https://www.basketball-reference.com/leagues/NBA_{year}.html"
        response = requests.get(url)
        data = BeautifulSoup(response.content, "html.parser")
        table = data.find("table", {"id": "totals-team"})
        
        #logic for checking if the table exists
        if table:
            table_str = str(table)
            table_io = StringIO(table_str)
            df = pd.read_html(table_io)[0]
            df['YearSeason'] = year
            all_stats.append(df)

    combined_stats = pd.concat(all_stats, ignore_index=True)
    #print(combined_stats.head()) #testcode
    return combined_stats