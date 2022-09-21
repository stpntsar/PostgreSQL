import psycopg2


def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client(
        client_id SERIAL PRIMARY KEY,
        client_name VARCHAR(30) NOT NULL,
        client_surname VARCHAR(30) NOT NULL,
        client_mail VARCHAR(60) UNIQUE);
        """)
        cur.execute("""
        CREATE TABLE IF NOT EXISTS phone(
        phone_id SERIAL PRIMARY KEY,
        phone_number INTEGER UNIQUE,
        client_id INTEGER REFERENCES client(client_id)
        );
        """)


def add_client(conn, name, surname, mail, phone=None):
    with conn.cursor() as cur:
        cur.execute(f" INSERT INTO client (client_name, client_surname, client_mail) VALUES( '{name}', '{surname}', '{mail}') RETURNING client_id;")
        id = cur.fetchone()
        conn.commit()
    if phone is not None:
        with conn.cursor() as cur:
            cur.execute(f" INSERT INTO phone (phone_number, client_id) VALUES ('{phone}', '{id[0]}');")

def add_phone(conn, id, phone):
    with conn.cursor() as cur:
        cur.execute(f" INSERT INTO phone (phone_number, client_id) VALUES ('{phone}', '{id}');")

def change_client(conn, id, name=None, surname=None, mail=None, phone=None):
    with conn.cursor() as cur:
        if name is not None:
            cur.execute(f"UPDATE client SET client_name='{name}' WHERE client_id = '{id}' ")
        if surname is not None:
            cur.execute(f"UPDATE client SET client_surname='{surname}' WHERE client_id = '{id}'")
        if mail is not None:
            cur.execute(f"UPDATE client SET client_mail='{mail}' WHERE client_id = '{id}'")
        if phone is not None:
            cur.execute(f" INSERT INTO phone (phone_number, client_id) VALUES ('{phone}', '{id}');")

def delete_phone(conn, id, phone):
    with conn.cursor() as cur:
        cur.execute(f"DELETE FROM phone WHERE client_id='{id}' AND phone_number='{phone}';")

def delete_client(conn, id):
    with conn.cursor() as cur:
        cur.execute(f" DELETE FROM phone WHERE client_id='{id}'")
        cur.execute(f"DELETE FROM client WHERE client_id='{id}'")

def find_client(conn, name=None, surname=None, mail=None, phone=None):
    with conn.cursor() as cur:
        if mail is not None:
            cur.execute("""SELECT client_id, client_name, client_surname FROM client
            WHERE client_mail=%s""", (mail,))
            print(cur.fetchone())
        elif phone is not None:
            cur.execute("""SELECT client.client_id, client_name, client_surname FROM client
            JOIN phone ON phone.client_id=client.client_id
            WHERE phone_number=%s;
                        """, (phone,))
            print(cur.fetchone())
        elif name is not None and surname is not None:
            cur.execute("""SELECT client_id, client_name, client_surname FROM client 
            WHERE client_name=%s and client_surname=%s""", (name, surname))
            print(cur.fetchone())
        elif name is not None:
            cur.execute("""SELECT client_id, client_name, client_surname FROM client
            WHERE client_name=%s""", (name,))
            print(cur.fetchall())
        else:
            cur.execute("""SELECT client_id, client_name, client_surname FROM client
            WHERE client_surname=%s""", (surname,))
            print(cur.fetchall())

if __name__ == '__main__':

    with psycopg2.connect(database="dz5", user="postgres", password="postgres") as conn:
        create_db(conn)
        add_client(conn, 'oleg', 'sidorov', 'oleg@gmaim.com', 79991233245)
        add_client(conn, 'mihail', 'semenov', 'mihail@gmail.com', 79881234563)
        add_client(conn, 'vitalii', 'petrov', 'vitalii@gmail.com', 79771238812)
        add_phone(conn, '3', '7777777')
        change_client(conn, id=3, name='alex', surname='alexeev',mail='alex@gmail.com', phone='888999')
        delete_phone(conn, '3', '222')
        delete_client(conn, '3')
        find_client(conn, phone='111222')
        find_client(conn, mail='axel@gmail.com')
        find_client(conn, surname='alexeev')
        find_client(conn, name='alex')

    conn.close()