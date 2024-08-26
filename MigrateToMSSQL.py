from sqlalchemy import create_engine, Table, Column, Integer, Float, String, MetaData
import pandas as pd

def migrate_to_mssql(df, table_name, server, database):
    connection_string = f"mssql+pyodbc://{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes"
    engine = create_engine(connection_string)

    # Define metadata and table
    metadata = MetaData()

    NbaStats = Table(
        table_name, metadata,
        Column('Rk', Float),
        Column('Team', String(250)),
        Column('G', Integer),
        Column('MP', Integer),
        Column('FG', Float),
        Column('FGA', Float),
        Column('FG%', Float),
        Column('3P', Float),
        Column('3PA', Float),
        Column('3P%', Float),
        Column('2P', Float),
        Column('2PA', Float),
        Column('2P%', Float),
        Column('FT', Float),
        Column('FTA', Float),
        Column('FT%', Float),
        Column('ORB', Float),
        Column('DRB', Float),
        Column('TRB', Float),
        Column('AST', Float),
        Column('STL', Float),
        Column('BLK', Float),
        Column('TOV', Float),
        Column('PF', Float),
        Column('PTS', Float),
        Column('YearSeason', Integer)
    )

    # Create table
    with engine.connect() as conn:
        metadata.create_all(engine)
    
    # Insert data
    df.to_sql(table_name, con=engine, if_exists='append', index=False)
