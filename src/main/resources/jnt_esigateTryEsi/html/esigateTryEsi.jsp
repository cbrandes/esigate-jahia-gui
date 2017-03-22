<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jcr:node var="attemptNode" path="${currentNode.path}/attemptPart"/>
<jcr:node var="exceptListNode" path="${currentNode.path}/exceptPartList"/>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateTry">
    <legend><fmt:message key="label.esigateTry" /></legend>
    <div class="innerEsi">
</c:if>

<esi:try>
	<template:module node="${attemptNode}" view="default" editable="true"/>
	<template:module node="${exceptListNode}" view="default" editable="true"/>
</esi:try>

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
