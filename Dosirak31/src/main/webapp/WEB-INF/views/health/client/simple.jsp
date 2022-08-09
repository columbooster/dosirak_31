<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

	 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <title>Document</title>
    <style>
* {
    border : 0;
    padding : 0;
}

ul {
    border:  1px solid rgb(235,236,239);
    border-bottom : 0;
}

li {
    background-color: #f9f9fa;
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;
}

#commentList {
    width : 50%;
    margin : auto;
}

.comment-content {
    overflow-wrap: break-word;
}

.comment-bottom {
    font-size:9pt;
    color : rgb(97,97,97);
    padding: 8px 0 8px 0;
}

.comment-bottom > a {
    color : rgb(97,97,97);
    text-decoration: none;
    margin : 0 6px 0 0;
}

.comment-area {
    padding : 0 0 0 46px;
}

.commenter {
    font-size:12pt;
    font-weight:bold;
}

.commenter-writebox {
    padding : 15px 20px 20px 20px;
}

.comment-img {
    font-size:36px;
    position: absolute;
}

.comment-item {
    position:relative;
}

.up_date {
    margin : 0 8px 0 0;
}

#comment-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
}

textarea {
    display: block;
    width: 100%;
    min-height: 17px;
    padding: 0 20px;
    border: 0;
    outline: 0;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    overflow-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
}

#comment-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

.btn {
    font-size:10pt;
    color : black;
    background-color: #eff0f2;
    text-decoration: none;
    padding : 9px 10px 9px 10px;
    border-radius: 5px;
    float : right;
}

#btn-write-comment, #btn-write-reply { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-reply { 
    background-color: #eff0f2;
    margin-right : 10px;
}

#btn-write-modify { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-modify { 
    margin-right : 10px;
}

#reply-writebox {
    display : none;
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#reply-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

#modify-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#modify-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

    </style>
</head>
<body>
    <div id="commentList">
        <ul>
            <li class="comment-item" data-cno="1" data-bno="1070">
                <span class="comment-img">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </span>
                <div class="comment-area">
                    <div class="commenter">asdf</div>
                    <div class="comment-content">asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
                    </div>
                    <div class="comment-bottom">
                        <span class="up_date">2022.01.01 23:59:59</span> 
                        <a href="#" class="btn-write"  data-cno="1" data-bno="1070" data-pcno="">답글쓰기</a>
                        <a href="#" class="btn-modify" data-cno="1" data-bno="1070" data-pcno="">수정</a>
                        <a href="#" class="btn-delete" data-cno="1" data-bno="1070" data-pcno="">삭제</a>
                    </div>    
                </div>
            </li>
            <li class="comment-item" data-cno="2" data-bno="1070">
                <span class="comment-img">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </span>
                <div class="comment-area">
                    <div class="commenter">qwer</div>
                    <div class="comment-content">ㄹㅇㄴㄴㅇㄹ
                    </div>
                    <div class="comment-bottom">
                        <span class="up_date">2022.01.01 23:59:59</span> 
                        <a href="#" class="btn-write"  data-cno="2" data-bno="1070" data-pcno="">답글쓰기</a>
                        <a href="#" class="btn-modify" data-cno="2" data-bno="1070" data-pcno="">수정</a>
                        <a href="#" class="btn-delete" data-cno="2" data-bno="1070" data-pcno="">삭제</a>
                    </div>    
                </div>
            </li>            
        </ul>
       
        <div id="comment-writebox">
            <div class="commenter commenter-writebox">${id}</div>
            <div class="comment-writebox-content">
                <textarea name="" id="" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
            </div>
            <div id="comment-writebox-bottom">
                <div class="register-box">
                    <a href="#" class="btn" id="btn-write-comment">등록</a>
                </div>
            </div>
        </div>
    </div>
    <div id="reply-writebox">
        <div class="commenter commenter-writebox">${id}</div>
        <div class="reply-writebox-content">
            <textarea name="" id="" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
        </div>
        <div id="reply-writebox-bottom">
            <div class="register-box">
                <a href="#" class="btn" id="btn-write-reply">등록</a>
                <a href="#" class="btn" id="btn-cancel-reply">취소</a> 
            </div>
        </div>
    </div>
    <div id="modalWin" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>
            <h2> | 댓글 수정</h2>
            <div id="modify-writebox">
                <div class="commenter commenter-writebox"></div>
                <div class="modify-writebox-content">
                    <textarea name="" id="" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>
                </div>
                <div id="modify-writebox-bottom">
                    <div class="register-box">
                        <a href="#" class="btn" id="btn-write-modify">등록</a>
                    </div>
                </div>
            </div>
            </p>
        </div>
    </div>
    <script>
        let id = 'asdf';

        let addZero = function(value=1){
            return value > 9 ? value : "0"+value;
        }

        let dateToString = function(ms=0) {
            let date = new Date(ms);

            let yyyy = date.getFullYear();
            let mm = addZero(date.getMonth() + 1);
            let dd = addZero(date.getDate());

            let HH = addZero(date.getHours());
            let MM = addZero(date.getMinutes());
            let ss = addZero(date.getSeconds());          

            return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;            
        }

        $(document).ready(function(){
            $("a.btn-write").click(function(e){
                let target = e.target;
                let cno = target.getAttribute("data-cno")
                let bno = target.getAttribute("data-bno")

                let repForm = $("#reply-writebox");
                repForm.appendTo($("li[data-cno="+cno+"]"));
                repForm.css("display", "block");
                repForm.attr("data-pcno", pcno);
                repForm.attr("data-bno",  bno);
            });

            $("#btn-cancel-reply").click(function(e){
                $("#reply-writebox").css("display", "none");
            });

            $("a.btn-modify").click(function(e){
                let target = e.target;
                let cno = target.getAttribute("data-cno");
                let bno = target.getAttribute("data-bno");
                let pcno = target.getAttribute("data-pcno");
                let li = $("li[data-cno="+cno+"]");
                let commenter = $(".commenter", li).first().text();
                let comment = $(".comment-content", li).first().text();

                $("#modalWin .commenter").text(commenter);
                $("#modalWin textarea").text(comment);
                $("#btn-write-modify").attr("data-cno", cno);
                $("#btn-write-modify").attr("data-pcno", pcno);
                $("#btn-write-modify").attr("data-bno", bno);

                // 팝업창을 열고 내용을 보여준다.
                $("#modalWin").css("display","block");
            });

            $("a.btn-delete").click(function(e){
                alert("delete");
            });

            $("#btn-write-modify").click(function(){
                // 1. 변경된 내용을 서버로 전송
                // 2. 모달 창을 닫는다. 
                $(".close").trigger("click");
            });

            $(".close").click(function(){
                $("#modalWin").css("display","none");
            });
        });
    </script>
</body>
</html>

</html>