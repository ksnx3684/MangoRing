<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
  <!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<title>Insert title here</title>
</head>
<body>
	<h1>Res add page</h1>
	
	<div class="container-md">
		<form action="./add" method="post" enctype="multipart/form-data">
		<input type="text" name="id" value="${member.id }" hidden="">
		
		<div class="input-group mb-3">
		  <span class="input-group-text" id="inputGroup-sizing-default">Title</span>
		  <input type="text" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div>
		  <textarea id="resNoticeDetail" name="contents"></textarea>
		</div>
		
		
		<div class="mb-3">
		  <label for="formFile" class="form-label"></label>
		  <input class="form-control" type="file" id="formFile">
		</div>
		
		
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="button">목록</button>
		</form>
	
	</div>
	
	<script type="text/javascript" src="../resources/js/fileAdd.js"></script>
	<script type="text/javascript" src="../resources/js/summernote.js"></script>
	<script type="text/javascript">
  $('#resNoticeDetail').summernote({
	  height : 300
	});
	</script>
	<script type="text/javascript">
	summernotInit("contents", "");
</script>
</body>
</html>