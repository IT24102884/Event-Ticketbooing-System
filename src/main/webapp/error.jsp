<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            background-color: #ffeeee;
            font-family: Arial, sans-serif;
            color: #333;
            padding: 30px;
        }
        .error-box {
            border: 1px solid #cc0000;
            background-color: #fff0f0;
            padding: 20px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="error-box">
    <h2>Oops! Something went wrong.</h2>
    <p><strong>Error:</strong> ${pageContext.errorData.throwable}</p>
    <p>Please contact support or try again later.</p>
</div>
</body>
</html>
