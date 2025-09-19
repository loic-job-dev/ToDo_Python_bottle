%# template for deleting a task
%# expects: "number" and "current_data"
% rebase('base.tpl')

<h1 class="text-danger mb-4">Delete the task with ID = {{number}}</h1>

<form action="/delete/{{number}}" method="post" class="card p-4 shadow-sm">
  <p class="mb-3">
    <strong>{{current_data[0]}}</strong>
  </p>
  <button type="submit" name="delete" value="delete" class="btn btn-danger">Delete</button>
  <a href="/" class="btn btn-secondary ms-2">Back to tasks</a>
</form>
