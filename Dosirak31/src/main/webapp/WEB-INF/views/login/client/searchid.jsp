<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

      <link rel="shortcut icon" href="/resources/images/common/icon.png"/>
      <link rel="apple-touch-icon" href="/resources/images/common/icon.png"/>
      
      <title>login.jsp</title>

      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      
      <style type="text/css">
         header{
                display:flex;
                justify-content: center;
            }
            h2{
               font-weight: bold;
            }
            form{
                padding:10px;
            }
            .input-box{
                position:relative;
                margin:10px 500px;
            }
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:100%;
            }
            input::placeholder{
                color:transparent;
            }
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;

            }
            input:focus + label, label{
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            input[type=submit]{
                background-color: gray;
                border:none;
                color:white;
                border-radius: 5px;
                width:37%;   
                height:70px;
                font-size: 16pt;
                font-weight:bold;
                margin-top:40px;
                text-align: center;
                display :inline-block;
            }
            .return{
                text-align: center;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            #btn{
               text-align: center
            }
            #error{ color : red; font-size: 3px; text-align:center;}
         
      </style>
      
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

      <script type="text/javascript">
      $(function(){
         $("#idFindBtn").click(function(){
            
            if($("#client_name").val().replace(/\s/g, "") == ""){
               
               let result = "이름은 필수 입력 항목 입니다.";
               $("#error").show();
               $("#error").html(result);
               
               $("#client_name").click(function(){
                  
                  $("#error").html("");
                  
               })
               
               
               return false;
               
            }else if($("#client_phone").val().replace(/\s/g, "") == ""){
               let result = "전화번호는 필수 입력 항목 입니다.";
               $("#error").show();
               $("#error").html(result);
               
               $("#client_phone").click(function(){
                  
                  $("#error").html("");
                  
               })
               
               return false;
               
            }else{
            
            $("#idSearchForm").submit();
            }
         });
      });
       
      </script>
</head>
<body>
   <div id="container">
            <header>
            <h2>아이디 찾기</h2>
           </header><br/>
           <p id = "error"></p>
   
        <form action="/client/idconfirm" method="POST" id="idSearchForm">


            <div class="input-box">
                <input id="client_name" type="text" name="client_name" placeholder="아이디">
                <label for="client_name">이름</label>
            </div>

            <div class="input-box">
                <input id="client_phone" type="text" name="client_phone" placeholder="전화번호">
                <label for="client_phone">전화번호</label>
            </div><br/><br/>
            
             </form>
         <div class ="return">
               <span><a href="/client/searchpw">비밀번호 찾기</a></span> | <span><a href="/client/loginmain">로그인 하기</a></span>
            </div>
            
            <div id="btn"> 
            <input type="submit" id="idFindBtn"value="아이디 찾기">
         </div>
         
   </div><br/><br/><br/><br/><br/>
</body>
</html>