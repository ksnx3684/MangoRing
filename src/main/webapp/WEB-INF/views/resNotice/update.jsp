<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
	<h1>res update page</h1>
	
	
			<div class="container-md row mt-4">
		<form action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${vo.num}">
		  <div class="row mb-3">
		    <label for="title" class="col-sm-2 col-form-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" value="${vo.title}" name="title" class="form-control" id="title">
		    </div>
		  </div>

		 <div class="row mb-3">
		    <label for="contents" class="col-sm-2 col-form-label">Contents</label>
		    <div class="col-sm-10">
		      <textarea name="contents" class="form-control" id="contents">${vo.contents}</textarea>
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="files" class="col-sm-2 col-form-label">File</label>
		    <div class="col-sm-10">
		      <input type="file" name="files" class="form-control" id="files">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="files" class="col-sm-2 col-form-label">File</label>
		    <div class="col-sm-10">
		      <input type="file" name="files" class="form-control" id="files">
		    </div>
		  </div>
		  
		  
		  
		 
		  <button type="submit" class="btn btn-primary">수정</button>
		</form>
	
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>