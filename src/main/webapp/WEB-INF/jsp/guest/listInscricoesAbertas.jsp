<%@ include file="/WEB-INF/includes/jstl.jspf" %>

<!-- este elemento <content> passa o breadcrumbs para o titlebar do layout -->
<content tag="titlebarContent">
    <mocca:title title="Inscri��es Abertas"/>
<%--
    <javalek:pagetitle label="Inscri��es Abertas" defaultIsLabelKey="true">
        <javalek:icon><c:url value="/assets/application/img/icons/iconInscricoesAbertas.png"/></javalek:icon>
        <javalek:breadcrumb label="label.page.mainMenu"><javalek:url><c:url value="/index.html"/></javalek:url></javalek:breadcrumb>
    </javalek:pagetitle>
--%>
</content>

<c:choose>
    <c:when test="${empty edicoes}">
        <see:notice type="info" closeable="true">Nenhuma edi��o com inscri��o aberta foi encontrada</see:notice>
    </c:when>
    <c:otherwise>
        <div class="table-wrapper scrollable bordered rounded shadowed">
            <table class="table striped hovered stroked">
                <thead class="header">
                    <tr>
                        <th class="centered" style="width: 10em;"><fmt:message key="label.options"/></th>
                        <th class="centered"><fmt:message key="label.event"/></th>
                        <th class="centered"><fmt:message key="label.number"/></th>
                        <th class="centered" style="width: 20em;"><fmt:message key="label.theme"/></th>
                        <th class="centered"><fmt:message key="label.subscriptionPeriod"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${edicoes}" var="edicao">
                        <tr>
                            <td class="centered">
                                <c:url var="inscricao_url" value="/guest/formInscricao.html"><c:param name="idEdicao" value="${edicao.id}"/></c:url>
                                <button type="button" class="btn small" title="Fazer inscri��o" onclick="location.href = '${inscricao_url}';"><i class="icon-ok"></i> Inscrever-se</button>
                            </td>
                            <td class="centered">${edicao.evento.nome}</td>
                            <td class="centered">${edicao.numero}</td>
                            <td class="centered">${edicao.tema}</td>
                            <td class="centered">
                                <%--
                                de <see:formatPeriod value="${edicao.periodoInscricao}" pattern="i18n.dateFormat.java" isPatternKey="true"/>
                                --%>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>
