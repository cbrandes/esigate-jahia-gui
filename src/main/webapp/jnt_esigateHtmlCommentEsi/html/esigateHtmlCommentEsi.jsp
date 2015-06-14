<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateComment">
    <legend>ESI : Html Comment</legend>
    <div class="innerEsi">
</c:if>

<!--esi<c:if test="${renderContext.editMode}">--></c:if>
<template:area  path="${currentNode.name}"  areaAsSubNode="true"/>
<c:if test="${renderContext.editMode}"><!--</c:if>-->

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
