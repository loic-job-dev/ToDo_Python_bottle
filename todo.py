import sqlite3
from bottle import Bottle, template, request

app = Bottle()

@app.get('/todo')
def todo_list():
    show = request.query.show or 'open'
    match show:
        case 'open':
            db_query = "SELECT id, task FROM todo WHERE status LIKE '1'"
        case 'closed':
            db_query = "SELECT id, task FROM todo WHERE status LIKE '0'"
        case 'all':
            db_query = "SELECT id, task FROM todo"
        case _:
            return template('message.tpl',
                            message='Wrong query parameter: show must be either open, closed or all.')
    with sqlite3.connect('todo.db') as connection:
        cursor = connection.cursor()
        cursor.execute(db_query)
        result = cursor.fetchall()
    output = template('show_tasks.tpl', rows=result)
    return output

@app.route('/new', method=['GET', 'POST'])
def new_task():
    if request.POST:
        new_task = request.forms.task.strip()
        with sqlite3.connect('todo.db') as connection:
            cursor = connection.cursor()
            cursor.execute("INSERT INTO todo (task,status) VALUES (?,?)", (new_task, 1))
            new_id = cursor.lastrowid
        return template('message.tpl',
            message=f'The new task was inserted into the database, the ID is {new_id}')
    else:
        return template('new_task.tpl')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug = True, reloader = True)