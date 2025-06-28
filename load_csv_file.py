import pandas as pd
from sqlalchemy import create_engine

conn_string = 'postgresql+psycopg2://postgres:varsha%40123@localhost:5432/uber'
db = create_engine(conn_string)
conn = db.connect()

df = pd.read_csv('dataset/uber_request_data.csv')
print(df.info)

df.to_sql('uber_request_data', con=conn, if_exists='replace', index=False
          )

