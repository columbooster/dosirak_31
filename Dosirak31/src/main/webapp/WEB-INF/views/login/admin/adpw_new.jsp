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
                color:#a5d610;
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
            	text-align: center;
            }
            #error{ color : red; font-size: 3px; text-align:center;}
            
            body{background-color:white;}
			
		</style>
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

		 <script type="text/javascript">
      $(function(){
    	  
    	  
         $("#newpwBtn").click(function(){
        	 

       	  let first_pw = $('input[name=first_pw]').val();
       	  let second_pw = $('input[name=second_pw]').val();
            
            if($("#first_pw").val().replace(/\s/g, "") == ""){
               
               let result = "?????????????????? ?????? ?????? ?????? ?????????.";
               $("#error").show();
               $("#error").html(result);
               
               $("#first_pw").click(function(){
                  
                  $("#error").html("");
                  
               })
               
               
               return false;
               
            }else if($("#second_pw").val().replace(/\s/g, "") == ""){
            	
               let result = "??????????????? ????????? ?????? ?????? ?????? ?????????.";
               
               $("#error").show();
               $("#error").html(result);
               
               $("#second_pw").click(function(){
                  
                  $("#error").html("");
                  
               })
               
               return false;
               
            }else if(first_pw != second_pw){
            	
            	let result = "??????????????? ???????????? ????????????.";
            	
            	$("#error").show();
                $("#error").html(result);
                
                $("#first_pw").click(function(){
                    
                    $("#error").html("");
                    
                 })
                 
                 $("#second_pw").click(function(){
                  
                  $("#error").html("");
                  
               })
                
            	return false;
            	
            }else{
            
            	$("#NewPwForm").submit();
            }
         });
      });	

		
      </script>
</head>
<body>
   <div id="container">
            <header>
            <h2>??????????????? ??????</h2>
           </header><br/>
           <p id = "error"></p>
   
        <form action="/admin/adpw_new" method="POST" id="NewPwForm">


            <div class="input-box">
                <input id="first_pw" type="password" name="first_pw" placeholder="???????????????">
                <label for="first_pw">???????????????</label>
            </div>

            <div class="input-box">
                <input id="second_pw" type="password" name="second_pw" placeholder="??????????????? ??????">
                <label for="second_pw">??????????????? ??????</label>
            </div><br/><br/>
            
            <input type="hidden" id = "admin_email" name="admin_email" value = "${admin_email}" />
            
            <div id="btn"> 
            	<input type="submit" id="newpwBtn" value="???????????? ??????" class="dosirakBtn">
         	</div>
            
            
        </form>
            
            
        
         
       
   </div>
</body>
</html>