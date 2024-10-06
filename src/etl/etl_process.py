import pandas as pd
from src.database.db_utils import execute_query, fetch_data

def load_csv_to_df(file_path):
    return pd.read_csv(file_path)

def clean_data(df):
    # Perform any necessary data cleaning
    # For example:
    df['age'] = df['age'].fillna(df['age'].mean())
    df['gpa'] = df['gpa'].fillna(df['gpa'].mean())
    return df

def insert_data_to_db(df):
    for _, row in df.iterrows():
        query = """
        INSERT INTO cs_students 
        (student_id, name, gender, age, gpa, major, interested_domain, projects, future_career, python_skill, sql_skill, java_skill)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """
        params = tuple(row)
        execute_query(query, params)

def main():
    file_path = 'data/raw/cs_students.csv'
    df = load_csv_to_df(file_path)
    df_cleaned = clean_data(df)
    insert_data_to_db(df_cleaned)

if __name__ == "__main__":
    main()