#Copyright (c) 2024 VOLCHOK Evgeniia
#for contacts e.p.volchok@gmail.com

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#http://www.apache.org/licenses/LICENSE-2.0

"""
    Create the first version of the home library dabase
"""
import libmysql as lib

def read_query(file, start=0):
    """
    Read queries from file.sql to create tables.
    The file read in advance in the variable {file}.
    """
    query = ''
    for i, line in enumerate(file[start:]):
        if line != '\n':
            if i==0: print(line)
            query += line.strip('\n')
        else:
            break
    return start + i + 1, query
    

def main():

    connection = lib.db_connection()
    connection.use_database(database='db_home_library')

    with open('create_database.sql', 'r') as f:
        start = 0
        file = f.readlines()
        while start < len(file):
            start, query = read_query(file, start)
            if 'TABLE' in query:
                connection.execute_query_ch(query)


if __name__ == '__main__':
    main()