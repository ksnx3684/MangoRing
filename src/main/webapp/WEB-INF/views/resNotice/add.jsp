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
	
	<div class="input-group mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-default">Title</span>
	  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
	</div>
	
	<div>
		<form method="post">
	  <textarea id="resNoticeDetail" name="resNoticeDetail"></textarea>
		</form>
	</div>
	
	
	<div class="mb-3">
	  <label for="formFile" class="form-label"></label>
	  <input class="form-control" type="file" id="formFile">
	</div>
	
	
	<button type="button">등록</button>
	<button type="button">목록</button>
	
	</div>
	<script type="text/javascript">
  $('#resNoticeDetail').summernote({
	  height : 300
	});
	</script>
</body>
</html>