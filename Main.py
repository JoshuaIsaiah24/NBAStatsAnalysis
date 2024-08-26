from MigrateToMSSQL import migrate_to_mssql
from NbaStatsScrape import nba_stats

if __name__== "__main__":
    start_year = 2024
    end_year = 2010
    
    # Scrape Data
    combined_stats = nba_stats(start_year, end_year)
    
    # Migrate to MSSQL
    migrate_to_mssql(combined_stats, 'Table_name', 'MSSQL_ServerName', 'Schema_Name')
    