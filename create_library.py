import libmysql as lib

def read_query(file, start=0):
    query = ''
    for i, line in enumerate(file[start:]):
        if line != '\n':
            if i==0: print(line)
            query += line.strip('\n')
        else:
            break
    return start + i + 1, query
    

def main():
    queries = []
    with open('create_database.sql', 'r') as f:
        start = 0
        file = f.readlines()
        while start < len(file):
            start, query = read_query(file, start)
            queries.append(query)

    connection = lib.db_connection()
    connection.execute_query_ch(queries[0])
    connection.execute_query_ch(queries[1])


if __name__ == '__main__':
    main()