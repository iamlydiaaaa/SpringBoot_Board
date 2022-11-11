<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
	<link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/board.css">
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

/* ===== 버튼 공통 끝 ===== */




/* ===================== BoardList 시작 ===================== */
#board_list{
    max-width: 1400px;
}

/* ==== 총xx건 ==== */
.list_total{
    height: 30px;
    line-height: 30px;
    margin-bottom: 20px;
    font-size: 14px;
}
.list_total p{ display: inline-block;}
.list_total p:nth-child(1){float: left;}
.list_total p:nth-child(2){float: right;}
.list_total .btn_default{
    width: 120px; height: 30px;
}
.list_total strong{color: #c39a4c;}

/* ==== 테이블부분 시작 ==== */
.list_table{}

.list_table #tbBox{
    border-top: 2px solid #333;
    font-size: 16px;
    text-align: center;
    color: #555;
    width: 100%;
    max-width: 1400px;
}
#tbBox tr{
    border-bottom: 1px solid #eaeaea;
    cursor: pointer;
}

#tbBox tr:hover{
    background-color: rgba(227, 219, 202, 0.2);
}
#tbBox td{
    height: 90px;
    vertical-align: middle;
}

/*---*/
#tbNum{}
#tbTit{
    overflow: hidden;
    white-space:nowrap;
    text-overflow: ellipsis;
    text-align: left; color: #333;
}
#tbName{
}
#tbDate{
}
#tbStatus{
}
#tbStatus span{
    background-color: #eaeaea;
    padding: 10px 25px;
    border-radius: 40px;
    font-size: 0.8em;
    color: #999;
}
#tbStatus .comment{
    background-color: #f2c26a;
    color: #fff;
}


/*======게시판 번호 넘김 부분======*/
.list_num{
    height: 30px;
    line-height: 30px;
    margin: 50px 0;
}
.list_num ul{
    text-align: center;
}
.list_num li{
    display: inline-block;
    height: 30px;
    color: #777;
}
.list_num li a{
    padding: 0 15px;
    display: block;
    
    border: 1px solid;
}

.list_num li:hover{
    color: #c39a4c;
}
.list_num .l_prev{color: #c39a4c;}
.list_num .l_next{color: #c39a4c;}


/* ==== 테이블부분 끝 ==== */
/* ===================== BoardList 끝 ===================== */
</style>
</head>

<body>
    <main>
        <div class="sec_tit">
            <span>궁금한 내용을 남겨주세요.</span>
            <h2>Q&amp;A</h2>
        </div>
        <section id="board_list">
            <div class="list_total">
                <p>총 <strong>0</strong>건</p>
                <p><button class="btn_default"><a href="insertBoard">글쓰기</a></button></p>
            </div>
            <div class="list_table">
                <table id="tbBox">
                   <colgroup>
                       <col class="col2" width="120px">
                       <col class="col3" width="*">
                       <col class="col4" width="140px">
                       <col class="col5" width="160px">
                       <col class="col6" width="160px">
                   </colgroup>
                   <tbody>
                   <c:forEach var="board" items="${boardList }">
                        <tr>
                            <td id="tbNum">${board.seq }</td>
                            <td id="tbTit"><a href="getBoard?seq=${board.seq }">${board.title }</a></td>
                            <td id="tbName">${board.writer }</td>
                            <td id="tbDate"><fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td id="tbStatus"><span class="comment">답변완료</span></td>
                        </tr>
                   </c:forEach>
                        <tr>
                            <td id="tbNum">1</td>
                            <td id="tbTit">제목제목제목제목</td>
                            <td id="tbName">김*경</td>
                            <td id="tbDate">2022.11.03</td>
                            <td id="tbStatus"><span>답변대기</span></td>
                        </tr>
                        <tr>
                            <td id="tbNum">1</td>
                            <td id="tbTit">제목제목제목제목</td>
                            <td id="tbName">김*경</td>
                            <td id="tbDate">2022.11.03</td>
                            <td id="tbStatus"><span>답변대기</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="list_num">
                <ul>
                    <li class="l_prev"><a href="#">Prev</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li class="l_next"><a href="#">Next</a></li>
                </ul>
            </div>
        </section>
    </main>

</body>
</html>