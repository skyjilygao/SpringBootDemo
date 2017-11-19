<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.thymeleaf.org/">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        HttpSession Session = request.getSession();
        String loginName = (String) Session.getAttribute("loginName");
        String userName = (String) Session.getAttribute("userName");
        String roleId = (String) Session.getAttribute("roleId");
        Integer userId = (Integer) Session.getAttribute("userId");
        if (loginName == "" || loginName == null) {
    %>
    <script>
        window.location = "login";
    </script>
    <%
        }
    %>
    <title>员工编辑</title>
</head>
<link rel="stylesheet" href="../../js/jQuery/plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="../../js/jQuery/plugins/font-awesome/css/font-awesome.min.css">
<script src="../../js/jQuery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../../js/jQuery/plugins/layui/layui.js"></script>

<body>
<div style="margin: 15px;">
    <form class="layui-form" action="/Employee/employeeEdit" method="POST">
        <input type="hidden" name="id" value="${user.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="title"
                       autocomplete="off" placeholder="请输入姓名" class="layui-input" value="${user.name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <c:if test="${user.sex eq 'M' || user.sex eq 'm'}">
                    <input type="radio" name="sex" id="M" value="M" title="M" checked/>
                    <input type="radio" name="sex" id="F" value="F" title="F"/>
                </c:if>
                <c:if test="${user.sex eq 'F' || user.sex eq 'f'}">
                    <input type="radio" name="sex" id="M" value="M" title="M"/>
                    <input type="radio" name="sex" id="F" value="F" title="F" checked/>
                </c:if>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="tel" lay-verify="telephone"
                       autocomplete="off" placeholder="请输入电话" class="layui-input" value="${user.tel}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <textarea name="address" placeholder="请输入地址" class="layui-textarea" value="${user.address}">${user.address}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工资</label>
            <div class="layui-input-block">
                <input type="text" name="pay" lay-verify="pay"
                       autocomplete="off" placeholder="请输入工资" class="layui-input" value="${user.pay}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工资年份</label>
            <div class="layui-input-block">
                <input type="text" name="payYear" lay-verify="year"
                       autocomplete="off" placeholder="请输入工资年份" class="layui-input" value="${user.payYear}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工资月份</label>
            <div class="layui-input-block">
                <input type="text" name="payMonth" lay-verify="month"
                       autocomplete="off" placeholder="请输入工资月份" class="layui-input" value="${user.payMonth}">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" type="submit" >立即提交</button>
                <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            </div>
        </div>
    </form>
</div>
<script>

    layui.use(
        [ 'form', 'layedit', 'laydate' ],
        function() {
            var form = layui.form(), layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
            //自定义验证规则
            form.verify({
                title : function(value) {
                    if (value.length < 2) {
                        return '至少得2个字符啊';
                    }
                },
                month : function(value) {
                    if(isNaN(value)){
                        return '请输入正确的数字'
                    }
                    if (value < 1 || value > 12) {
                        return '月份必须在1-12内';
                    }
                },
                year : function(value) {
                    if(isNaN(value)){
                        return '请输入正确的数字'
                    }
                    if (value.length < 4 || value.length > 4) {
                        return '请输入正确的年份（如：2017）';
                    }
                },
            });

        });
</script>
</body>
</html>