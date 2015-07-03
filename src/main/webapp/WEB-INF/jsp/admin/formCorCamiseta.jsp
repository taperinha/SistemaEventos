<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes/jstl.jspf" %>

<mocca:title title="Cadastrar Cor de Camiseta"/>

<see:notice type="success" visible="${!empty message}" closeable="true">${message}</see:notice>
<fmt:message var="confirmDeleteMsg" key="message.confirm.delete"/>

<mocca:title title="Formulário de cadastro" isTitleKey="false" level="2"/>
<form:form commandName="command">
    <div class="row">
        <div class="span4">
            <see:formField label="label.description" isLabelKey="true" isMandatory="true" path="descricao" maxlength="30"/>
        </div>
    </div>
    <see:formButtonGroup putSubmit="true" clearUrl="formCorCamiseta.html"/>
</form:form>

<mocca:title title="Cores de camisetas cadastradas" isTitleKey="false" level="2"/>
<div class="table-wrapper scrollable bordered rounded shadowed">
    <table class="table hovered striped stroked small-font-size">
        <thead class="header">
            <tr>
                <th class="centered" style="width: 2em;"><fmt:message key="label.options"/></th>
                <th><fmt:message key="label.description"/></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cor" items="${coresCamiseta}">
            <tr>
                <td>
                    <c:url var="edit_url" value="/admin/formCorCamiseta.html"><c:param name="idCor" value="${cor.id}"/></c:url>
                    <c:url var="delete_url" value="/admin/formCorCamiseta.html"><c:param name="idCor" value="${cor.id}"/></c:url>
                    <div class="btn-group small">
                        <button type="button" class="btn" title="Editar" onclick="location.href = '${edit_url}';"><i class="icon-edit"></i></button>
                        <button type="button" class="btn" title="Deletar" onclick="confirmRedir('${delete_url}', '${confirmDeleteMsg}');"><i class="icon-trash"></i></button>
                    </div>
                </td>
                <td>${cor.descricao}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<see:formButtonGroup putSubmit="false" backUrl="menuCamisetas.html"/>

<script type="text/javascript">
    $(document).ready(function () {
        $("#descricao").focus();
    });
</script>
