import pytest, sqlite3
from webtest import TestApp
import todo

#test the connexion to the database
def test_db_connexion():
    try:
        with sqlite3.connect("todo.db") as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM todo")
            tables = cursor.fetchall()
            assert tables is not None
    except sqlite3.Error as e:
        pytest.fail(str(e))

#test to check if the database has the good coloumn names
def test_db_good_fields():
    try:
        with sqlite3.connect("todo.db") as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM todo")
            rows = cursor.fetchall()
            colnames = [desc[0] for desc in cursor.description]
            assert colnames == ['id', 'task', 'status']
    except sqlite3.Error as e:
        pytest.fail(str(e))


@pytest.fixture
def app():
    app = TestApp(todo.app)
    return app

def test_functionnal_API(app):
    assert app.get('/feed').status == '302 Found'

