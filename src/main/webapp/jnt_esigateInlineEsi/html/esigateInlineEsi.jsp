<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jcr:nodeProperty node="${currentNode}" name="fragmentName" var="fragmentName"/>
<jcr:nodeProperty node="${currentNode}" name="fetchable" var="fetchable"/>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateInline">
    <legend title="fragmentName : ${fragmentName.string} - fetchable : ${fetchable.boolean}"><fmt:message key="label.esigateInline"/></legend>
    <div class="innerEsi">
</c:if>

<esi:inline name="${fragmentName.string}" fetchable="${fetchable.boolean}">
	<template:area  path="${currentNode.name}"  areaAsSubNode="true"/>
</esi:inline> 

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
