import pyodbc

def get_connection():
    conn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=DESKTOP-BR1OTKD;'
        'DATABASE=Kaya_Drop;'
        'Trusted_Connection=yes;'
    )
    return conn
