<%@ include file="/WEB-INF/includes/jstl.jspf" %>

<!-- este elemento <content> passa o breadcrumbs para o titlebar do layout -->
<content tag="titlebarContent">
    <javalek:pagetitle label="Relat�rios - Lista de Eventos" defaultIsLabelKey="true">
        <javalek:icon><c:url value="/assets/application/img/icons/iconRelatorios.png"/></javalek:icon>
        <javalek:breadcrumb label="label.page.mainMenu"><javalek:url><c:url value="/admin/menu.html"/></javalek:url></javalek:breadcrumb>
    </javalek:pagetitle>
</content>

<c:choose>
    <c:when test="${empty eventos}">
        <see:notice type="info" closeable="true">N�o h� eventos cadastrados</see:notice>
    </c:when>
    <c:otherwise>
        <div class="row-fluid">
            <display:table id="evento" name="eventos" pagesize="10" requestURI="/admin/relatorio/listEvento.html" class="table table-striped table-condensed">                    
                <display:column media="html" titleKey="label.options" class="twoOption centered" headerClass="centered">
                    <c:url var="list_edicao_url" value="/admin/relatorio/listEdicao.html"><c:param name="idEvento" value="${evento.id}"/></c:url>   
                    <button type="button" class="btn btn-mini" title="Ir para edi��es deste evento" onclick="location.href = '${list_edicao_url}';"><i class="icon-plus"></i></button>                     
                </display:column>
                <display:column titleKey="label.name" property="nome" class="centered" headerClass="centered"/>
                <display:column titleKey="label.acronym" property="sigla" class="centered" headerClass="centered"/>
            </display:table>
        </div>
    </c:otherwise>  
</c:choose>

