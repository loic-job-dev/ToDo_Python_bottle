%# template of the form for a new task
% rebase('base.tpl')

<h1 class="text-success mb-4">Add a new task to the ToDo list:</h1>

<form action="/new" method="post" class="row g-3 align-items-center mt-4">
  <div class="col-12 mb-3">
    <input type="text" name="task" size="100" maxlength="100" class="form-control" placeholder="Enter new task">
  </div>
  <div class="col-12">
    <button type="submit" name="save" value="save" class="btn btn-success">Save</button>
    <a href="/" class="btn btn-secondary ms-2">Back to tasks</a>
  </div>
</form>
