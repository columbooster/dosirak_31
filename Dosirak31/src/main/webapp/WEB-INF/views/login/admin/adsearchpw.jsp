<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
		<style type="text/css">
		
			header{
                display:flex;
                justify-content: center;
                margin-top: 50px;
            }
            h2{
            	font-weight: bold;
            	color: black;
            	font-weight: bolder;
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
                color: #a5d610;
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
               
                width:37%;   
                height:70px;
                font-size: 16pt;
                font-weight:bold;
                margin-top:40px;
                display:inline-block;
                text-align:center;
                margin-bottom: 50px;
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
             
              body{background-color:white;}
			
			
		</style>
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

		<script type="text/javascript">
		$(function(){
			$("#searchPwBtn").click(function(){
				
				if($("#admin_id").val().replace(/\s/g, "") == ""){
					
					let result = "???????????? ?????? ?????? ?????? ?????????.";
					$("#error").show();
					$("#error").html(result);
					

					$("#admin_id").click(function(){
						
						$("#error").html("");
						
					})
					
					
					return false;
					
				}
				
				if($("#admin_name").val().replace(/\s/g, "") == ""){
					
					let result = "????????? ?????? ?????? ?????? ?????????.";
					$("#error").show();
					$("#error").html(result);
					

					$("#admin_name").click(function(){
						
						$("#error").html("");
						
					})
					
					
					return false;
					
				}
				
				if($("#admin_email").val().replace(/\s/g, "") == ""){
					let result = "???????????? ?????? ?????? ?????? ?????????.";
					$("#error").show();
					$("#error").html(result);
					

					$("#admin_email").click(function(){
						
						$("#error").html("");
						
					})
					
					
					return false;
					
				}
				
				$("#pwSearchForm").submit();
			});
		});
		 
		 
		
		</script>
</head>
<body>
	<div id="container">
            <header>
            <h2>Admin ???????????? ??????</h2>
        	</header><br/>
        	<p id = "error"></p>
	
        <form action="/admin/adpwconfirm" method="POST" id="pwSearchForm">

            <div class="input-box">
                <input id="admin_id" type="text" name="admin_id" placeholder="?????????">
                <label for="admin_id">?????????</label>
            </div>

            <div class="input-box">
                <input id="admin_name" type="text" name="admin_name" placeholder="??????">
                <label for="admin_name">??????</label>
            </div>
            
            <div class="input-box">
                <input id="admin_email" type="text" name="admin_email" placeholder="?????????">
                <label for="admin_email">?????????</label>
            </div><br/><br/>
            
			<div class ="return">
            	<span><a href="/admin/adsearchid">????????? ??????</a></span> | <span><a href="/admin/adminloginmain">????????? ??????</a></span>
            </div>
            
            <div id="btn"> 
            <input type="submit" value="???????????? ??????" id="searchPwBtn" class="dosirakBtn">
			</div>
			
        </form>
        </div>
</body>
</html>