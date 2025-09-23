%# template to generate a HTML table from a list of tuples
%rebase('base.tpl')

<h1 class="text-primary mb-4">The open items are as follows:</h1>

<div class="table-responsive">
  <table class="table table-striped table-bordered table-hover align-middle">
      <thead class="table-primary">
          <tr>
              <th scope="col">Id</th>
              <th scope="col">Task</th>
              <th scope="col">Actions</th>
          </tr>
      </thead>
      <tbody>
      %for row in rows:
        <tr>
        %for col in row:
          <td>{{col}}</td>
        %end
          <td>
            <a href="/edit/{{row[0]}}" class="btn btn-sm btn-warning me-2">Edit</a>
            <a href="/delete/{{row[0]}}" class="btn btn-sm btn-danger">Delete</a>
          </td>
        </tr>
      %end
      </tbody>
  </table>
</div>

<form action="/todo" method="get" class="row g-3 align-items-center mt-4">
  <div class="col-auto">
      <label for="showSelect" class="col-form-label">Filter tasks:</label>
  </div>
  <div class="col-auto">
      <select id="showSelect" name="show" class="form-select">
          <option value="all">All tasks</option>
          <option value="open">Open tasks</option>
          <option value="closed">Closed tasks</option>
      </select>
  </div>
  <div class="col-auto">
      <button type="submit" class="btn btn-primary">Display</button>
  </div>
</form>

<p class="mt-4">
  <a href="/new" class="btn btn-success">Add a new task</a>
</p>
<p class="mt-4">
    <a href="/feed" class="btn btn-success">Give me tasks !</a>
    <form action="/reset" method="post">
        <button type="submit" class="btn btn-primary">Let me rest in peace !</button>
    </form>
</p>