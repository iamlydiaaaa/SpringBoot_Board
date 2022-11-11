<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세조회</title>
<style>
@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css");
/*   font-family: pretendard;    */


html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,textarea, input,select, option, button
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
margin: 0;
padding: 0;
border: 0;
font-size: 100%;
font: inherit;
vertical-align: baseline;
box-sizing: border-box;
font-family: "RIDIBatang","pretendard", sans-serif;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section,main {
display: block;
}
body {
line-height: 1;
}
ol, ul {
list-style: none;
}
blockquote, q {
quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
content: '';
content: none;
}
table {
border-collapse: collapse;
border-spacing: 0;
}
a:link, a:visited {text-decoration: none;}
a:hover, a:active {text-decoration: none;}
a{color: inherit}

.clearfix::after {content:"";display: table; clear: both}

.hidden{width: 0;height: 0;overflow: hidden;
    opacity: 0; visibility: hidden;
    font-size: 0; line-height: 0;
    position: absolute; left:-9999px;
}

input, textarea{
    outline: 1px solid transparent;
    transition: all 0.5s;
    background-color: #fafafa;
    padding: 10px;
}

input:focus{
    outline: 1px solid #c39a4c;
    background-color: #fff;
}
textarea:focus{
    outline: 1px solid #c39a4c;    
    background-color: #fff;
}


/*----섹션 제목----*/

.sec_tit{
    text-align: center;
	padding-top: 50px;
	margin-bottom: 30px;
}
/*부제목*/
.sec_tit span{
    display: block;
    margin-bottom: 12px;
    font-size: 16px;
    color: #c9ab81;
    line-height: 30px;
}
/*제목*/
.sec_tit h2{
    display: inline-block;
    position: relative;
    padding: 0 80px;
    font-size: 50px;
    color: #211e1f;
    font-weight: 500;
    letter-spacing: 3px;
    line-height: 1;
}

.sec_tit h2::before, .sec_tit h2::after{
    content: "";
    position: absolute;
    top: 50%;
    margin-top: -0.5px;
    width: 170px;
    height: 1px;
    background: #211e1f;
}
.sec_tit h2::before{right: 100%;}
.sec_tit h2::after{left: 100%;}


/*----섹션 제목 끝----*/


/* ===== 버튼 공통 ===== */
.btn_default{
    border: 1px solid #c9ab81;
    width: 160px;height: 45px;
    background-color: transparent;
    color: #88704f;
    transition: all 0.3s;
    position: relative;
    cursor: pointer;
}
@keyframes btnMove{
    0%{left: 60%; top: -3px;}
    16%{left: 99%; top: -3px;}
    32%{left: 99%; top: 98%;}
    68%{left: -3px; top: 98%;}
    84%{left: -3px; top: -3px;}
    100%{left: 60%; top: -3px;}
}
.btn_default::after{
    content: ""; display: block;
    width: 5px;height: 5px;
    background-color: #d1a361;
    position: absolute; 
    left: 60%;top: -3px;
    

}
/*==호버이펙트==*/
.btn_default:hover{
    text-shadow: 0 0 5px rgba(139, 116, 84, 0.2);
    letter-spacing: 1px;
}
.btn_default:hover::after{
    animation: btnMove linear 1.5s;
}

/*두번째 버튼 테마*/
.btn_2{
    width: 100%; 
    padding: 15px 0;
    background-color: #c9ab81;
    border: 1px solid #c9ab81;
    color: #fff;
    text-align: center;
    cursor: pointer;
    transition: all 0.3s;
}
.btn_2:hover{
    letter-spacing: 3px;
}

/*세번째 버튼 테마*/

.btn_3{
    width: 100%;
    padding: 15px 0;
    border: 1px solid #c9ab81;
    color: #c9ab81;
    background-color: #fff;
    text-align: center;
    cursor: pointer;
    transition: all 0.3s;
}
.btn_3:hover{
    letter-spacing: 3px;
    color: #666;
    border: 1px solid #666;
}

.btn_list{text-align: center;}
.btn_list li{width: 120px;  display: inline-block; margin: 50px 20px;}
.btn_list a{font-size: 0.9em;}

/* ===== 버튼 공통 끝 ===== */

/* ===================== BoardRegister 시작 ===================== */

#board_regist{
    margin-top: 100px;
    padding: 50px 100px; 
    border-top: 1px solid #333;
    border-bottom: 1px solid #333;
}

.board_write{
    width: 100%;
    margin-bottom: 50px;
}
.row { height: 60px;}
.row + .row{margin-top: 30px;}
.row p:nth-child(1){
	width: 200px; padding-top: 20px;
}
.board_write>div>p{
    float: left;  
    height: 100%;
}

.row p:nth-child(2){
    width: calc(100% - 200px);
}


.row_user_con{
	margin: 15px 0;
	font-size: 0.9em;
	color: #555;
}
.row_user_con>div{
	padding: 5px 0;
}
.row_user_con .board_date{ color: #df0808;}

.board_txt{ height: 250px;}

.board_write #title{ width: 100%;}
.board_write #content{ width: 100%; height: 250px;}
.board_write input, .board_write textarea{
    padding: 20px;
    box-sizing: border-box;
}

.submit_wrap{
    text-align: center;
}
.submit_wrap .btn_default{
    margin: 0 auto;
    display: inline-block;
}

/* ===================== BoardRegister 끝 ===================== */

</style>
</head>

<body>
    <main class="board_view">
        <div class="sec_tit">
            <span>궁금한 내용을 남겨주세요.</span>
            <h2>Q&amp;A</h2>
        </div>
        <section id="board_regist">
            <form action="updateBoard" method="post">
                <div class="board_write">
                    <div class="row">
                        <p class="board_tit"><label for="title">제목</label></p>
                        <p>
                            <input type="text" name="title" id="title" value="${board.title }">
                        </p>
                    </div>
                    <div class="row_user_con">
                        <div class="board_writer">작성자: <span>${board.writer }</span></div>
                        <div>
                        	<span><fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                        	<span class="board_date">조회 ${board.cnt}</span>
                        </div>
                    </div>
                    
                    <div class="row board_txt">
                        <p class="board_tit"><label for="content">내용</label></p>
                        <p>
                            <textarea name="content" id="content" class="txt_area">${board.content }</textarea>
                        </p>
                    </div>
                </div>
                <div class="submit_wrap">
                    <!--                        <input type="hidden" name="page" value="${page}">-->
                    <button type="submit" class="btn_default">게시글 수정</button>
                </div>
                <ul class="btn_list">
                	<li class="btn_2"><a href="insertBoard">새 글 등록</a></li>
                	<li class="btn_3"><a href="deleteBoard?seq=${board.seq }">글 삭제</a></li>
                	<li class="btn_3"><a href="getBoardList">글 목록</a></li>
                </ul>
            </form>
        </section>
    </main>

</body>
</html>