# NBA Stats Analysis Project

## Overview

This project involves scraping NBA team statistics from Basketball Reference for seasons 2010 to 2024, migrating the data to a Microsoft SQL Server database, and analyzing various performance metrics over time. The analysis focuses on shot distribution, efficiency metrics, and league trends in True Shooting Percentage (TS%).

## Project Structure

1. **Data Scraping and Migration**:
   - **NbaStatsScrape.py**: Contains a Python function to scrape NBA statistics from Basketball Reference for the specified seasons and save the data to a pandas DataFrame.
   - **MigrateToMSSQL.py**: Defines a function to migrate the scraped data from pandas DataFrame to an MSSQL database using SQLAlchemy.

2. **SQL Queries**:
   - **Shot Distribution Analysis**: Compares team-level 2-point and 3-point shot percentages against league averages.
   - **Points Percentage Analysis**: Evaluates the percentage of total points coming from 2-pointers and 3-pointers over seasons.
   - **Efficiency Metrics**: Analyzes the evolution of field goal percentage, 2-point percentage, 3-point percentage, and free throw percentage.
   - **True Shooting Percentage Trend**: Shows the trend of True Shooting Percentage across seasons.

## Installation

1. **Python Dependencies**:
   - Install the required Python libraries using pip:
     ```bash
     pip install beautifulsoup4 requests pandas sqlalchemy pyodbc
     ```

2. **Database Setup**:
   - Ensure you have a Microsoft SQL Server instance running and accessible.
   - Adjust the connection string in `MigrateToMSSQL.py` to match your SQL Server setup.

## Usage

1. **Run the Scraping and Migration Script**:
   - Ensure the necessary Python files are in the same directory.
   - Execute the main script to scrape NBA stats and migrate the data to MSSQL:
     ```bash
     python main_script.py
     ```

2. **SQL Queries**:
   - Use the provided SQL queries to analyze the data stored in the `NBAStats` table. You can run these queries in your SQL Server Management Studio (SSMS) or any other SQL client connected to your database.

## Examples

- **Shot Distribution Analysis**: Understand how team strategies in shot attempts (2-pointers vs 3-pointers) have evolved and compare them with league averages.
- **Points Percentage Analysis**: Analyze the percentage of points derived from 2-pointers and 3-pointers and observe changes over time.
- **Efficiency Metrics**: Track the changes in shooting efficiency metrics like field goal percentage and free throw percentage over different seasons.
- **True Shooting Percentage Trend**: Evaluate how the overall efficiency in scoring (True Shooting Percentage) has shifted across seasons.

## Conclusion

This project demonstrates the power of SQL and Python for sports data analysis, showcasing how historical NBA stats can be leveraged to uncover trends and insights. By exploring shot distribution, efficiency metrics, and league averages, users can gain a deeper understanding of how team performance and strategies have evolved over time.

Feel free to adapt and extend this project according to your needs, and explore additional metrics or analysis methods.y 

## Visualization

I have created an interactive visualization that illustrates the trends in NBA teams' reliance on three-point shooting and their efficiency over time (2010-2024). You can explore the data story on Tableau Public using the link below:

[Explore the NBA Stats Visualization](https://public.tableau.com/views/NbaStats_17243274695210/Story1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

Feel free to dive into the visualizations and analyze how NBA gameplay has evolved, especially in terms of three-point efficiency.


## Contact

For any questions or further assistance, please contact [Joshua Isaiah Caballero] at [joshuaisaiah.caballero@gmail.com].
