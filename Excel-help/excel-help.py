import pandas as pd
import numpy as np

def kinds(filename):# 将所有数据按照指定的要求进行分类，摘取不同分类的行
    kinddic = {}
    df = pd.read_excel(filename,sheet_name='all')
    data = df.loc[:, ['公司名称']].values
    for a in range(data.size):
        if data[a][0] not in kinddic.keys():
            kinddic[data[a][0]] = [df.loc[a, :].values]
        else:
            kinddic[data[a][0]].append(df.loc[a, :].values)
    return kinddic, df

def write_sheets(kinddic, filename, df):
    writer = pd.ExcelWriter(filename, mode="a")
    df.to_excel(excel_writer=writer, sheet_name="all")
    writer.save()
    for m in kinddic.values():
        asheet = pd.DataFrame(m)
        asheet.to_excel(excel_writer=writer, sheet_name=m[0][0])
        writer.save()
    writer.close()

def Classification(filename):
    kinddic, df = kinds(filename)
    write_sheets(kinddic, filename, df)

if __name__ == "__main__":
    filename = "test/test.xlsx"
    Classification(filename)
