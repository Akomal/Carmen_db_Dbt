
import pandas as pd
def data_extraction():


    for sheet_name, df in pd.read_excel(r"carmen_sightings.xlsx", index_col=None, sheet_name=None).items():
        df.to_csv(f'dbt_project/seeds/raw_{sheet_name}.csv', index=False, encoding='utf-8')




if __name__ == '__main__':
    data_extraction()


