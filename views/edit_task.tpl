%# template for editing a task
%# expects: "number" and "current_data"
% rebase('base.tpl')

<h1 class="text-primary mb-4">Edit the task with ID = {{number}}</h1>

<form action="/edit/{{number}}" method="post" class="row g-3 align-items-center mt-4">
  <div class="col-12 mb-3">
    <input type="text" name="task" value="{{current_data[0]}}" size="100" maxlength="100"
           class="form-control">
  </div>
  <div class="col-12 mb-3">
    <select name="status" class="form-select">
      <option>open</option>
      <option>closed</option>
    </select>
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Save</button>
    <a href="/" class="btn btn-secondary ms-2">Display the tasks</a>
  </div>
</form>
