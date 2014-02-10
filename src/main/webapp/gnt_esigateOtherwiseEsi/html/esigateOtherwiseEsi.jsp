<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateOtherwise">
    <legend>ESI : otherwise</legend>
    <div class="innerEsi">
</c:if>

<esi:otherwise>
	<template:area  path="${currentNode.name}" areaAsSubNode="true"/>
</esi:otherwise>

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
