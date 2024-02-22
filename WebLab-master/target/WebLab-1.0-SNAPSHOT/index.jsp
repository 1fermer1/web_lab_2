<%@ page import="com.nordwestzap.weblab.dao.AttemptRepository" %>
<%@ page import="com.nordwestzap.weblab.model.Attempt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style><%@include file="style.css"%></style>
    <title>JSP - Hello World</title>
</head>
<body onload="drawG(1)" >
<div class="card-user-den">
    <div class="header-with-image">
        <p>
            Ткачев Илья Андреевич Р3216<br>
            Вариант - 163619
        </p>
    </div>
</div>
<br>
<canvas id="coordinate-system"></canvas>

<div class="card">
    <form  method="post" class="user-form">
        <table class="card">
            <tr>
                <td>
                    <fieldset>
                        <legend>Выберите R:</legend>
                        <select class="button_R" id="param_r" onchange="showValue(value)">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Выберите Y:</legend>
                        <div>
                            <input type="text" name="y" id="y"  required maxlength="12">
                        </div>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                        <legend>Выберите X:</legend>
                        <div>
                            <button type="button" class="x" onclick="showValueX(-2)" >-2</button>
                            <button type="button" class="x" onclick="showValueX(-1.5)" >-1.5</button>
                            <button type="button" class="x" onclick="showValueX(-1)" >-1</button>
                            <button type="button" class="x" onclick="showValueX(-0.5)" >-0.5</button>
                            <button type="button" class="x" onclick="showValueX(0)" >0</button>
                            <button type="button" class="x" onclick="showValueX(0.5)" >0.5</button>
                            <button type="button" class="x" onclick="showValueX(1)" >1</button>
                            <button type="button" class="x" onclick="showValueX(1.5)" >1.5</button>
                            <button type="button" class="x" onclick="showValueX(2)" >2</button>

                            <input type="hidden" id="param_x" name="x" value="" required>
                        </div>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td>
                    <input class="submit-button" type="submit" value="Проверка результата">
                </td>
                <td>
                    <input class="clear_table" type="button" value="Очистить таблицу" onclick="deleteDB()">
                </td>
            </tr>
        </table>
    </form>
</div>
<br>

<table class="table">
    <tr id="result">
<%--        <th>Session ID</th>--%>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Текущая дата и время</th>
        <th>Время работы (мс)</th>
        <th>Попал?</th>
    </tr>
    <%
        AttemptRepository attemptRepository = (AttemptRepository) request.getAttribute("Attempt-Repository");
        for (int i = 0; i < attemptRepository.getAttempts().size(); i++) {
            out.println("<tr>"+
//                "<td>"+ attemptRepository.getAttempts().get(i).getSessionId() +"</td>"+
                "<td>"+ attemptRepository.getAttempts().get(i).getX() +"</td>"+
                "<td>"+ attemptRepository.getAttempts().get(i).getY() +"</td>"+
                "<td>"+ attemptRepository.getAttempts().get(i).getR() +"</td>"+
                "<td>"+attemptRepository.getAttempts().get(i).getAttemptTime()+"</td>"+
                "<td>"+attemptRepository.getAttempts().get(i).getScriptDuration()+"</td>"+
                    "<td>"+attemptRepository.getAttempts().get(i).isHit()+"</td>"+
                "</tr>");
        }
    %>
</table>

</body>
<script><%@ include file="index.js"%></script>
<script><%@ include file="decart.js"%></script>
</html>