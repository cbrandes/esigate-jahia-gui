<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jcr:node var="otherwiseNode" path="${currentNode.path}/otherwise"/>
<jcr:node var="whenListNode" path="${currentNode.path}/whenList"/>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateChoose">
    <legend><fmt:message key="label.esigateChoose" /></legend>
    <div class="innerEsi">
</c:if>

<esi:choose>
	<template:module node="${whenListNode}" view="default" editable="true"/>
	<template:module node="${otherwiseNode}" view="default" editable="true"/>
</esi:choose>

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
