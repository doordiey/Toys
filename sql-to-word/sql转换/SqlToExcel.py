# -*- coding:gbk -*-
from docx import Document
import os

# 提取txt文本创建语句的信息，包括表名及字段信息
def transfer():
    path = "sql.txt"
    f = open(path, encoding='utf-8')
    tablename = ""
    column = {}
    for x in f:
        # print(x)
        if "create table" in x:
            x = x.split(' ')
            tablename = x[-1]
        else:
            x = x.split(' ')
            # print(x)
            if len(x) == 1:
                print("这行只有括号，跳过")
            else:
                for m in range(4, 6):
                    if "(" in x[m]:
                        y = x[m].split('(')
                        column[x[m-1]]['type'] = y[0]
                        # print(y)
                        if y[0] == 'VARCHAR2':
                            column[x[m-1]]['length'] = y[1]
                        for z in y:
                            if ")" in z:
                                # print(z)
                                zi = z.split(")")
                                # print(zi)
                                column[x[m-1]]['length'] = zi[0]
                    else:
                        column[x[m]] = {}
    print(tablename)
    return column, tablename

def get_common():
    column, tablename = transfer()
    path = "common.txt"
    f = open(path, encoding='gbk')
    for x in f:
        if '.' in x:
            x = x.split('.')
            need = x[1]
            m = need.split(' ')
            print(m[2].split('\''))
            # print(m[2])
            print(column)
            mna = m[0]
            column[mna]['common'] = m[2].split('\'')[1]
            # print(column)
    return column, tablename


def to_word():
    column, tablename = get_common()
    document = Document()
    table = document.add_table(rows=len(column)+1, cols=6, style='Table Grid')
    hc = table.rows[0].cells
    hc[0].text = '字段名称'
    hc[1].text = '数据类型'
    hc[2].text = '长度'
    hc[3].text = '是否必填'
    hc[4].text = '主键'
    hc[5].text = '备注说明'
    m = 1
    # print(column)
    for x in column.keys():
        # print(m)
        mx = table.rows[m].cells
        mx[0].text = x
        if 'type' in column[x]:
            mx[1].text = column[x]['type']
        if 'length' in column[x]:
            mx[2].text = column[x]['length']
        if 'common' in column[x]:
            mx[5].text = column[x]['common']
        m += 1
        tablename = tablename.replace("\n", "")
    document.save(tablename + ".docx")


if __name__ == '__main__':
    to_word()
    # get_common()