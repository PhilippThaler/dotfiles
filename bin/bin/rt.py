import psycopg2

# connect to the database
conn = psycopg2.connect("host=192.168.1.7 user=rtorrent password=Plangeross1* dbname=rt_timescale")

# query the database and get the results
with conn:
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM rtspeed")
        rows = cur.fetchall()

        # print the results
        i = 0
        for row in rows:
            i += 1
            print("no.: {}, time: {}, speed_type: {}, speed: {}".format(i, row[0], row[1], row[2]))
